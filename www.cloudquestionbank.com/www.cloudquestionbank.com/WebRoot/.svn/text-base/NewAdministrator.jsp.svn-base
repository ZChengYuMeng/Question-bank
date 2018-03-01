<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<title>新增管理员</title>
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<style>
			.Notice{border: 1px solid orangered;}
			#imgUrl{max-width: 190px;}
		</style>
		<script>
			$(function(){
				var $schoolID=<%=session.getAttribute("schoolID")%>;//存储校区编号
				var $adminTypes="";									//存储管理员类型编号
				var $schoolIDs="";									//存储校区编号
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
							$schoolIDs+=i==0?o[0]:","+o[0];
						})
						$("#schoolID").html($html);
						//console.log("校区编号——————_"+$schoolIDs);
					}
				}
				//------[加载校区班级]
				//加载管理员类型
				GetAdminType("&admin.adminTypeId="+<%=session.getAttribute("adminTypeID")%>);
			
				//------[获取管理员类型]
				function GetAdminType($data){
					$.post("<%=request.getContextPath()%>/Admin_GetAdminType",$data,success,"json");
					function success(result){
						console.log(result);
						var $html="";
						$.each(result,function(i,o){
							$html+="<option value="+o[0]+" >"+o[1]+"</option>";
							$adminTypes+=i==0?o[0]:","+o[0];
						})
						$("#adminTypeID").html($html);
						//console.log("管理员类型：——"+$adminTypes);
					}
				}
			
			
			
				//------[验证新增管理员类型属于自身低等级的管理员]
				function VerificationsAdmintypeLowerThanOneself(val){
					var bool=false;var $type=false;
						var $types=$adminTypes.split(",");//验证新增管理员在管理员类型表中
						  	for(i=0;i<$types.length;i++){
						  		//console.log($types[i]+"??/"+val);
						  		$type=$types[i]==val?true:false;
						  		if($type){break;}
						  	}
						  	if($type==false){FriendlyPrompt("未找到您添加的管理员类型哦！")}
							if($type){bool=val>(<%=session.getAttribute("adminTypeID")%>)?true:false;}
					return bool;
				}
				//------[END][验证新增管理员类型属于自身低等级的管理员]
				
				//------[验证身份证唯一]
				function VerificationsCardNoOnly($data){
					$.ajaxSetup({async:false});
					var bool=false;
					$.post("<%=request.getContextPath()%>/Admin_IsCardNo",$data,success,"json");
					function success(result){
						bool=result==true?false:true;
					}
					return bool;
				}
				//------[END][验证身份证唯一]
			
				//------[验证邮箱唯一]
				function VerificationsEmileOnly($data){
					$.ajaxSetup({async:false});
					var bool=false;
					$.post("<%=request.getContextPath()%>/Admin_IsEmile",$data,success,"json");
					function success(result){
						bool=result==true?false:true;
					}
					return bool;
				}
				//------[END][验证邮箱唯一]
				//------[验证新增管理员是否为本校区]
				function VerificationsAdminIsMySchool(){
					var bool=false;var $scbool=false;
						//console.log($schoolIDs);
						var $ids=$schoolIDs.split(",");//验证新增管理员在数据库中已有的校区内
						  	for(i=0;i<$ids.length;i++){
						  		//console.log($ids[i]+"??/"+$("#schoolID").val().trim());
						  		$scbool=$ids[i]==$("#schoolID").val().trim()?true:false;
						  		if($scbool){break;}
						  	}
						  	if($scbool==false){FriendlyPrompt("未找到您添加的校区编号！")}
						  	if($scbool==true)//如果为超级管理员直接通过否则获取管理员校区编号对比是否是本校区
						  	{bool=<%=session.getAttribute("schoolID")%>==0?true:<%=session.getAttribute("schoolID")%>==$("#schoolID").val().trim();}
					return bool;
				}
				//------[验证新增管理员是否为本校区]
				
				
				
				
				//隐藏 提示
				$(".pwdPrompt").hide();
				$(".newpwdPrompt").hide();
				$(".emailPrompt").hide();
				$(".admin_phonePrompt").hide();
				$(".admin_namePrompt").hide();
				$(".imgUrlPrompt").hide();
				$(".schoolIDPrompt").hide();
				$(".adminTypeIDPrompt").hide();	
				
				
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
				$("#admin_phone").blur(function(){
					VerificationPhon($(this));//验证手机号
				})
				//用户输入用户名时
				$("#admin_name").keyup(function(){
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
					var $emailBool=false;	
					var $pwdBool=false;
					var $addressBool=false;
					var $realNameBool=false; var $cardNoBool=false;
					var $imgUrlBool=false;   var $schoolIDBool=false;
					var $adminTypeIDBool=false;
					$phoneBool=VerificationPhon($("#admin_phone"));		  //验证手机号	
					$guestNameBool=VerificationGuestName($("#admin_name")); //验证用户名
					$emailBool=VerificationEmail($("#email"));		  //验证邮箱
					$pwdBool=VerificationPwd($("#pwd"),$("#newpwd"));//验证密码
					$addressBool=VerificationIllegalAndPrompt($("#address"),"用户的地址不能为空哦~!","地址中是包含非法字符的哦~");     //验证住址
					$realNameBool=VerificationIllegalAndPrompt($("#realName"),"真实姓名不能为空哦~","真实姓名中是不能有非法字符的哦~");  //验证真实姓名
					$cardNoBool=VerificationCardNo($("#cardNo"));      //验证身份证号码
					$imgUrlBool=VerificationImgUrl($("#imgUrl"));      //验证是否选择头像
					$schoolIDBool=VerificationsChoolIdOrclassId($("#schoolID"),"您还未选择学校编号呢！");           //验证学校编号
					$adminTypeIDBool=VerificationsChoolIdOrclassId($("#adminTypeID"),"哎呀你是不是忘了选择管理员的类型啊~！");  //验证班级编号
					//console.log($phoneBool+$guestNameBool+$emailBool+$pwdBool+$addressBool+$realNameBool+$cardNoBool+$imgUrlBool+$schoolIDBool+$adminTypeIDBool);
					if($phoneBool==true && $guestNameBool==true && $emailBool==true && $pwdBool==true
					  && $addressBool==true && $realNameBool==true && $cardNoBool==true && $imgUrlBool==true 
					  && $schoolIDBool==true && $adminTypeIDBool==true ){
					  	if(VerificationsAdminIsMySchool())//如果为本校区
					  	{	
					  		if(VerificationsAdmintypeLowerThanOneself($("#adminTypeID").val().trim()))//验证新增管理员为等于当期管理员类型的
					  		{	//如果邮箱身份证唯一
						  	    var $cordOnyl=VerificationsCardNoOnly("admin.cardNo="+$("#cardNo").val().trim());
						  	    var $emilOnyl=VerificationsEmileOnly("&admin.email="+$("#email").val().trim());
						  		if($cordOnyl==true&&$emilOnyl==true){
						  			$bool=true;
						  		}else{if($cordOnyl==false){FriendlyPrompt("您的身份证以注册过了呢！")}if($emilOnyl==false){FriendlyPrompt("哎呀~真不巧！这个邮箱被注册了!")}}
					  		}else{FriendlyPrompt("新增管理员必须低于自身权限哦~")}
					  	}
					  	else{FriendlyPrompt("您不能跨区添加管理员哦~");}
					  }
					  
					//验证通过,获取数据
					if($bool){
						FriendlyPrompt("管理员新增中……");
						$("#AddAdmin").submit();
					}
				})	
					
				
			})
		</script>
		
		
		
	</head>
	<body class="layui-container">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>新增管理员</legend>
	</fieldset>
		
		
		<!--表单填写部分-->
	<s:form class="layui-form" id="AddAdmin" action="Admin_AddAdmin" theme="simple" enctype="multipart/form-data" method="post">
	
	  
	  <div class="layui-form-item">
	       <label class="layui-form-label">手机号码:</label>
	      	<div class="layui-input-inline">
	        	<input maxlength="11" id="admin_phone" type="tel" name="admin.adminPhone" lay-verify="required" autocomplete="off" class="layui-input">
	     	</div>
	     	 <div class="layui-form-mid layui-word-aux admin_phonePrompt">手机号有误!</div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户名:</label>
		    <div class="layui-input-inline">
		      <input type="text" id="admin_name" name="admin.adminName" lay-verify="title" autocomplete="off" placeholder="用户名" class="layui-input">
		    </div>
		    <div class="layui-form-mid layui-word-aux admin_namePrompt">用户名不能为空哦~！</div>
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
	        	<input id="email"  type="tel" maxlength="25" name="admin.email" lay-verify="required|email" placeholder="登录账号" autocomplete="off" class="layui-input">
	     </div>
	     <div class="layui-form-mid layui-word-aux emailPrompt">邮箱格式有误！</div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">登录密码:</label>
		   <div class="layui-input-inline">
		        	<input id="pwd" type="password" maxlength="18" name="admin.pwd" lay-verify="required|pass" autocomplete="off" class="layui-input">
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
		      <textarea id="address" name="admin.address" maxlength="250" lay-verify="required" placeholder="湖南省长沙市……" class="layui-textarea"></textarea>
		    </div>
	  </div>
	  
	 <div class="layui-form-item">
	    <label class="layui-form-label">真实姓名:</label>
	    	<div class="layui-input-block" >
		       <input type="text" id="realName" maxlength="25" name="admin.realName" lay-verify="title" autocomplete="off" placeholder="真实信息名" class="layui-input">
		    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">身份证号码:</label>
	    	<div class="layui-input-block" >
		       <input type="text" id="cardNo" maxlength="18" name="admin.cardNo" lay-verify="required|identity" autocomplete="off" placeholder="请您放心您的个人信息我们将绝不会交给第三方！" class="layui-input">
		    </div>
	  </div>
	    <div class="layui-form-item">
		    <label class="layui-form-label">学校:</label>
		    <div class="layui-input-inline">
		      <select id="schoolID"  class="layui-select" name="admin.schoolId" lay-verify="required" lay-filter="aihao">
		      </select>
		    </div>
		    <div class="layui-form-mid layui-word-aux schoolIDPrompt">您的学校编号好像有点问题哦~</div>
		    <label class="layui-form-label">管理员类型:</label>
		    <div class="layui-input-inline">
		      <select id="adminTypeID"  class="layui-select" name="admin.adminTypeId" lay-verify="required" lay-filter="aihao">
		      	
		      </select>
	    </div>
		    <div class="layui-form-mid layui-word-aux adminTypeIDPrompt">您还未选择新增的管理员类型哦~</div>
		    
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
	 
  
});

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