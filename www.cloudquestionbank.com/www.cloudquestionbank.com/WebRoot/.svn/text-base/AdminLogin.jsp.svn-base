<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
 	<script>
        if (window != window.top) top.location.href = self.location.href;
    </script>
    <link href="ST/layui/css/layui.css" rel="stylesheet" />
    <link href="plugins/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="build/css/login.css" rel="stylesheet" />
    <link href="plugins/sideshow/css/normalize.css" rel="stylesheet" />
    <link href="plugins/sideshow/css/demo.css" rel="stylesheet" />
    <link href="plugins/sideshow/css/component.css" rel="stylesheet" />
    <script src="ST/zf/js/Currency.js"></script>
    <script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
    <!--[if IE]>
        <script src="./plugins/sideshow/js/html5.js"></script>
    <![endif]-->
    <script>
    	$(function(){
    	    $.ajaxSetup({async:false});
    		//隐藏元素
    		$(".NamePrompt").hide();
    		$("#validCode").hide();
    		$("#YZM").hide();
    		$(".PwdPrompt").hide();
    		//获取验证码
    		var $NameBool=false;
    		var $YamVal=productionVerificationCode($("#YZM"));
    		//点击刷新验证码
    		$("#YZM").click(function(){
    			$YamVal=productionVerificationCode($(this));
    		})
    		//账号失去焦点
    		$("#Name").blur(function(){
    			$NameBool=VerificationEmail($(this));
    			console.log($NameBool);
    			if($NameBool){
    				$NameBool=VerificationAdminExistence("admin.email="+$(this).val().trim(),$(this));
    				console.log($NameBool+"???...");
    				if($NameBool){$("#validCode").show();$("#YZM").show();}
    				else{$("#validCode").hide();$("#YZM").hide();}
    			}
    		})
    	 	function VerificationAdminExistence($data,element){
    			var $bool=false;
    			console.log("????/");
    			$.post("<%=request.getContextPath()%>/Admin_FindAdminExistence",$data,success,"json");
    			function success(result){
    				$bool=result;
    				console.log($bool);
    				if($bool){
    				}else{ShowPrompt(element,$bool,"未找到您的用户信息！");}
    			}
    			return $bool;
    		} 
    		
    		
    		//登录验证
    		$("#sub").click(function(){
    			var $bool=false;var $PwdBool=false;var $YZMBool=false;
    			console.log($YamVal);
    			if($NameBool){
    				$NameBool=VerificationEmail($("#Name"));
	    			$PwdBool=VerificationTextBoxAndLeng($("#Pwd"),5);
	    			$YZMBool=VerificationIllegalAndPrompt($("#validCode"),"验证码不能为空哦！","不能有特殊符号哦！");
	    			console.log($NameBool+"/ "+$PwdBool+"/ "+$YZMBool);
    			}
    			if($NameBool==true&& $PwdBool==true&&$YZMBool==true){
    				if($("#validCode").val().trim()==$YamVal){$bool=true;}
    				else{
    					$YamVal=productionVerificationCode($("#YZM"));//刷新验证
    					Laert_Prompt("验证码输入错误哦！");
    				}
    			}
    			if($bool){
    				$YamVal=productionVerificationCode($("#YZM"));//刷新验证
    				var $data="&admin.email="+$("#Name").val().trim();
    					$data+="&admin.pwd="+$("#Pwd").val().trim();
    				 $.get("<%=request.getContextPath()%>/Admin_admin_logindl",$data,success,"json");
    				function success(result){
    					console.log(result);
    					if(result=="true"){
    						location.href="<%=request.getContextPath()%>/BackstageMain.jsp";
    					}else{
	    					if(result=="false"){Laert_Prompt("密码错误！");}
	    					else{Laert_Prompt(result);}
    					}
    					
    				} 
    			}
    		})
    		
    		
    	})
    </script>
    
    
    <style>
       .Notice{border: 1px solid orangered;}
        canvas {
            position: absolute;
            z-index: -1;
        }
        
        .kit-login-box header h1 {
            line-height: normal;
        }
        
        .kit-login-box header {
            height: auto;
        }
        
        .content {
            position: relative;
        }
        
        .codrops-demos {
            position: absolute;
            bottom: 0;
            left: 40%;
            z-index: 10;
        }
        
        .codrops-demos a {
            border: 2px solid rgba(242, 242, 242, 0.41);
            color: rgba(255, 255, 255, 0.51);
        }
        
        .kit-pull-right button,
        .kit-login-main .layui-form-item input {
            background-color: transparent;
            color: white;
        }
        
        .kit-login-main .layui-form-item input::-webkit-input-placeholder {
            color: white;
        }
        
        .kit-login-main .layui-form-item input:-moz-placeholder {
            color: white;
        }
        
        .kit-login-main .layui-form-item input::-moz-placeholder {
            color: white;
        }
        
        .kit-login-main .layui-form-item input:-ms-input-placeholder {
            color: white;
        }
        
        .kit-pull-right button:hover {
            border-color: #009688;
            color: #009688
        }
        
    </style>
</head>
<body class="kit-login-bg">
    <div class="container demo-1">
        <div class="content">
            <div id="large-header" class="large-header">
                <canvas id="demo-canvas"></canvas>
                <div class="kit-login-box">
                    <header>
                        <h1>CQBADMIN LOGIN</h1>
                    </header>
                    <div class="kit-login-main">
                        <form id="ADminLogin"  class="layui-form" method="post">
                            <div class="layui-form-item">
                                <label class="kit-login-icon">
                                    <i class="layui-icon">&#xe612;</i>
                                </label>
                                <input type="text" id="Name" name="admin.realName" lay-verify="required" autocomplete="off" placeholder="请输入管理员邮箱" class="layui-input">
                            	  <div class="layui-form-mid layui-word-aux NamePrompt">您的邮箱格式有误</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="kit-login-icon">
                                    <i class="layui-icon">&#xe642;</i>
                                </label>
                                <input type="password" id="Pwd" name="admin.pwd" lay-verify="required" autocomplete="off" placeholder="请输入密码" class="layui-input">
                            	<div class="layui-form-mid layui-word-aux PwdPrompt">您的邮箱格式有误</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="kit-login-icon">
                                    <i class="layui-icon">&#xe63c;</i>
                                </label>
                                <input type="text" readonly="readonly" id="YZM" title="点击刷新验证码"  autocomplete="off" class="layui-input"></input>
                            </div>
                            <div class="layui-form-item">
                                <label class="kit-login-icon">
                                    <!-- <i class="layui-icon">&#xe642;</i> -->
                                </label>
                                <input type="number" id="validCode" min="0"  lay-verify="required|number" autocomplete="off" placeholder="请输入↑计验证码算结果" class="layui-input">
                            </div>
                            <div class="layui-form-item">
                                <div class="kit-pull-left kit-login-remember">
                                </div>
                                <div class="kit-pull-right">
                                    <button type="button" id="sub" class="layui-btn layui-btn-primary" >
                                        <i class="fa fa-sign-in" aria-hidden="true"></i> 登录
                                    </button>
                                </div>
                                <div class="kit-clear"></div>
                            </div>
                        </form>
                    </div>
                    <footer>
                        <p>CQB ADMIN © <a href="#" style="color:white; font-size:18px;" target="_blank">www.cloudquestionbank.com</a></p>
                    </footer>
                </div>
            </div>
        </div>
    </div>
    <!-- /container -->

    <script src="ST/layui/layui.js"></script>
    <script src="plugins/sideshow/js/TweenLite.min.js"></script>
    <script src="plugins/sideshow/js/EasePack.min.js"></script>
    <script src="plugins/sideshow/js/rAF.js"></script>
    <script src="plugins/sideshow/js/demo-1.js"></script>
    <script>
        layui.use(['layer', 'form'], function() {
            var layer = layui.layer,
                $ = layui.jquery,
                form = layui.form;

          /*   $('#changeCode').on('click', function() {
                $('#changeCode > img')[0].src = './build/images/GetVerfiyCode.png';
            });

            //清理左侧菜单缓存
            var index = layer.load(2, {
                shade: [0.3, '#333']
            });
            $(window).on('load', function() {
                layer.close(index);
                form.on('submit(login)', function(data) {
                    var loadIndex = layer.load(2, {
                        shade: [0.3, '#333']
                    });
                     $.post(data.form.action, data.field, function(res) {
                      if (!res.rel) {
                             layer.msg(res.msg, {
                                 icon: 2
                             });
                            loadIndex && layer.close(loadIndex);
                             $('#changeCode').click(); //刷新验证码
                         } else {
                             setTimeout(function() {
                             	location.href='AdminLogin.jsp'
                             }, 1500);
                         }
                    }, 'json');
                    return true;
                });
            }()); */

        });
    </script>
</body>