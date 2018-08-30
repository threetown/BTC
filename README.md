## BTC

### 一、技术栈

* ThinkPHP 3.2 + MySQL
* ionic + Base64



### 二、业务逻辑

#### 2.1 配置信息

* URL：`index/index/getchart.html`

  

#### 2.2 商品行情 

* URL： `/index/index/ajaxindexpro`
* JS：`js/lk/index.js` 中的 `ajaxpro()`函数



#### 2.3 奖金记录推送

* URL：`/index/index/ajax_order`

* JS：

  ```javascript
  function order_start(){
      var rand = Math.ceil(Math.random()*100);
      if(rand>=80){
          if(order_list!=null){
              order_show();
          }
      }
  }
  ```

  





### 接口

#### 1.  

* `/index/index/getchart.html`

  ```php
  public function getchart()
      {
          $data['hangqing'] = '商品行情';
          $data['jiaoyijilu'] = '交易记录';
          $data['shangpinmingcheng'] = '商品名称';
          $data['xianjia'] = '现价';
          $data['zuidi'] = '最低';
          $data['zuigao'] = '最高';
          $data['xianjia'] = '现价';
          $data['xianjia'] = '现价';
  
          $res = base64_encode(json_encode($data));
          return $res;
      }
  ```

* 前端编译

  ```javascript
  jQuery.parseJSON(Base64.decode(_res)); 
  
  // output
  {hangqing: "商品行情", jiaoyijilu: "交易记录", shangpinmingcheng: "商品名称", xianjia: "现价", zuidi: "最低",zuigao:"最高"}
  ```

  

#### 2. 

* `/index/index/ajaxindexpro`

  ```php
  public function ajaxindexpro()
      {
      	//获取产品信息
          $pro = Db::name('productinfo')->alias('pi')->field('pi.pid,pi.ptitle,pd.Price,pd.UpdateTime,pd.Low,pd.High')
          		->join('__PRODUCTDATA__ pd','pd.pid=pi.pid')
          		->where('pi.isdelete',0)->order('pi.pid desc')->select();
          $newpro = array();
          foreach ($pro as $k => $v) {
          	$newpro[$v['pid']] = $pro[$k];
          	$newpro[$v['pid']]['UpdateTime'] = date('H:i:s',$v['UpdateTime']);
          	
          	if($v['Price'] < cookie('pid'.$v['pid']) ){  //跌了
          		$newpro[$v['pid']]['isup'] = 0;
          	}elseif($v['Price'] > cookie('pid'.$v['pid']) ){  //涨了
          		$newpro[$v['pid']]['isup'] = 1;
          	}else{  //没跌没涨
          		$newpro[$v['pid']]['isup'] = 2;
          	}
              
          	cookie('pid'.$v['pid'],$v['Price']);
          }
  
          return base64_encode(json_encode($newpro));
      }
  ```

  

* 前端

  ```json
  {
      "6":{ "pid":6,
          "ptitle":"美元/欧元",
          "Price":"145.242",
          "UpdateTime":"02:10:02",
          "Low":"142.79",
          "High":"145.51",
          "isup":2
      },
      "7":{
          "pid":7,
          "ptitle":"英镑/美元",
          "Price":"1.30097",
          "UpdateTime":"02:10:02",
          "Low":"1.2844",
          "High":"1.30145",
          "isup":2
      },
      "8":{
          "pid":8,
          "ptitle":"澳元/加元",
          "Price":"0.94351",
          "UpdateTime":"02:10:02",
          "Low":"0.94102",
          "High":"0.94965",
          "isup":2
      },
      "9":{
          "pid":9,
          "ptitle":"欧元英镑",
          "Price":"0.8993",
          "UpdateTime":"02:10:02",
          "Low":"0.8986",
          "High":"0.90915",
          "isup":2
      },"10":{"pid":10,"ptitle":"英镑/澳元","Price":"1.78187","UpdateTime":"02:10:02","Low":"1.75046","High":"1.78535","isup":2},"11":{"pid":11,"ptitle":"英镑/加元","Price":"1.68137","UpdateTime":"02:10:02","Low":"1.65928","High":"1.68535","isup":2},"13":{"pid":13,"ptitle":"美元/日元","Price":"111.646","UpdateTime":"02:10:02","Low":"111.09","High":"111.829","isup":2},"14":{"pid":14,"ptitle":"国际黄金","Price":"1205.423","UpdateTime":"02:10:02","Low":"1200.90","High":"1207.05","isup":2},"16":{"pid":16,"ptitle":"莱特币","Price":"55.38","UpdateTime":"02:10:02","Low":"60.22","High":"63.62","isup":2},
      "23":{
          "pid":23,
          "ptitle":"比特币",
          "Price":"7012.92",
          "UpdateTime":"02:10:02",
          "Low":"6914.06",
          "High":"7131.35",
          "isup":2
      }
  }
  ```

  

