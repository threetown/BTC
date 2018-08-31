/**
 * 持仓&历史明细
 */
var resorderlist = {};
var proprice = {};
var page = 1;
var ispage = 1;
var is_ajax_list = 0;
var timer_orderlist = '';
var listionhajax = '';

//hold_order_list();
//change_category(0);
var _sell_time = 0;
var _ftime = 0;
var html_type = 1;






/**
 * 切换按钮
 * @param  {[type]} type [description]
 * @return {[type]}      [description]
 */
function change_category(type){

  $('.slider-right').css('transition-duration','300ms');
  $('.slider-left').css('transition-duration','300ms');
  if(type == 0){
    page = 1;
    price_list(0)
    $('.uls').html(' ');
    $('.slider-left').css('transform','translate(0px, 0px) translateZ(0px)');
    $('.slider-right').css('transform','translate(100%, 0px) translateZ(0px)');
    $('.left-table').addClass('active');
    $('.right-table').removeClass('active');
  }

  if(type == 1){
    //listionhajax = setInterval("listionh()",1000);
    page = 1;
	price_list(1);
    $('.slider-left').css('transform','translate(-100%, 0px) translateZ(0px)');
    $('.slider-right').css('transform','translate(0px, 0px) translateZ(0px)');
    $('.right-table').addClass('active');
    $('.left-table').removeClass('active');
  }

}







function price_list(type) {
    

    var url = "/index/user/pricelist?page="+page+'&type='+type;
    var html = '';

    $.get(url,function(resdata){
        
        resdata = jQuery.parseJSON(Base64.decode(resdata));
		//console.log(resdata);
        var res_list = resdata.data;
        if(res_list.length == 0){
            clearInterval(listionhajax);
            return;
        }
        $.each(res_list,function(k,v){

        
        
            console.log(v);
            
            var closeprice = 0;
            var closeprice_class = 'in_money';

            if(v.ptype == 0){
                var ostyle_class = "buytop";
                var ostyle_name = "余额";
            }else{
                var ostyle_class = "buydown";
                var ostyle_name = "代售";
            }

            html += '<li ng-repeat="o" >\
                        <section>\
                            <p>\
                                <span class="ng-binding">'+v.title+'</span>\
                            </p>\
                            <p class="ng-binding">'+v.content+'</p>\
                        </section><section>\
                            <p class="ng-binding '+closeprice_class+'">'+v.account+'</p>\
                            <p class="ng-binding">'+getLocalTime(v.time)+'</p>\
                        </section>\
                    </li>';
            
            
            
            
        
    })	
		if(type=='1'){
			$('.trade_history_list .slider-right .uls').append(html);
		}else{
			$('.trade_history_list .slider-left .uls').append(html);
			
		}
        
        html = '';
       // page++;
        //is_ajax_list = 0;

    })

}




