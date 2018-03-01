<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${adminid!=null && adminTypeID==1}">
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
		<title>新增校区</title>
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
				//隐藏
				$(".namePrompt").hide();
				$(".addressPrompt").hide();
				$(".PostalCodePrompt").hide();
				$(".imgUrlPrompt").hide();
				//点击提交时间
				$("#sub").click(function(){
					var  $bool=false;var $nameBool=false;var $PostalCodeBool=false;
					var  $addressBool=false;var $imgUrlBool=false;
					$nameBool=VerificationsTextBox($("#name"),"给新学校取个新名字吧！");
					$PostalCodeBool=VerificationsZipCode($("#PostalCode"),"邮箱好像有点问题呢！");
					$addressBool=VerificationsTextBox($("#address"),"地址不能为空哦！");
					$imgUrlBool=VerificationImgUrl($("#imgUrl"));      //验证是否选择头像 
					if($nameBool==true&&$PostalCodeBool==true&& $addressBool==true&&$imgUrlBool==true){
						if(IsSchoolName("&school.name="+$("#name").val().trim())){
							$bool=true;
						}else{FriendlyPrompt("哎呀~该校区名称以存在换个名字吧!");}
						
					}
					if($bool){
						FriendlyPrompt("新增校区中……");
						$("#AddSchool").submit();
					}
					
				})
				
				//------[查询校区是否存在]
			  	function IsSchoolName($data){
			  		$.ajaxSetup({async:false});
			  		var bool=false;
			  		$.post("<%=request.getContextPath()%>/School_ISschoolName",$data,success,"json");
			  		function success(result){
			  			bool=result==false?true:false;
			  		}
			  		return bool;
			  	}
				//------[END][查询校区是否存在]
			})
		</script>
		
	</head>
	<body class="layui-container">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>新增学校</legend>
		</fieldset>
		
	<s:form class="layui-form" id="AddSchool" action="Admin_AddSchool" theme="simple" enctype="multipart/form-data" method="post">			
	  
	   <div class="layui-form-item">
	   	   <label class="layui-form-label">学校名称:</label>
	   		<div class="layui-input-inline" >
		       <input type="text" id="name" maxlength="50" name="school.name" lay-verify="title" autocomplete="off" placeholder="学校名称" class="layui-input">
		    </div>
		     <div class="layui-form-mid layui-word-aux namePrompt">给新学校取个名字吧~！</div>
	   	
	    	<label class="layui-form-label">邮编:</label>
		     <div class="layui-input-inline" >
		       <input type="text" id="PostalCode" maxlength="6" name="school.postalCode" lay-verify="title" autocomplete="off" placeholder="邮编" class="layui-input">
		    </div>
		     <div class="layui-form-mid layui-word-aux PostalCodePrompt">请输入邮编！</div>
		     
	    </div>
	    	
	   <div class="layui-form-item">
	    <label class="layui-form-label">学校地址:</label>
	    	<div class="layui-input-block" >
		       <input type="text" id="address" maxlength="50" name="school.address" lay-verify="title" autocomplete="off" placeholder="学校地址" class="layui-input">
		    </div>
		    <div class="layui-input-block" >
		     <div class="layui-form-mid layui-word-aux addressPrompt">请输入学校地址?</div>
		    </div>
	  </div>
	  
	   <div class="layui-form-item">
	    <label class="layui-form-label">校区Logo:</label>
	     <div class="layui-input-inline">
	    	 <s:file id="imgUrl" name="file"  type="file" />
	    </div>
	    <div class="layui-form-mid layui-word-aux imgUrlPrompt">您还未选校区Logo呢~！</div>
	  </div>
	  
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button type="button" class="layui-btn" id="sub">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div> 
	  
 	</s:form>	
<script>
layui.use(['form', 'layedit', 'laydate','util', 'layer'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
   var util = layui.util
  ,laydate = layui.laydate
  ,layer = layui.layer;
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
<c:if test="${adminTypeID!=1 }">
	<div style="margin-top:20%;margin-left:35%;">
		<font color="red" style="font-size:50px;">您没有权限访问该页面!</font>
	</div>
</c:if>