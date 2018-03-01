<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${adminid!=null && adminTypeID<5}">

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
		<title>新增用户</title>
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<link rel="stylesheet" href="ST/zf/css/NewUsers.css" />
		<script>
			$(function(){
				
				var $schoolID=<%=session.getAttribute("schoolID")%>;//存储校区编号
				var $classID="";										//存储班级编号
				load("&school.id="+$schoolID);
				//------[加载校区班级]
				function load($data){
					$.post("<%=request.getContextPath()%>/School_GetList",$data,success,"json");
					function success(result){
						//console.log(result);
						var $html="";
						$.each(result.School,function(i,o){
							//console.log(o[i]);
							$html+="<option value="+o[0]+" >"+o[1]+"</option>";
						})
						$("#schoolID").html($html);$html="";//清空数据
						$.each(result.Class,function(i,o){
							//console.log(o[i]);
							$classID+=$classID!=""?","+o[0]:o[0];
							$html+="<option value="+o[0]+" >"+o[1]+"</option>";
						})
						$("#classID").html($html);
					}
				}
				//------[加载校区班级]
				//------[加载班级]
				function changeload($data){
					$.post("<%=request.getContextPath()%>/School_GetList",$data,success,"json");
					function success(result){
						//console.log(result);
						var $html="";
						$.each(result.Class,function(i,o){
							//console.log(o[i]);
							$html+="<option value="+o[0]+" >"+o[1]+"</option>";
						})
						$("#classID").html($html);
					}
				}
				//------[END][加载班级]
				//校区切换时触发
				$("#schoolID").live("change",function(){
					//console.log($(this).val());
					if(<%=session.getAttribute("schoolID")%>==0){
						//console.log("admintype_0");
						changeload("school.id="+$(this).val());
					}else{
						 if(<%=session.getAttribute("schoolID")%>==$(this).val()){
							changeload("school.id="+$(this).val());
						}else{FriendlyPrompt("您的权限还不够哦！加油！");} 
					}
				})
			    //[END]校区切换时触发
			    
			    //----[验证邮箱唯一]
			    function Eail($data){
			    	$.ajaxSetup({async:false});
			    	var $bool=false;
			    	$.post("<%=request.getContextPath()%>/Guest_emailIsExistence",$data,success,"json");
			    	function success(result){
			    		$bool=result==true?false:true;
			    		if($bool){
			    			//console.log(111);
			    		}
			    		///console.log(result+".$bool→."+$bool);
			    	}
			    	return $bool;
			    }
			    //----[END][验证邮箱唯一]
			     //----[验证身份证唯一]
			    function CardNo($data){
			    	$.ajaxSetup({async:false});
			    	var $bool=false;
			    	$.post("<%=request.getContextPath()%>/Guest_CardNoIsExistence",$data,success,"json");
			    	function success(result){
			    		$bool=result==true?false:true;
			    		if($bool){
			    			//console.log(111);
			    		}
			    		//console.log(result+".$bool→."+$bool);
			    	}
			    	return $bool;
			    }
			    
			    //----[END][验证身份证唯一]
				//隐藏 提示
				$(".pwdPrompt").hide();
				$(".newpwdPrompt").hide();
				$(".emailPrompt").hide();
				$(".phonePrompt").hide();
				$(".guestNamePrompt").hide();
				$(".imgUrlPrompt").hide();
				$(".schoolIDPrompt").hide();
				$(".classIDPrompt").hide();
				//过滤密码
				$("#pwd").keyup(function(){
					$(this).val(KeyUP_Cler($(this)));
				})
				$("#newpwd").keyup(function(){
					$(this).val(KeyUP_Cler($(this)));
				})
				//邮箱焦点聚焦时
				$("#email").focus(function(){
					ShowPrompt($(this),true,"不能有特殊字符");//提示隐藏
				})
				//手机号码框失去焦点是验证手机号
				$("#phone").blur(function(){
					VerificationPhon($("#phone"));//验证手机号
				})
				//用户输入用户名时
				$("#guestName").keyup(function(){
					$(this).val(KeyUP_Cler($(this)));
				})
				//地址失焦事件
				$("#address").blur(function(){
					VerificationIllegalAndPrompt($(this),"用户的地址不能为空哦~!","地址中不能包含有非法字符!");
				})
				//真实姓名失焦事件
				$("#realName").blur(function(){
					VerificationIllegalAndPrompt($(this),"真实姓名不能为空哦~","真实姓名中是不能有非法字符的哦~");
				})
				//身份证失焦事件
				$("#cardNo").blur(function(){
					VerificationCardNo($(this),"真实姓名不能为空哦~","真实姓名中是不能有非法字符的哦~");
				})
				//选取头像后
				$("#imgUrl").blur(function(){
					VerificationImgUrl($(this));
				})
				//表单提交事件				
				$("#sub").click(function(){
					var $bool=false;
					var $phoneBool=false;       
					var $guestNameBool=false;   
					var $emailBool=false;	 var $emilOnly=false;//邮箱是否唯一
					var $pwdBool=false;	     var $cardNoOnly=false;//身份证是否唯一
					var $addressBool=false;
					var $realNameBool=false; var $cardNoBool=false;
					var $imgUrlBool=false;   var $schoolIDBool=false;
					var $classIDBool=false; var $cid=false; var $sid=false;
					
					$phoneBool=VerificationPhon($("#phone"));		  //验证手机号	
					$guestNameBool=VerificationGuestName($("#guestName")); //验证用户名
					$emailBool=VerificationEmail($("#email"));		  //验证邮箱
					$pwdBool=VerificationPwd($("#pwd"),$("#newpwd"));//验证密码
					$addressBool=VerificationIllegalAndPrompt($("#address"),"用户的地址不能为空哦~!","地址中是包含非法字符的哦~");     //验证住址
					$realNameBool=VerificationIllegalAndPrompt($("#realName"),"真实姓名不能为空哦~","真实姓名中是不能有非法字符的哦~");  //验证真实姓名
					$cardNoBool=VerificationCardNo($("#cardNo"));      //验证身份证号码
					$imgUrlBool=VerificationImgUrl($("#imgUrl"));      //验证是否选择头像 
					$schoolIDBool=VerificationsChoolIdOrclassId($("#schoolID"),"您还未选择学校编号呢！");           //验证学校编号
					$classIDBool=VerificationsChoolIdOrclassId($("#classID"),"哎呀你是不是忘了选择班级编号啊~！");  //验证班级编号
					console.log($phoneBool+"/"+$guestNameBool+"/"+$emailBool+"/"+$pwdBool+"/"+$addressBool+"/"+$realNameBool+"/"+$cardNoBool+"/"+$imgUrlBool+"/"+$schoolIDBool+"/"+$classIDBool);
					if($phoneBool==true && $guestNameBool==true && $emailBool==true && $pwdBool==true
					  && $addressBool==true && $realNameBool==true && $cardNoBool==true && $imgUrlBool==true 
					  && $schoolIDBool==true && $classIDBool==true ){
					  	if(VerificationEailAndCardNoOnly()==true){//如果通过邮箱身份证唯一检验校区编号班级编号
					  		var $cid=false;
					  		var $cids=$classID.split(",");//验证该班级是否为该校区的
						  	for(i=0;i<$cids.length;i++){
						  		console.log($cids[i]+"??/"+$("#classID").val().trim());
						  		$cid=$cids[i]==$("#classID").val().trim()?true:false;
						  		if($cid){break;}
						  	}
						  	if(<%=session.getAttribute("schoolID")%>==0){
						  		$bool=$cid;
						  	}else{
						  		$sid=<%=session.getAttribute("schoolID")%>==$("#schoolID").val().trim()?true:false;//当前管理员是否属于该校区
						  		if($sid){
						  			if($cid){$bool=$cid;}
						  			else{FriendlyPrompt("新增用户只能是本校区的班级哦！");}
						  		}else{FriendlyPrompt("新增用户只能在本校区哦！");}
						  	}	
					  	}
					  }
					  //-----[验证邮箱身份证唯一]
					  function  VerificationEailAndCardNoOnly(){
					  	 var $bool=false;
					  	 $emilOnly=Eail("&guest.email="+$("#email").val().trim());//验证邮箱是否唯一
					  	 $cardNoOnly=CardNo("&guest.cardNo="+$("#cardNo").val().trim());//验证身份证是否唯一
					  	 if($emilOnly==true && $cardNoOnly==true){$bool=true;}
					  	 else{
					  	 	if($emilOnly==false){FriendlyPrompt("哎呀~真不巧,该邮箱已注册了哦！")}
					  	 	if($cardNoOnly==false){FriendlyPrompt("哎呀~该用户是不是已注册过了!,身份证被占用了呢！")}
					  	 }
					  	 return $bool;
					  }
					  //-----[END][验证邮箱身份证唯一]
					  
					//验证通过,获取数据
					if($bool){
						FriendlyPrompt("新增用户中……");
						$("#AddGuest").submit();
					}
				})
				layui.use(['form', 'layedit', 'laydate','util', 'layer','jquery'], function(){
				  var form = layui.form
				  ,layer = layui.layer
				  ,layedit = layui.layedit
				  ,laydate = layui.laydate;
				   var util = layui.util
				  ,laydate = layui.laydate
				  ,layer = layui.layer;
				  var $=layui.jquery;
				  //创建一个编辑器
				  var editIndex = layedit.build('LAY_demo_editor');
					 layui.form.render('select');
				  
				});
				
			})
		</script>
		
	
	</head>
	<body class="layui-container">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>新增用户信息</legend>
	</fieldset>
		
		
		<!--表单填写部分-->
	<s:form class="layui-form " id="AddGuest" action="Guest_AddGuest" theme="simple" enctype="multipart/form-data" method="post">
	
	  <div class="layui-form-item">
	    <label class="layui-form-label">自我描述:</label>
	    <div class="layui-input-block" >
	      <textarea name="guest.description" maxlength="50" encode:true; placeholder="自我介绍什么的……(五十字以内,当然你也可也没有描述！)" class="layui-textarea"></textarea>
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	       <label class="layui-form-label">手机号码:</label>
	      	<div class="layui-input-inline">
	        	<input maxlength="11" id="phone" type="tel" name="guest.phone" lay-verify="required" autocomplete="off" class="layui-input">
	     	</div>
	     	 <div class="layui-form-mid layui-word-aux phonePrompt">手机号有误!</div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户名:</label>
		    <div class="layui-input-inline">
		      <input type="text" id="guestName" name="guest.guestName" lay-verify="title" autocomplete="off" placeholder="用户名" class="layui-input">
		    </div>
		    <div class="layui-form-mid layui-word-aux guestNamePrompt">用户名不能为空哦~！</div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">选择头像</label>
	     <div class="layui-input-inline">
	    	 <s:file id="imgUrl" name="file" lay-verify="required" type="file" />
	    </div>
	    <div class="layui-form-mid layui-word-aux imgUrlPrompt">您还未选择头像呢~！</div>
	  </div>
	  
	  <div class="layui-form-item">
	   <label class="layui-form-label">邮箱</label>
		<div class="layui-input-inline">
	        	<input id="email"  type="tel" maxlength="25" name="guest.email" lay-verify="required|email" placeholder="登录账号(不可改变)" autocomplete="off" class="layui-input">
	     </div>
	     <div class="layui-form-mid layui-word-aux emailPrompt">邮箱格式有误！</div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">登录密码:</label>
		   <div class="layui-input-inline">
		        	<input id="pwd" type="password" maxlength="18" name="guest.pwd" lay-verify="required|pass" autocomplete="off" class="layui-input">
		 	</div>
		 	<div class="layui-form-mid layui-word-aux pwdPrompt">密码中不能有特殊字符！</div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">确认密码:</label>
		   <div class="layui-input-inline">
		        	<input id="newpwd"  type="password" maxlength="18"  lay-verify="required|pass" autocomplete="off" class="layui-input">
		 	</div>
		 	<div class="layui-form-mid layui-word-aux newpwdPrompt">密码中不能有特殊字符！</div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">现住地址:</label>
	    	<div class="layui-input-block" >
		      <textarea id="address" name="guest.address" maxlength="250" lay-verify="required" placeholder="湖南省长沙市……" class="layui-textarea"></textarea>
		    </div>
	  </div>
	  
	 <div class="layui-form-item">
	    <label class="layui-form-label">真实姓名:</label>
	    	<div class="layui-input-block" >
		       <input type="text" id="realName" maxlength="25" name="guest.realName" lay-verify="title" autocomplete="off" placeholder="真实信息名" class="layui-input">
		    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">身份证号码:</label>
	    	<div class="layui-input-block" >
		       <input type="text" id="cardNo" maxlength="18" name="guest.cardNo" lay-verify="required|identity" autocomplete="off" placeholder="请您放心您的个人信息我们将绝不会交给第三方！" class="layui-input">
		    </div>
	  </div>
	    <div class="layui-form-item">
		    <label class="layui-form-label">学校:</label>
		    <div class="layui-input-inline">
		      <select id="schoolID"  class="schoolID layui-select" name="guest.schoolId" lay-verify="required" lay-filter="aihao">
		        
		      </select>
		    </div>
		    <div class="layui-form-mid layui-word-aux schoolIDPrompt">您的学校编号好像有点问题哦~</div>
		    <label class="layui-form-label ">班级:</label>
		    <div class="layui-input-inline">
		      <select id="classID" class="layui-select" name="guest.classId"  lay-filter="aihao">
		        
		      </select>
	    </div>
		    <div class="layui-form-mid layui-word-aux classIDPrompt">您的班级编号好像有点问题哦~</div>
		    
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button type="button" class="layui-btn" id="sub">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</s:form>

  <!--[END]表单填写部分-->
	<script>


    </script>	
	</body>
</html>
</c:if>
<c:if test="${adminid==null }">
	<script>location.href="<%=request.getContextPath()%>/AdminLogin.jsp";</script>
</c:if>
<c:if test="${adminTypeID>4 }">
	<div style="margin-top:20%;margin-left:35%;">
		<font color="red" style="font-size:50px;">您没有权限访问改功能页面</font>
	</div>
</c:if>