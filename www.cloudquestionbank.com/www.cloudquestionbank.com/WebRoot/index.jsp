<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${uid!=null}">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
<html style=" background: -webkit-linear-gradient( #FFFAF0 ,black, #FFFAF0 );background: -o-linear-gradient( #FFFAF0 ,black, #FFFAF0 );background: -moz-linear-gradient( #FFFAF0 ,black, #FFFAF0 );background: linear-gradient( #FFFAF0 ,black, #FFFAF0 );">
	
	<head>
	<script type="text/javascript" src="ST/yanglu/js/jquery-1.4.2.min.js" ></script>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">  
		<title>云题库</title>
		<%-- <jsp:include page="./CurriculumChoice.jsp" flush="true">
			<jsp:param value="" name=""/>
		</jsp:include> --%>
		<!--引入样式-->
		<link rel="stylesheet" href="ST/yanglu/css/index.css" />
		<link rel="stylesheet" href="ST/layui/css/layui.css"  media="all"/>
		<script src="ST/layui/layui.js" charset="utf-8"></script>
	<!-- <script src="ST/yanglu/js/index.js" charset="utf-8"></script> -->
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	
	<link rel="stylesheet" type="text/css" href="ST/yanglu/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="ST/yanglu/css/default.css"/>
    <link rel="stylesheet" href="ST/yanglu/css/main.css"/>
    <!-- 加载时数据 -->
   
    <script>
    /*
    	$(function(){
    	 $.ajax({
          async:true,
          cache:false,
          timeout:8000,
          type:"POST",
          url:"result.php",
          data:{a:'123'},
          error:function(jqXHR, textStatus, errorThrown){
            if(textStatus=="timeout"){
              location.href="error.jsp";
            }else{
              alert("登录成功！！");
            }
          },
          success:function(msg){
            $("#tips").html(msg);
          }
        });
    	});
    	*/
    	
    </script>
    <script>
    $(function(){
    
    	/*
    	$.confirm1()
    	//自定义弹出框
    	$.confirm1({
			    title: '严重警告!',
			    content: '警告!其他用户正在登录!你的账号存在盗号风险!将在6秒后自动跳转至登录界面!',
			    autoClose: 'cancel|6000',
			    confirm: function(){
			       location.href="Login.jsp";
			    },
			    cancel:function(){
			        alert('canceled');
			    }
			});
    	$.confirm({
    			keyboardEnabled: true,
    			content: 'Press "A" to confirm or "B" to cancel. <input type="text" placeholder="typing a or b will close the modal"/>',
   				 confirmKeys: [65],
   				 cancelKeys: [66],
   				 cancel: function () {
      				  $.alert('canceled');
   				 },
  			  confirm: function () {
      			  $.alert('confirmed');
    			 }
			});
			*/
    })
    </script>
	<script>
		$(function(){
			if($(window).width()>=1200){
				$(".ih-item").css("height","100%");  	
			}
			if($(window).width()<=800){
				$(".ih-item").css("height","50%");  	
			}
			$(window).resize(function () {      
					//console.log($("body").width());  
					if($("body").width()<=800){
				    	$(".ih-item").css("height","50%");  
				    }if($("body").width()>800 && $(window).width()<=1200){
						$(".ih-item").css("height","50%"); 
						
				    }if($(window).width()>=1200){
				    	$(".ih-item").css("height","100%");  
				    	
				    }
			});
		})
	</script>
	<link rel="stylesheet" type="text/css" href="ST/yanglu/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="ST/yanglu/css/default.css"/>
    <link rel="stylesheet" href="ST/yanglu/css/main.css"/>
	<script>
		$(function(){
			if($(window).width()>=1200){
				$(".ih-item").css("height","100%");  
				$("#cadan").show();
		    	$("#cadan1").hide();
			}
			if($(window).width()<=1200){
				$("#cadan").hide();
		    	$("#cadan1").hide();
				if($(window).width()>400 ){
		    		$(".ih-item").css("height","50%");
		    		$(".col-sm-6").css("min-height","50%");
		    	}else{
		    		$(".ih-item").css("height","25%");
		    	}	
			}
			$(window).resize(function () {      
					if($("body").width()<=800){
				    	$("#cadan").hide();
				    	$("#cadan1").hide();
				    	if($("body").width()>400){
				    		$(".ih-item").css("height","50%");
				    		$(".col-sm-6").css("min-height","50%"); 
				    		
				    	}else{
				    		$(".ih-item").css("height","25%");
				    		$(".col-sm-6").css("min-height","25%");  
				    	}
				    	//
				    }if($("body").width()>800 && $("body").width()<=1960){
						if($("body").width()>960){
							$(".ih-item").css("height","100%"); 
							$(".col-sm-6").css("min-height","50%");
						}else{
							$(".ih-item").css("height","50%"); 
							$(".col-sm-6").css("min-height","50%");
						}
						
				    }
			});
		})
	</script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 <script src="ST/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['element', 'layer'], function(){
  var element = layui.element;
  var layer = layui.layer;
  
  //监听折叠
  element.on('collapse(test)', function(data){
  	var r= "!!!";
    layer.msg('展开状态：'+ r);
  });
});
</script>
<link rel="stylesheet" href="ST/zms/css/CurriculumCoice.css"  media="all">
<script>
$(function(){
<%-- $(window).bind('beforeunload',function(){
alert($uid)
$.post("<%=request.getContextPath()%>/zhixiao?guest.guestId="+$uid+"",
    	function(date){
    		if(date["status"]!=null){
    			location.href="login.jsp";
    		}
    	}
    	);
    	return '您输入的内容尚未保存，确定离开此页面吗？';
}); --%>
 //网页关闭事件

var $uid=$("#uid").val();
    if($uid!=""){
	   		 $("#kc").live("click",function(){
				$.post("<%=request.getContextPath()%>/Guest_courseFind?guest.guestId="+$uid+"",
						function(date){
						var obj = eval(date);
							$.each(obj.countlist,function(i,o){
								console.log(o[0]+""+o[1]+""+o[3]+""+o[5]);
							});
						}
					);
			});
			
			var kec = [];
			var sid=[]; var kc = [];
			//这里是定义接收第一级的数据
    	$.post("<%=request.getContextPath()%>/Guest_loginfind?guest.guestId="+$uid+"",
    	function(date){
	    	var obj = eval(date);
	    	
	    	$("#item-a-kc dd").remove();
	    		$.each(obj.mainlist,function(i,o){
		    		$("#uname").html(o[8]);
		    		$("#uimg").attr("src",o[9]);
		    		kec[kec.length] =o[23];
	    		});
	    		for (var j = 0; j < kec.length; j++) {
						$("#item-a-kc").append("<dd><a id='kc' class='layui-btn site-demo-active layui-bg-gray' lay-id='a"+j+"'  data-type='tabAdd'>"+kec[j]+"</a></dd>");
				}
	    	//console.log(kec[0]);
    	});
    	}else{
    	$("#uname").html("请登录");
    	}
    	$("#zhuxiao").click(function(){
    	
    	$.post("<%=request.getContextPath()%>/Guest_zhixiao?guest.guestId="+$uid+"",
    	function(date){
    		if(date["status"]==1){
    			//confirm1("警告！其他用户正在登录!你的账号存在盗号风险！");
    		}else{
    			location.href="index.jsp";
    		}
    	}
    	);
    	});
    	//第一阶段的点击事件
    	//kc[]!!!!
    	$("#Get-into").live("click",function(){
    			$(window).unbind('beforeunload');
    			$("body").append("<div class='body-div' style='width:100%;height:100%;background:black;opacity:0.6;position: absolute;top:0px'>\
    			</div><div class='body-div2' style='width:100%;height:500px; background: -webkit-linear-gradient(left, black,#FFFAF0 , black);background: -o-linear-gradient(right,black,  #FFFAF0 , black);background: -moz-linear-gradient(right, black, #FFFAF0 , black);background: linear-gradient(to right, black,#FFFAF0 , black); opacity:1;position: absolute;top:200px;'><iframe id='iframeId'name='iframeName' class='tuxing1' src='./CurriculumChoice.jsp?course.courseName="+kc[0]+"&&course.stageId="+sid[0]+"' height='400px' width='100%'  frameborder='0' scrolling='auto'></iframe>\
    			</div><p class='close-p' style='width:100px;height: 40px;line-height:40px;border-radius:10px;text-align: center;color: white;background-color: red;box-shadow:0 0 20px red;position: absolute;right: 0px;top:160px;'>关闭</p>");
    			
    			$(".close-p").live("click",function(){
    			$(".body-div").remove();
    			$(".body-div2").remove();
    			$(".close-p").remove();
    			});
    	});
    	$("#Get-into1").live("click",function(){
    		$(window).unbind('beforeunload');
    			$("body").append("<div class='body-div' style='width:100%;height:100%;background:black;opacity:0.5;position: absolute;top:0px'>\
    			</div><div class='body-div2' style='width:100%;height:500px;background: -webkit-linear-gradient(left, black,#FFFAF0 , black);background: -o-linear-gradient(right,black,  #FFFAF0 , black);background: -moz-linear-gradient(right, black, #FFFAF0 , black);background: linear-gradient(to right, black,#FFFAF0 , black);opacity:1;position: absolute;top:100px'><iframe id='iframeId'name='iframeName' class='tuxing1' src='./CurriculumChoice.jsp?course.courseName="+kc[1]+"&&course.stageId="+sid[1]+"' height='400px' width='100%'  frameborder='0' scrolling='auto'></iframe>\
    			</div><p class='close-p' style='width:100px;height: 40px;line-height:40px;border-radius:10px;text-align: center;color: white;background-color: red;box-shadow:0 0 20px red;position: absolute;right: 0px;top:100px;'>关闭</p>");
    			$(".close-p").live("click",function(){
    			$(".body-div").remove();
    			$(".body-div2").remove();
    			$(".close-p").remove();
    			});
    	});
    	$("#Get-into2").live("click",function(){
    		$(window).unbind('beforeunload');
    			$("body").append("<div class='body-div' style='width:100%;height:100%;background:black;opacity:0.5;position: absolute;top:0px'>\
    			</div><div class='body-div2' style='width:100%;height:500px;background: -webkit-linear-gradient(left, black,#FFFAF0 , black);background: -o-linear-gradient(right,black,  #FFFAF0 , black);background: -moz-linear-gradient(right, black, #FFFAF0 , black);background: linear-gradient(to right, black,#FFFAF0 , black);opacity:1;position: absolute;top:100px'><iframe id='iframeId'name='iframeName' class='tuxing1' src='./CurriculumChoice.jsp?course.courseName="+kc[2]+"&&course.stageId="+sid[2]+"' height='400px' width='100%'  frameborder='0' scrolling='auto'></iframe>\
    			</div><p class='close-p' style='width:100px;height: 40px;line-height:40px;border-radius:10px;text-align: center;color: white;background-color: red;box-shadow:0 0 20px red;position: absolute;right: 0px;top:100px;'>关闭</p>");
    			$(".close-p").live("click",function(){
    			$(".body-div").remove();
    			$(".body-div2").remove();
    			$(".close-p").remove();
    			});
    	});
/* function currentTime(){ 
    var d=new Date(),str=''; 
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+= d.getSeconds()+'秒'; 
    return str; 
} 
setInterval(function(){$('#time').html(currentTime)},1000);  */
var now_time="";
showTime();

function showTime(){ 
    var show_day=new Array('星期一','星期二','星期三','星期四','星期五','星期六','星期日'); 
    var time=new Date(); 
    var year=time.getFullYear(); 
    var month=time.getMonth(); 
    var date=time.getDate(); 
    var day=time.getDay(); 
    var hour=time.getHours(); 
    var minutes=time.getMinutes(); 
    var second=time.getSeconds(); 
    month<10?month='0'+month:month; 
    month=month+1; 
    hour<10?hour='0'+hour:hour; 
    minutes<10?minutes='0'+minutes:minutes; 
    second<10?second='0'+second:second; 
     now_time='当前时间：'+year+'年'+month+'月'+date+'日'+' '+show_day[day-1]; 
	//setTimeout("showTime()",1000); 
	//alert(now_time);
	//setInterval("showTime();",1000); 
	//$(".benban_div").html('当前时间：'+year+'年'+month+'月'+date+'日'+' '+show_day[day-1]+' '+hour+':'+minutes+':'+second);
} 
//window.setInterval(showTime,100);
layui.use(['util', 'laydate', 'layer','carousel','code','element','flow','form','jquery','laydate','layedit','laypage','laytpl','mobile','table','tree','upload'], function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  

var $ = layui.jquery,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  //触发事件
  var active = {
    tabAdd: function(){
      //新增一个Tab项
      var $text =$(this).html();
       var id=$(this).attr("lay-id");
       var txt=$("#tab_title li").text();
      
       var tm = [];
         $.ajaxSetup({async:false});
        $.post("<%=request.getContextPath()%>/Guest_courseFind?guest.guestId="+$uid+"",
    	function(date){
					var obj = eval(date);
					$.each(obj.countlist,function(i,o){
					sid[sid.length] =o[7];
					kc[kc.length] =o[5];
					tm[tm.length] =o[3];
					});
	    	//console.log(kec[0]);
    	
      // alert($text+txt);
       //alert(txt.indexOf($text));
       if(txt.indexOf($text)<0){//如果不重复则添加
          //  $(".js_box_head ul").append(the_li);
            if($text=='ACCP7.0S2'){
            	//alert($text)
             element.tabDelete('demo', 'a1');
      		element.tabAdd('demo', {
       		 title: $text //用于演示
        	 	,content:'<div class="layui-tab-content" id="nei_rong1">'+
'<div class="layui-tab-item layui-show" id="neirong_1">课程题标'+
	'<div class="layui-row">'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12" >'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect8"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="./img/phone13.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>'+kc[0]+'</h3>'+
		                    '<p>完成'+tm[0]+'道<br /><br /><i id="Get-into" style="color:red;text-align: center;">进入</i></p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect7"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="./img/phone14.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>'+kc[1]+'</h3>'+
		                    '<p>完成'+tm[1]+'道<br /><br /><i id="Get-into1" style="color:red;text-align: center;">进入</i></p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect10 left_to_right"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="./img/phone12.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                   '<h3>'+kc[2]+'</h3>'+
		                    '<p>完成'+tm[2]+'道<br /><br /><i id="Get-into2" style="color:red;text-align: center;">进入</i></p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		           '<div class="ih-item square effect15 right_to_left"><a href="javascript:void(0)">'+
		                '<div class="img"></div>'+
		                '<div class="info">'+
		                    '<h3>其他</h3>'+
		                    '<p>有待开发</p>'+
		               '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
	'</div>'+
	'</div>'+
				'</div>'+
				'</div>'+
	'</div>'
        	 //,url:'ceshi.html'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		})
      		 var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
           }
            var $cuotis='';
            var listStageS1=[];
            var listCountS1=[];
             $.ajaxSetup({async:false});
            if($text=='ACCP7.0S1'){
             
           $.post("<%=request.getContextPath()%>/Guest_courseFind2?guest.guestId="+<%=session.getAttribute("uid")%>,success,"json");
           function success(data){
          
           	var obj= eval(data);
           		if(data["count2"]=='12'){
           		alert('尚未添加课程！！！');
           		$cuotis='尚未添加课程！！！';
           			layer.msg("课程暂为购买！！！");
           			
           		}else{
           			$.each(obj.countlist2,function(i,o){
           			listStageS1[listStageS1.length]=o[5];
           			listCountS1[listCountS1.length]=0[3];
           			})
           			$cuotis='<div class="layui-tab-content" id="nei_rong1">'+
'<div class="layui-tab-item layui-show" id="neirong_1">课程题标'+
	'<div class="layui-row">'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12" >'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect8"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="./img/phone13.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>'+listStageS1[0]+'</h3>'+
		                    '<p>完成'+listCountS1[0]+'道<br /><br /><i id="Get-into" style="color:red;text-align: center;">进入</i></p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect7"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="./img/phone14.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>'+listStageS1[1]+'</h3>'+
		                    '<p>完成'+listCountS1[1]+'道<br /><br /><i id="Get-into1" style="color:red;text-align: center;">进入</i></p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect10 left_to_right"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="./img/phone12.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                   '<h3>'+listStageS1[2]+'</h3>'+
		                    '<p>完成'+listCountS1[2]+'道<br /><br /><i id="Get-into2" style="color:red;text-align: center;">进入</i></p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		           '<div class="ih-item square effect15 right_to_left"><a href="javascript:void(0)">'+
		                '<div class="img"></div>'+
		                '<div class="info">'+
		                    '<h3>其他</h3>'+
		                    '<p>有待开发</p>'+
		               '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
	'</div>'+
	'</div>'+
				'</div>'+
				'</div>'+
	'</div>';
           		}
           	}
           
      		element.tabAdd('demo', {
       		 title: $text,content:$cuotis,id:id})
       		  var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
       		 }
           if($text=='分类自测'){
      		element.tabAdd('demo', {
       		 title: $text //用于演示
        	 	,content:'<div class="layui-tab-content" id="nei_rong1">'+
'<div class="layui-tab-item layui-show" id="neirong_1">内容1'+
	'<div class="layui-row">'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12" >'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect8"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="ST/yanglu/img/4.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>专业技能型</h3>'+
		                    '<p>完成0道进入</p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect7"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="ST/yanglu/img/5.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>Heading here</h3>'+
		                    '<p>Description goes here</p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		            '<div class="ih-item square effect10 left_to_right"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="ST/yanglu/img/4.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>Heading here</h3>'+
		                    '<p>Description goes here</p>'+
		                '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
		'<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">'+
			'<div class="col-sm-6">'+
		           '<div class="ih-item square effect15 right_to_left"><a href="javascript:void(0)">'+
		                '<div class="img"><img src="ST/yanglu/img/4.jpg" alt="img"></div>'+
		                '<div class="info">'+
		                    '<h3>Heading here</h3>'+
		                    '<p>Description goes here</p>'+
		               '</div>'+
		            '</a></div>'+
		        '</div>'+
		'</div>'+
	'</div>'+
	'</div>'+
				'</div>'+
				'</div>'+
	'</div>'
        	 //,url:'ceshi.html'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		})
      		 var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           if($text=='本班排行'){
           	element.tabAdd('demo', {
       		 title: $text //用于演示
        	 ,content:'<div class="benban_div">'+now_time+'</div><div class="layui-btn-group" style="position: absolute;right:0px;">'+
    '<button class="layui-btn">本周榜</button>'+
    '<button class="layui-btn ">本月榜</button>'+
      '<button class="layui-btn">上周榜</button>'+
    '<button class="layui-btn ">上月榜</button>'+
  '</div>'+
  '<iframe src="Ranking.jsp?" height="600px" width="100%" frameborder="yes" scrolling="no"></iframe>'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		})	
      		var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           if($text=='本校排行'){
           	element.tabAdd('demo', {
       		 title: $text //用于演示
        	 ,content:'<div class="benban_div">时间：'+now_time+'</div><div class="layui-btn-group" style="position: absolute;right:0px;">'+
    '<button class="layui-btn">本周榜</button>'+
    '<button class="layui-btn ">本月榜</button>'+
      '<button class="layui-btn">上周榜</button>'+
    '<button class="layui-btn ">上月榜</button>'+
  '</div>'+
  '<iframe src="Ranking.jsp" height="600px" width="100%" frameborder="yes" scrolling="no"></iframe>'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		});
      		var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           
           if($text=='全国排行'){
           	element.tabAdd('demo', {
       		 title: $text //用于演示
        	 ,content:'<div class="benban_div">'+now_time+'</div><div class="layui-btn-group" style="position: absolute;right:0px;">'+
    '<button class="layui-btn">本周榜</button>'+
    '<button class="layui-btn ">本月榜</button>'+
      '<button class="layui-btn">上周榜</button>'+
    '<button class="layui-btn ">上月榜</button>'+
  '</div>'+
  '<iframe src="Rngking1.jsp" height="600px" width="100%" frameborder="yes" scrolling="no"></iframe>'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		});	
      		var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           if($text=='我的自试卷'){
           	element.tabAdd('demo', {
       		 title: $text //用于演示
        	 ,content:'<div class="benban_div">时间：2017.10.30~2017.11.5</div>'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		})	
      		var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           
           if($text=='统一测试卷'){
           	element.tabAdd('demo', {
       		 title: $text //用于演示
        	 ,content:'<div class="benban_div">时间：2017.10.30~2017.11.5</div>'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		})	
      		var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           if($text=='我的错题本'){
           	element.tabAdd('demo', {
       		 title: $text //用于演示
        	 ,content:'<iframe src="ErrorExamination.jsp" height="600px" width="100%" frameborder="yes" scrolling="no"></iframe>'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		})	
      		var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           
           if($text=='我的收藏'){
           	element.tabAdd('demo', {
       		 title: $text //用于演示
        	 ,content:'<div class="benban_div">时间：2017.10.30~2017.11.5</div>'
        	 ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
      		})	
      		var r = $(".layui-tab-title").find("li");
                    //每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件  
                    r.eq(r).children("i").on("click", function () {
                        alert($(this).parent("li").attr('lay-id'));
                        element.tabDelete("demo", $(this).parent("li").attr('lay-id'));
                    }), element.tabChange("demo", r);
                    element.init();
                    element.tabChange('demo', $(this).attr('lay-id'));
      		
           }
           
        }
     
   		});
     // alert($("demo"))
    }
    ,tabDelete: function(othis){
      //删除指定Tab项
      element.tabDelete('demo', '44'); //删除：“商品管理”
      othis.addClass('layui-btn-disabled');
    }
    ,tabChange: function(){
      //切换到指定Tab项
      element.tabChange('demo', $(this).attr('lay-id')); //切换到：用户管理
    }
  };
  $('.site-demo-active').on('click', function(){
  	
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
     //element.tabChange('demo',"1");
    element.tabChange('demo', $(this).attr('lay-id'))
  });
  
  //Hash地址的定位
  var layid = location.hash.replace(/^#test=/, '');
  element.tabChange('test', layid);
  element.on('tab(test)', function(elem){
    location.hash = 'test='+ $(this).attr('lay-id');
  });
  
});
});
});
</script>
<script>
	$(function(){
	
	});
</script>
<script type="text/javascript" src="ST/yanglu/js/jquery.min.js"></script>
<script type="text/javascript" language="JavaScript" charset="utf-8" src="ST/yanglu/js/spig.js"></script>
<link rel="stylesheet" href="ST/yanglu/css/spigPet.css" type="text/css"/>


<script type="text/javascript">
var isindex = true;
var visitor = true;
</script>	
	</head>
	<!--主体-->
	<body class="layui-container">
	
	
<!--小人只在首页显示 start*-->
<div id="spig" class="spig">
    <div id="message">正在加载中……</div>
    <div id="mumu" class="mumu"></div>
</div>
<!--小人end*-->
	<div style="border:1px solid red;">
		<ul class="layui-nav">
			<!--课程选择-->
		<li class="layui-nav-item">
		    <a href="javascript:;" id="item-a">我的课程</a>
		    <dl class="layui-nav-child"  id="item-a-kc">
		      <dd><a id="kc" class="layui-btn site-demo-active layui-bg-gray">ACCP7.0S1</a></dd>
		      <dd><a id="kc" class="layui-btn site-demo-active layui-bg-gray">ACCP7.0S2</a></dd>
		      <dd><a id="kc" class="layui-btn site-demo-active layui-bg-gray">ACCP7.0Y2</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="">控制台<span class="layui-badge">9</span></a>
		  </li>
		  <li class="layui-nav-item">
		    <a href="">个人中心<span class="layui-badge-dot"></span></a>
		  </li>
		  
		  <!--分类自测 -->
		  <li class="layui-nav-item">
		    <a href="javascript:;">我的自测</a>
		    <dl class="layui-nav-child " >
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="1" data-type="tabAdd" >分类自测</a></dd>
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="2" data-type="tabAdd">本班排行</a></dd>
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="3" data-type="tabAdd">本校排行</a></dd>
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="4" data-type="tabAdd">全国排行</a></dd>
		      
		    </dl>
		  </li>
		   <!--统一测试 -->
		   <li class="layui-nav-item">
		    <a href="javascript:;">统一测试</a>
		    <dl class="layui-nav-child">
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="5" data-type="tabAdd">无</a></dd>
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="6" data-type="tabAdd">ACCP7.0-S2</a></dd>
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="7" data-type="tabAdd">ACCP7.0-Y2</a></dd>
		    </dl>
		  </li>
		  <!--我的历史 -->
		   <li class="layui-nav-item">
		    <a href="javascript:;">我的历史</a>
		 <dl class="layui-nav-child">
		  <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="8" data-type="tabAdd">我的自测卷</a></dd>
		  <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="9" data-type="tabAdd">统一测试卷</a></dd>
		  <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="10" data-type="tabAdd">我的错题本</a></dd>
		  <dd><a class="layui-btn site-demo-active layui-bg-gray" lay-id="11" data-type="tabAdd">我的收藏</a></dd>
		
	    </dl>
		  </li>
		  <li class="layui-nav-item" id="lay-right">
		    <a href="Login.jsp"><img id="uimg" src="ST/yanglu/img/6.jpg" class="layui-nav-img"><span id="uname"><input type="hidden" id="uid" value="<%=session.getAttribute("uid")%>">请登录</span></a>
		    <dl class="layui-nav-child">
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" href="javascript:;">修改信息</a></dd>
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" href="javascript:;">安全管理</a></dd>
		     	      <dd><a class="layui-btn site-demo-active layui-bg-gray" href="http://home.bdqn.cn/portal.php">青鸟论坛</a></dd>
		      <dd><a class="layui-btn site-demo-active layui-bg-gray" id="zhuxiao">退了</a></dd>
	
		    </dl>
		  </li>  
		</ul>
</div>
<!-- center的div部分-->
	<div class="layui-container" id="center_div">
		<!--标题-->
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
			  <legend>云题库</legend>
			</fieldset>
		<!--选择tab项-->	
			<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
		 		 <ul class="layui-tab-title" id="tab_title">
		 		 	<li class="layui-this" lay-id="a1">ACCP7.0-S2</li>
		  		</ul>
		 	
	 	 <!--点击tab项要显示的内容-->
	  
	
<!--我的自测-->
<div class="layui-tab-content" id="nei_rong1">
<div class="layui-tab-item layui-show" id="neirong_1">内容1
	<div class="layui-row">
		<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12" >
			<div class="col-sm-6">
		            <!-- normal -->
		            <div class="ih-item square effect8"><a href="#">
		                <div class="img"><img src="./img/phone14.jpg" alt="img"></div>
		                <div class="info">
		                    <h3>专业技能型</h3>
		
		                    <p>完成0道<br /><br />进入</p>
		                    
		                </div>
		            </a></div>
		            <!-- end normal -->
		        </div>
		</div>
		<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">
			<div class="col-sm-6">
		            <!-- normal ih-item circle effect6 scale_up-->
		            <div class="ih-item square effect7"><a href="#">
		                <div class="img"><img src="./img/phone13.jpg" alt="img"></div>
		                <div class="info">
		                    <h3>课程复习型</h3>
		                    <p>完成了多少道<br /><br />进入</p>
		                </div>
		            </a></div>
		            <!-- end normal -->
		        </div>
			
		</div>
		<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">
			<div class="col-sm-6">
		            <!-- normal -->
		            <div class="ih-item square effect10 left_to_right"><a href="#">
		                <div class="img"><img src="./img/phone12.jpg" alt="img"></div>
		                <div class="info">
		                    <h3>统一测试型</h3>
		
		                    <p>完成了多少道<br /><br />进入</p>
		                </div>
		            </a></div>
		            <!-- end normal -->
		        </div>
		</div>
		<div class="div_center_DIV layui-col-lg-3,layui-sm4,layui-col-xs12">
			<div class="col-sm-6">
		            <!-- normal -->
		            <div class="ih-item square effect15 right_to_left"><a href="#">
		                <div class="img"><img src="./img/phone10.jpg" alt="img"></div>
		                <div class="info">
		                    <h3>模拟自测型</h3>
		
		                    <p>完成了多少道<br /><br />进入</p>
		                </div>
		            </a></div>
		            <!-- end normal -->
		        </div>
		</div>
	</div>
	</div>

				
			
				</div>
				</div>
	</div>
<div class="div_center_bottom">
	<iframe class="tuxing1" src="idxtx.jsp" height="700px" width="100%"  frameborder="yes" scrolling="no"></iframe>
</div>
<div class="div_center_bottom_bottom">
	<div class="layui-tab layui-tab-card">
  <ul class="layui-tab-title">
    <li class="layui-this">按技能点分析</li>
    <li>按课程分析</li>
    <li>模拟自测分析</li>
  </ul>
  <div class="layui-tab-content" style="height: 100px;">
    <div class="layui-tab-item layui-show">
<!--嵌套图形页面-->
    	<iframe src="idxtx2.jsp" style="margin-top: 110px;" height="600px" width="100%" frameborder="yes" scrolling="no"></iframe>
    </div>
     <div class="layui-tab-item">
<!--嵌套图形页面-->
    	<iframe src="idxtx1.jsp" height="600px" width="100%" frameborder="yes" scrolling="no"></iframe>
    </div>
    <div class="layui-tab-item">
<!--嵌套图形页面-->
    无模拟自测分析
    <iframe src="idxtx3.jsp" height="600px" width="100%" frameborder="yes" scrolling="no"></iframe>
    </div>
  </div>
</div>
	
</div>
	</body>
</html>
</c:if>
<c:if test="${uid==null}"><script>location.href="Login.jsp";</script></c:if>