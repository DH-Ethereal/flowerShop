
$(function(){
    //获取点击事件的对象
    $(".nav_bar span").click(function(){
        //获取显示或隐藏的对象
        var divShow = $(".content").children('.zs');
        //判断当前对象是否被选中，如果未被选中进入循环
        if(!$(this).hasClass('nav_barFirst')){
            //获取当前索引
            var index = $(this).index();
            //选中一个其他被移除样式sibling兄弟
            $(this).addClass('nav_barFirst').siblings('span').removeClass('nav_barFirst');
            //索引对应div块显示
            $(divShow[index]).show();
            //其他隐藏
            $(divShow[index]).siblings('.zs').hide();
        }
    });
});
//按钮减,next()下一个,eval,拼接id名
$(function(){
    for (var i = 0;i<$("#max_i").val();i++){
        $(eval("dec"+i)).click(function(){
            $(this).next().val(parseInt($(this).next().val())-1);
        });
    }
});

//按钮加,prev()上一个
$(function(){
    for (var i = 0;i<$("#max_i").val();i++){
        $(eval("inc"+i)).click(function(){
            $(this).prev().val(parseInt($(this).prev().val())+1);
        });
    }
});

//取消点击事件最少不为1，最多不超过商品数量
$(document).ready(function(){
    for (var i = 0;i<$("#max_i").val();i++){
        if ($(eval("dec"+i)).next().val()<=1){
            $(eval("dec"+i)).addClass('disable');
        }
        if ($(eval("inc"+i)).prev().val()==$(eval("amount_max"+i)).val()){
            $(eval("inc"+i)).addClass('disable')
        }
    }
});





