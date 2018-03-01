<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考试</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
		<link rel="stylesheet" href="ST/zf/css/Examination.css"  media="all">
		
		<link rel="stylesheet" href="ST/layui/css/layui.css"  media="all">
		<script src="ST/layui/layui.js" charset="utf-8"></script>
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<style>
			
		</style>
		
		
		<script>
layui.use(['util', 'laydate', 'layer'], function(){
  var util = layui.util
  ,laydate = layui.laydate
  ,layer = layui.layer;
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  //倒计时
  var thisTimer, setCountdown = function(Start,End){
    var endTime = Start //计时开始时间
    ,serverTime = End; //结束日期
     
    clearTimeout(thisTimer);
    util.countdown(endTime, serverTime, function(date, serverTime, timer){
      var str =  date[2] + ':' + date[3] + '';
      if(str=="10:0"){
	          layer.msg('<font style="color:red;font-size:2em;">距考试结束还剩10分钟</font>',{
 	 			time: 2000, //2s后自动关闭
		        btn: ['知道了'],
		        btnAlign: 'c' ,
		        area: '300px;' ,
		 	 });
      }
      if(str=="0:0"){
      	layer.msg('<font style="color:blue;font-size:2em;">正在交卷……</font>',{
 	 			time: 2000, //2s后自动关闭
		        area: '300px;' ,
		 	 });
      }
      lay('.DateTime').html(str);
      thisTimer = timer;
    });
    
     //我要交卷
  /* $(".Submit").on('click',function(){
		
			  	//-----[END][获取选项题目序号]  			 
		          layer.open({
					 type: 1			//是否铺满窗口
			        ,title: false 		//false不显示标题栏 需要标题时：'标题'
			        ,closeBtn: true 	//右上角显示关闭按钮
			        ,area: '350px;' 	//弹出框宽度
			        ,shade: 0.2			//透明度
			        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			        ,btn: ['确认交卷', '继续做题']//选择按钮
			        ,btnAlign: 'c'      //选择按钮的位置 l:左浮动 r:右浮动 c:居中
			        ,moveType: 1 		//是否允许右下角拖拽模式，0或者1 （貌似没什么卵用）
			        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">\
			        			您确定要交卷吗?</div>'//内容
			        ,success: function(layero){//执行函数
			          var btn = layero.find('.layui-layer-btn');//获取所有的class=".layui-layer-btn"的btn
			          btn.find('.layui-layer-btn0').click(function(){//找到第一个按钮
			           		//post方式提交交卷
			           	
			  
			 
			  
			           });
			          
       				}
		          })    	
  })*/
    
    
  };
  setCountdown('2017-11-15 09:00:00','2017-11-15 08:00:00');
  
 
  	
  
});
</script>
		
		
		<script>
			$(function(){
				var map={};//存放试题信息
				$.ajaxSetup({
				  contentType: "application/x-www-form-urlencoded; charset=json"
				})//设置ajax提交编码格式
				//监听浏览器大小(响应式布局)
				$(".Submit").live("click",function(){
				 layer.open({
					 type: 1			//是否铺满窗口
			        ,title: false 		//false不显示标题栏 需要标题时：'标题'
			        ,closeBtn: true 	//右上角显示关闭按钮
			        ,area: '350px;' 	//弹出框宽度
			        ,shade: 0.2			//透明度
			        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			        ,btn: ['确认交卷', '继续做题']//选择按钮
			        ,btnAlign: 'c'      //选择按钮的位置 l:左浮动 r:右浮动 c:居中
			        ,moveType: 1 		//是否允许右下角拖拽模式，0或者1 （貌似没什么卵用）
			        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">\
			        			您确定要交卷吗?</div>'//内容
			        ,success: function(layero){//执行函数
			          var btn = layero.find('.layui-layer-btn');//获取所有的class=".layui-layer-btn"的btn
			          btn.find('.layui-layer-btn0').click(function(){//找到第一个按钮
			           		//post方式提交交卷
			           	
			           	//map.split(':');
			           	
			           	
			           	map=JSON.stringify(map);
			           console.log("qian:_"+map);
						
						//替换字符串
							var reg=/"/g;var reg1=/:/g;var reg2=/","/g;
							//map=map.toString();
							map=map.replace(reg2,"!");
							console.log("String:_"+map);
							map=map.replace(reg,"");
							console.log("1:_"+map);
							//map=map.replace(reg1,"/");
			           		//【END】替换字符串
			           		//map=map.split('#');
			           		var  str=map.toString();
		           			console.log("/"+str.length);
		           			console.log(str);
			           		str=str.substring(1, str.length-1);//切割
				           	console.log("JSon:_"+str);
				           /* 	$("#map1").attr("value",map);
				           	var maps = $("#map1").val(); */
				           	var strs=str;
				          
				           	if(strs==""){
								if(confirm("您尚未答题，您确定离开？离开后将不被记录为测试！")){
								location.href='index.jsp';
				
								}
						}else{
							var $cName=$(".courseName").val();
							var $sId=$(".stageId").val();
						//	var $uid=<%=session.getAttribute("adminid")%>;
							//alert($uid)
							//alert(strs+"1")
				           	console.log("data:"+str);
				          location.href='<%=request.getContextPath()%>/Subject_update_paper?map='+strs+'&course.courseName='+$cName+'&course.stageId='+$sId+'&guest.guestId=<%=session.getAttribute("uid")%>';
			  		
			 
			  }
			           });
			          
       				}
		          })
				
				})
				
				$self_adaption();
				//浏览器大小发生变化时
				$(window).resize(function () {        
					$self_adaption();
				});
				//自适应界面函数
				 function $self_adaption(){
					if($(window).width()<=800){
						$(".AnswerCard_main").css({"opacity":"0.6"});
				    	$(".left").hide();
				    	$(".Navigation").show();
				    	$(".rigth").attr("class","layui-col-lg9  layui-col-sm12 layui-col-xs12 rigth");
				    	$(".TopicContent").css({"margin-top":"-15px"});
				    	//题干移动区
				    	$(".option_main").css("width","87%");
				    	
				    	$(".rigth").css({"margin-left":"0%"});
				    }if($(window).width()>800 && $(window).width()<1200){
				    	$(".AnswerCard_main").css({"opacity":"0.8"});
				    	$(".AnswerCard").css({"width":"80%","margin-top":"120px"});
			    		$(".AnswerCard_main_option").css({"margin-left":"2px"});
				    	if($(window).width()<1000){
			    			
				    		$(".left").hide();
				    		$(".Navigation").show();
				    		$(".rigth").css({"float":"right"});
				    		$(".TopicContent").css({"margin-top":"0px"});
				    		$(".stem").css({"min-width":"500px"});
				    	}else{
				    		//$(".AnswerCard").css({"width":"80%","margin-top":"50px"});
				    		$(".rigth").css({"float":"right"});
				    		$(".TopicContent").css({"margin-top":"-78px"});
				    		$(".left").show();
				    		$(".Navigation").hide();
				    		$(".option").attr("class","layui-col-sm10 option");
					    	$(".left").attr("class","layui-col-lg3  layui-col-sm3 layui-col-xs2 left");
					    	$(".rigth").attr("class","layui-col-lg9  layui-col-sm9 layui-col-xs10 rigth");
				    	}
				    	
				    }if($(window).width()>=1200){
				    	$(".AnswerCard_main").css({"opacity":"1"});
			    		$(".AnswerCard").css({"width":"80%","margin-top":"10px"});
			    		$(".AnswerCard_main_option").css({"margin-left":"5px"});
				    	$(".left").show();
				    	$(".Navigation").hide();
				    }
				}
				//[END]监听浏览器大小(响应式布局)
				
				//休息一下
			  	$(".SitBack").click(function(){
			  		alert("点击确认继续做题");
			  	})
			  	//答题卡展开收起
			  	$(".AnswerCard_hide").toggle(function(){
			  		$(".AnswerCard_main").fadeOut();
			  		//获取答题卡上的题数
			  		var $AnswerCard_Number=$(".AnswerCard_Number").html();
			  		$(".AnswerCard_hide").html("展开答题卡(<font class='AnswerCard_Number'>"+$AnswerCard_Number+"</font>)");
			  	},function(){
			  		$(".AnswerCard_main").fadeIn();
		  			var $AnswerCard_Number=$(".AnswerCard_Number").html();
			  		$(".AnswerCard_hide").html("收起答题卡(<font class='AnswerCard_Number'>"+$AnswerCard_Number+"</font>)");
			  	})
			  	//答题卡选项点击时跳转锚点
			  	$(".AnswerCard_main_option").live("click",function(){
			  		//$(this).css("background-color","gainsboro");
			  		var $Tz=$(this).val();
			  		console.log(window.location.href);
			  		var $url=window.location.href;
			  		//alert($url);
			  		$url.split('#');
			  		alert($url.split('#'));
			  		for (var i = 0; i < $url.length; i++) {
						location.href=$url[i]+"#"+$Tz;
					}
			  		
			  	})
			  	
			  	/*这是电脑鼠标滚动的事件控制答题卡位置*/
				$(window).bind("scroll",function(){
					//当滚动条下滑 174px之后 
					if(parseInt($(window).scrollTop())>190){
						if($(window).width()>1300){
							$(".AnswerCard_main_option").css({"margin-left":"2px"});
							$(".AnswerCard").css({"width":"80%","margin-top":"0px"});
						}
						if($(window).width()>800 && $(window).width()<1300){
							$(".left").css({"position":"fixed","top":"120px","width":"18%","max-width":"285px","min-width":"180px"});
						}
						if($(window).width()<800){
							$(".left").css({"position":"fixed","top":"0px","width":"18%","max-width":"285px","min-width":"180px"});
						}
						$(".left").css({"position":"fixed","top":"0px","width":"18%"});
						$(".rigth").css({"float":"right"});
						
					}else{
						if($(window).width()<800){
							$(".left").hide();
						}
						$(".left").css({"position":"static","width":"24%","max-width":"285px"});
						$(".rigth").css({"float":"right","margin-top":"0px"});
					}
				});
				
			  	//点击ioc图标时显示答题卡
			  	$(".Navigation").toggle(function(){
			  		if(parseInt($(window).scrollTop())>190){
			  			$(".left").css({"position":"fixed","top":"0px","width":"200px","max-width":"285px"});
			  		}else{
		  				$(".left").css({"position":"fixed","top":"200px","width":"200px","max-width":"285px"});
			  		}
			  		
			  		$(".AnswerCard_main_option").css({"margin-left":"2px"});
			  		$(".AnswerCard").css({"width":"80%","margin-top":"120px"});
			  		$self_adaption();
			  		
			  		$(".left").show();
			  	},function(){
			  		$(".left").hide();
			  	})
			  	//-----[获取选中选项]
			  	function getSelOption(element){
			  		var $SelVal="";var $bl=false;
			  		element.parent().parent().children(".AnswerOptions").each(function(i){
				      	$bl=$(this).children(".option_Click").children(".option_Click_Btn").attr("checked")?true:false;
				      	if($bl==true){
				      		if($SelVal!=""){
				      			$SelVal+=","+$(this).children(".option_Click").children(".option_Click_Btn").attr("title");
				      		}else{
				      			$SelVal+=$(this).children(".option_Click").children(".option_Click_Btn").attr("title");
				      		}
				      	}
				    });
			  	   return $SelVal;
			  	}
			  	
			  	//-----[END][获取选中选项]
			  	
			  	//-----[获取选项题目序号]
			  	function getSelsubjectId(element){
			  		//console.log(element.parent().parent().prev().children(".number_ioc").html());
			  	  return element.parent().parent().prev().children(".number_ioc").children(".TopicSelfTestHistoryDetailsID").val();
			  	}
			  	//-----[END][获取选项题目序号]
			  	
			  	
			  	//点击选项时[选项选中、题号背景变灰色]
			  	var $TabNumber="";
			  	
			  	$(".option_main").live("mouseover",function(){
			  		/* var $guestChoice=getSelOption($(this));//获取该题的用户作答选项
				  			var $id=getSelsubjectId($(this));
				  			console.log("id:"+$id+" val"+$guestChoice);
				  		if($(this).prev().children("input[type:checkbox]").attr("checked")==true){
				  			map[$id] = $guestChoice;
				  		}else{
				  			map[$id]= "";
				  		}
				  			var value = map[$id]; */
				  			//console.log("value:"+value); 	
				  			//alert(value)
			  		$(this).toggle(function(i){
		
				  		$(this).prev().children("input[type:checkbox]").attr("checked",true);
				  		$TabNumber=$(this).parent().parent().prev().children(".number_ioc").attr("id");
				  		$(".AnswerCard_main_option[value="+$TabNumber+"]").css({"background-color":"gainsboro"});
				  	 	var $guestChoice=getSelOption($(this));//获取该题的用户作答选项
				  			var $id=getSelsubjectId($(this));
				  			map[$id] = $guestChoice;
				  			//alert( $guestChoice)	
			  	},function(){
			  		var $guestChoice=getSelOption($(this));//获取该题的用户作答选项
				  			var $id=getSelsubjectId($(this));
				  			//alert( $guestChoice)	
			  		$TabNumber=$(this).parent().parent().prev().children(".number_ioc").attr("id");
			  		$(this).prev().children("input[type:checkbox]").attr("checked",false);
			  		$(this).parent().parent().children(".AnswerOptions")
			  		var $bool=false;
			  		$(this).parent().parent().children(".AnswerOptions").each(function(i){
				      	$bool=$(this).children(".option_Click").children(".option_Click_Btn").attr("checked")?true:false;
				      	if($bool==true){return false;}
				    });
			  		if($bool==false){
			  			$(".AnswerCard_main_option[value="+$TabNumber+"]").css({"background-color":"white"});
			  		}
			  	})
			  	
			  	
			  	})
			  	
			  	//点击多选框是[选项选中、题号背景变灰色]
			  	var TabNumber2="";
			  	$(".option_Click").live("click",function(){
			  		//console.log(2);
			  		$(this).toggle(function(i){
			  		$(this).attr("checked",true);
			  		$TabNumber2=$(this).parent().prev().children(".number_ioc").attr("id");
			  		$(".AnswerCard_main_option[value="+$TabNumber2+"]").css({"background-color":"gainsboro"});
			  	},function(){
			  		$TabNumber2=$(this).parent().prev().children(".number_ioc").attr("id");
			  		$(this).attr("checked",false);
			  		$(this).parent().parent().children(".AnswerOptions")
			  		var $bool=false;
			  		$(this).parent().parent().children(".AnswerOptions").each(function(i){
				      	$bool=$(this).children(".option_Click").children(".option_Click_Btn").attr("checked")?true:false;
				      	if($bool==true){return false;}
				    });
			  		if($bool==false){
			  			$(".AnswerCard_main_option[value="+$TabNumber2+"]").css({"background-color":"white"});
			  		}
			  	})
			  	
			  	
			  	})
			  	
			  	
			  	
			  	
			  	
			})
			
	
		</script>
	<script type="text/javascript">
		$(function(){
		var courseName=$(".courseName").val();
		var stageId=$(".stageId").val();
			$.post("<%=request.getContextPath()%>/Subject_find_timu?course.courseName="+courseName+"&course.stageId="+stageId,
			function(date){
				var obj =eval(date);
				//alert(obj)
				alert("考生准备开始考试！！！");
				$.each(obj.listtimu,function(i,o){
				//alert(o[0])
				$(".AnswerCard_Number").html((i+1));
				$("#main_option").append("<input type='button' class='AnswerCard_main_option'   value='"+(i+1)+"' />");
				$(".layui-row form").append("<!--题干-->\
					<div class='layui-col-lg12 stem'>\
						<div class='number_ioc' id='"+(i+1)+"' ><input type='hidden' class='TopicSelfTestHistoryDetailsID' value='"+o[0]+"' /><font class='number_number'>"+(i+1)+"</font></div>\
						<div class='TopicContent ' >\
							<pre class='layui-code ' lay-title='JavaScript' lay-skin='notepad'   lay-height='100px' style='font-size: 16px;'>\
"+o[1]+"\
							</pre>\
						</div>\
					</div>\
					<!--【END】题干-->\
					<!--选项卡-->\
					<div class='layui-col-lg12 option_tab'>\
					<div class='AnswerOptions'>	\
						<div  class='option_Click'><input  type='checkbox' name='guestChoice' title='A' class='A option_Click_Btn'/></div>\
						<div class='option_main'>\
							<pre class='layui-code ' style='background: white;'   lay-skin='notepad'  lay-height='100px'>\
"+o[2]+"\
							</pre>\
						</div>\
					</div>\
					\
					<div class='AnswerOptions'>	\
						<div  class='option_Click'><input  type='checkbox' name='guestChoice'  title='B' class='B option_Click_Btn'/></div>\
						<div class='option_main'>\
							<pre class='layui-code '  style='background: white;'   lay-skin='notepad'  lay-height='100px'>\
"+o[3]+"\
							</pre>	\
						</div>\
					</div>\
					\
					<div class='AnswerOptions'>	\
						<div class='option_Click'><input  type='checkbox' name='guestChoice'  title='C' class='C option_Click_Btn'/></div>\
						<div class='option_main'>\
							<pre class='layui-code '  style='background: white;'   lay-skin='notepad'  lay-height='100px'>\
"+o[4]+"\
							</pre>	\
						</div>\
					</div>\
					<div class='AnswerOptions'>	\
						<div class='option_Click'><input  type='checkbox' name='guestChoice'  title='D' class='D option_Click_Btn'/></div>\
						<div class='option_main'>\
							<pre class='layui-code '  style='background: white;'   lay-skin='notepad'  lay-height='100px'>\
"+o[5]+"\
							</pre>	\
						</div>\
					</div>\
					</div>\
					<!--【END】选项卡-->\
					</br>");
				});
							}
			);
		//加载某个样式layui.form.render('checkbox');
		});
	</script>
  </head>
  
  <body class="layui-container" oncontextmenu="event.returnValue=false" onselectstart="event.returnValue=false">
 	<input type="hidden" value="${course.courseName}" class="courseName">
 		<input type="hidden" value="${course.stageId}" class="stageId">
   <input type="hidden" id="url" value="${pageContext.request.contextPath}" /> 
   <!--hide-->
  <s:hidden id="map1"></s:hidden>
		<div class="layui-row">
			<div class="layui-col-lg12  layui-col-sm12 layui-col-xs12 TOP">
				<img src="./img/phone18.jpg" width="100%" height="250px">
			</div>
		</div>
		<!--[END]hide-->
		<!--MAin-->
		<div class="layui-row">
			<i class="layui-icon Navigation" style="font-size: 30px; color: #1E9FFF;">&#xe63c;</i>  
			<!--Left-->
			<div class="layui-col-lg3  layui-col-sm3 layui-col-xs1 left">
				<div class="layui-row" style="color: #007DDB;">
					<div class="layui-col-lg12 DateTitle"><h2>练习用时</h2></div>
					<div class="layui-col-lg12 DateTime"></div>
					<div class="layui-col-lg10   option"> <button class="SitBack layui-btn layui-btn-normal">休息一下</button></div>
					<div class="layui-col-lg10   option"> <button class="Submit layui-btn layui-btn-normal">我要交卷</button></div>
					<div class="layui-col-lg10 AnswerCard">
						<div class="layui-col-lg12 AnswerCard_hide">收起答题卡(<font class="AnswerCard_Number">10</font>)</div>
						<div class="layui-col-lg12 AnswerCard_main">
							<div class="layui-row" id="main_option">
							
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<!--[END]Left-->
			<!--Rigth-->
			<div class="layui-col-lg9  layui-col-sm9 layui-col-xs11 rigth">
				<div class="layui-row">
					<!--表单-->
					<form action="" method="post">
				</form>
				<!--【END】表单-->
			</div>
			<!--[END]Rigth-->
		</div>
		<!--[END]MAin-->
		</div>
  </body>
</html>
