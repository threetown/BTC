<?php
  // $post= json_encode($_POST);
 // $ppos = json_decode($post,true);
   // $file = fopen("notifyurl.txt",'w');
   // fwrite($file,var_export($ppos,true));
   // fclose($file);
   // echo "SUCCESS";
  // die;
header("Content-type:text/html;charset=utf-8");
include("../../include/conn_1.php");
include("../../include/function.php");
include("../../include/public.php"); 
$id = '17288';//商户ID
$key = 'b87d90c20e924b511ea6270642ee83a1';//商户秘钥
//{"partner":"17288","ordernumber":"2018062817074248","orderstatus":"1","paymoney":"1.00","sysnumber":"HX172881806281707620","attach":"","sign":"30b9f511b6b5e051e74802d27a165535"}
$partner=$_REQUEST['partner'];
$ordernumber=$_REQUEST['ordernumber'];
$orderstatus=$_REQUEST['orderstatus'];
$paymoney=$_REQUEST['paymoney'];
$sysnumber=$_REQUEST['sysnumber'];
$attach=$_REQUEST['attach'];
$sign=$_REQUEST['sign'];

$mysign=md5("partner={$partner}&ordernumber={$ordernumber}&orderstatus={$orderstatus}&paymoney={$paymoney}{$key}");

file_put_contents('log.txt',json_encode($_POST));
file_put_contents('getlog.txt',json_encode($_GET));
file_put_contents('rlog.txt',json_encode($_REQUEST));
if($sign==$mysign){
    if($orderstatus=='1'){
		$sqlsc = "select username,amount,status,ordernumber from  {$db_prefix}member_order where ordernumber = '".$ordernumber."' and status=0";
		$rssc = $db->get_one($sqlsc);
		if($rssc){
		
			$totalAmount=$paymoney;
			if($rssc['amount']==$totalAmount){
				$addamount    = $rssc['amount'];
				$username  	  = $rssc['username'];
				$tradeNo	  = $sysnumber;
				//增加积分
				$sql_amo = "update {$db_prefix}member set amount = amount + {$addamount}  where  username = '".$username."'";
				$rs_amo  =$db->query($sql_amo);
				//更新状态，插入记录
				$sql_lgn = "update {$db_prefix}member_order set status = 1,paytime = '".time()."',accNo = '".$tradeNo."'  where  ordernumber = '".$ordernumber."'";
				$rs_plus =$db->query($sql_lgn);
				if( $rs_amo && $rs_plus){
				 echo 'ok';
				 exit;
				}
			}
		}
        
    } else {
      //  echo 'fail';
    }
}
echo 'ok';
?>
