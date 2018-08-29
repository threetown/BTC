<?php
ini_set('date.timezone','Asia/Shanghai');
$a=date('Y-m-d',time());
$atime=strtotime($a);
//time()-$atime>1322
$date=date('H',time());
$b=1322/60;
$useritem_time2 = DateAdd("d",1, date('Y-m-d H:i:s',time()));
echo $useritem_time2;
?>