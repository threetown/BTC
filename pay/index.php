<?php
header("Content-type:text/html;charset=utf-8");
ini_set('date.timezone','Asia/Shanghai');

$id = '2386';//商户ID
$key = 'ed681704842045498ccb3c32fb58b426';//商户秘钥
$url = 'http://pay.huiqingpay.com/chargebank.aspx';//服务器地址
$partner = $id;

$callbackurl = 'http://p.bxp8.com/action/pinganfu/notifytzw.php';
$ordernumber=ordernumber();
$amount='2.10';
$paymoney = number_format($amount,2);
$type="1006";
$signpart="parter={$partner}&type={$type}&value={$paymoney}&orderid={$ordernumber}&callbackurl={$callbackurl}";
$sign=md5($signpart.$key);
$ip=getIp();
$url="http://pay.huiqingpay.com/chargebank.aspx?{$signpart}&refbackurl=http://www.example.com/notifyAction&payerIp={$ip}&attach=ekapay&sign={$sign}";
echo $url;
exit();






//返回充值订单号
function ordernumber(){
	return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}
function getIp()
{ //取IP函数
    static $realip;
    if (isset($_SERVER)) {
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $realip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $realip = isset($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : $_SERVER['REMOTE_ADDR'];
        }
    } else {
        if (getenv('HTTP_X_FORWARDED_FOR')) {
            $realip = getenv('HTTP_X_FORWARDED_FOR');
        } else {
            $realip = getenv('HTTP_CLIENT_IP') ? getenv('HTTP_CLIENT_IP') : getenv('REMOTE_ADDR');
        }
    }
    return $realip;
}
?>
