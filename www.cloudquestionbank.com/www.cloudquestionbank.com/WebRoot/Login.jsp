<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>云题库用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="ST/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="ST/zf/css/login.css" media="all">
	<script src="ST/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
	<link id="layuicss-layer" rel="stylesheet" href="ST/zf/css/layer.css" media="all"></head>
	<script type="text/javascript">
			$(function(){
			layui.use(['layer', 'form'], function(){
			var layer = layui.layer
  			,form = layui.form;
				$(".layui-btn").click(function(){
				var $uname=$("#login-name").val().trim();
				var $upwd=$("#login-pwd").val().trim();
					if($uname=="" ||  $upwd==""){
					layer.msg("所填信息不能为空！！！");
						return false;
					}else{
						 $.post("<%=request.getContextPath()%>/Guest_logindl?guest.email="+$uname+"&&guest.pwd="+$upwd+"",
				    	function(date){
				    	//alert(date["status"])
				    		if(date["status"]==5)
				    		{
				    		location.href="index.jsp";
				    		}else if(date["status"]==6){
				    		layer.msg("账号/邮箱/密码输入错误！！！");
				    		}else{
				    		layer.msg("用户正在登录！！！");
				    		}
    					}); 
					}
				});
				
				$("#login-name").keyup(function(){
				var uname=$(this).val();
				$.post("<%=request.getContextPath()%>/Guest_loginname?guest.email="+uname+"",
				function(date){
							var obj = eval(date);
							
    						$.each(obj.loginlist,function(i,o){
    						//alert(o[4])
    						if(uname==o[8]){
    						$(".HeadPortrait").attr("src",o[4]);
    						}
    						
    					});
    					//alert(date["status"])
    						if(date["status"]=='11'){
    						$(".HeadPortrait").attr("src","ST/yanglu/img/4.jpg");
    						}
    					
					});
				});
			})
			});
	</script>
  </head>
  <style>
		#Video{width: 100%; height: auto; left: 0px;}
		/*1000px以上屏幕显示*/
			@media screen and (min-width:1200px){
				
			}
			/*屏幕宽度在 640~1000px*/
			@media screen  and (min-width:640px )and (max-width:1200px) {
				
			}
			/*屏宽640px以下 */
			@media  screen and (max-width:640px ) {
				#Video{margin-top: 40px;}
			/*//#Video{width:600px;height: 900px;}*/
			}
	</style>
 <body>
	<video id="Video" class="video-player" preload="auto" autoplay="autoplay" loop="loop" data-height="1080" data-width="1920" height="1080" width="1920" >
	    <source src="ST/void/StillBreathing.mp4" type="video/mp4">
	</video>
	<div class="video_mask"></div>
	<div class="login">
	    <h1>云题库-用户登录</h1>
	    <div class="layui-row">
	    	<div class="layui-col-lg12" >
	    		<img class="HeadPortrait" src="ST/Guest/default.jpg"></img>
	    	</div>
	    </div>
	    
	   <!--  <form class="layui-form"> -->
	    		<!-- <input type="text" class="status" name="status" > -->
	    	<div class="layui-form-item">
				<input id="login-name" class="layui-input" name="guest.guestName" placeholder="用户名" lay-verify="required" type="text" autocomplete="off">
		    </div>
		    <div class="layui-form-item">
				<input id="login-pwd" class="layui-input" name="guest.pwd" placeholder="密码" lay-verify="required" type="password" autocomplete="off">
		    </div>
		    <div class="layui-form-item form_code">
		    </div>
			<button class="layui-btn login_btn"  lay-filter="login">登录</button>
		<!-- </form> -->
	</div>

</body>
</html>
