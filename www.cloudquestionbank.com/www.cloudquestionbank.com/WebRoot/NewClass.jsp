<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${adminid!=null && adminTypeID<=3}">
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
		<title>新增班级</title>
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		
		<style>
			.Notice{border: 1px solid orangered;}
		</style>
		<script>
			$(function(){
				
				var $schoolID=<%=session.getAttribute("schoolID")%>;//存储校区编号
				var $schoolIDArr="";								//存储校区编号集合编号
				
				load("&school.id="+$schoolID);
				//------[加载校区班级]
				function load($data){
					$.post("<%=request.getContextPath()%>/School_GetSchoolList",$data,success,"json");
					function success(result){
						//console.log(result);
						var $html="";
						$.each(result.School,function(i,o){
							$html+="<option value="+o[0]+" >"+o[1]+"</option>";
							$schoolIDArr+=i==0?o[0]:","+o[0];
						})
						$("#schoolID").html($html);
						render();
					}
				}
				//------[加载校区班级]
					loadTacher("&admin.schoolId="+<%=session.getAttribute("schoolID")%>);//加载教员信息
				   //------[加载教员信息]
				   function loadTacher($data){
				   		$.post("<%=request.getContextPath()%>/Admin_GetTacher",$data,success,"json");
				   		function success(result){
				   			var $html="";var $IDArr="";
				   			$.each(result.Teacher,function(i,o){
				   				$html+="<input type='radio' id='admin_ID' name='admin_ID' value='"+o[0]+"' title='"+o[1]+"' >";
				   				$IDArr+=i==0?o[0]:","+o[0];
				   			})
				   			$("#TacherArr").html($html);
				   			$("#TacherIDArr").val($IDArr);//存储教员ID
				   			render();
				   		}
				   }	
				   //------[加载教员信息]
				
				
			    //-----[渲染]
				function render(){
					layui.use(['form', 'layedit', 'laydate','util', 'layer','jquery'], function(){
						layui.form.render('checkbox');
						layui.form.render('select');
						layui.form.render('radio');
					})
				}
				//-----[END][渲染]
			
				//隐藏提示
				$(".schoolIDPrompt").hide();
				$(".admin_IDPrompt").hide();
				$(".classSizePrompt").hide();
				$(".namePrompt").hide();
				//监听提交
				$("#sub").click(function(){
					var $bool=false;var $schoolIDBool=false;var $nameBool=false;
					var $admin_IDBool=false;var $classSizeBool=false;
					$schoolIDBool=VerificationsChoolIdOrclassId($("#schoolID"),"请选择班级所属学校！");//验证班级所属学校
					$admin_IDBool=VerificationsRadioBtn($("#admin_ID"),"您还未选择教员老师哦！");//验证班级所属教员
					$classSizeBool=VerificationsChoolIdOrclassId($("#classSize"),"您还填写班级所容纳人数呢！");
					$nameBool=VerificationsTextBox($("#name"),"给班级取个名吧！");
					if($schoolIDBool==true&&$admin_IDBool==true&&$classSizeBool==true&&$nameBool==true){
						if(VerificationValIsArray($schoolIDArr,$("#schoolID").val().trim())){//验证校区编号是否于数据库中一致
							console.log($("#TacherIDArr").val()+"////"+$("#admin_ID").val());
							if(VerificationValIsArray($("#TacherIDArr").val(),$("#admin_ID").val())){
								if(ISSchoolClassName("&classinfo.cname="+$("#name").val().trim()+"&classinfo.schoolId="+$("#schoolID").val().trim())){
									$bool=VerificationValIsNumber($("#classSize").val().trim(),"您输入的班级人数有误哦!");
								}else{FriendlyPrompt("哎呀~这个名称太火了！换个班级名称吧~！");}
							}else{FriendlyPrompt("您选择的管理员貌似不是该校区的呢！");}
						}else{FriendlyPrompt("哎呀~您的校区编号是不是出错了呢!");}
					}
					if($bool){
						var $data="";
							$data+="&Cs.cname="+$("#name").val().trim();
							$data+="&Cs.schoolId="+$("#schoolID").val().trim();
							$data+="&Cs.classSize="+$("#classSize").val().trim();
							$data+="&Cs.adminId="+$("#admin_ID").val().trim();
							//console.log($data);
							AddClass($data);
					}
				})
				
				//----[新增班级]
				function AddClass($data){
					$.post("<%=request.getContextPath()%>/Admin_AddClass",$data,success,"json");
					function success(result){
						var $Ts=result?"新增班级成功！":"新增班级失败……";
						FriendlyPrompt($Ts);
						if(result){$("#AddClass")[0].reset();}//重置修改表单
					}
				}
				
				//----[END][新增班级]
			
				//-----[查询该校区班级名称是否唯一]
			  	function ISSchoolClassName($data){
			  		bool=false;$.ajaxSetup({async:false});//同步
			  		$.post("<%=request.getContextPath()%>/Class_ISSchoolName",$data,success,"json");
			  		function success(result){
			  			console.log("result_"+result);
			  			bool=result?false:true;
			  		}
			  		return bool;
			  	}
				//-----[END][查询该校区班级名称是否唯一]
			})
			
			
		</script>
		
	</head>
	<body class="layui-container">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>新增班级</legend>
		</fieldset>
		<input type="hidden" id="TacherIDArr" /> 
		<form class="layui-form" id="AddClass" action="" >
			<div class="layui-form-item">
			    <label class="layui-form-label">学校:</label>
			    <div class="layui-input-inline">
			      <select id="schoolID" lay-filter="schoolID"  name="schoolID" lay-verify="required" >
			      	
			      </select>
			    </div>
			    
	  		</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">班级名称:</label>
			    <div class="layui-input-inline" >
		       		<input type="text" id="name" maxlength="25" name="name" lay-verify="title" autocomplete="off" placeholder="取个好名字吧！" class="layui-input">
		    	</div>
			    <div class="layui-form-mid layui-word-aux namePrompt">您的学校还未填写名称哦~</div>
	  		</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">班级人数:</label>
			    <div class="layui-input-inline" >
		       		<input type="text" id="classSize" maxlength="25" name="classSize" lay-verify="title" autocomplete="off" placeholder="班级人数" class="layui-input">
		    	</div>
			    <div class="layui-form-mid layui-word-aux classSizePrompt">您的学校编号好像有点问题哦~</div>
	  		</div>
	  		 <div class="layui-form-item">	
				<label class="layui-form-label">所属教员:</label>
				   <div id="TacherArr" class="layui-input-block">
			       </div>
			       <div class="layui-input-block">
			       	<div class="layui-form-mid layui-word-aux admin_IDPrompt">您的还未选择班级所属教员哦~</div>
			       </div>
			</div>	
	  		 <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button type="button" class="layui-btn" id="sub">立即提交</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div> 
	  		
		</form>
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
		 	  
	 	 		 	//校区切换事件
					form.on('select(schoolID)', function(data){
						if(<%=session.getAttribute("schoolID")%>==0){
							//console.log("admintype_0");
							loadTacher("&admin.schoolId="+data.value);
						}else{
							 if(<%=session.getAttribute("schoolID")%>==data.value){
								loadTacher("&admin.schoolId="+data.value);
							}else{FriendlyPrompt("您的权限还不够哦！加油！");} 
						}
					})
		 	  		 //------[加载教员信息]
				   function loadTacher($data){
				   		$.post("<%=request.getContextPath()%>/Admin_GetTacher",$data,success,"json");
				   		function success(result){
				   			var $html="";var $IDarr="";
				   			$.each(result.Teacher,function(i,o){
				   				$html+="<input type='radio' id='admin_ID' name='admin_ID' value='"+o[0]+"' title='"+o[1]+"' >";
				   				$IDarr+=i==0?o[0]:","+o[0];
				   			})
				   			$("#TacherArr").html($html);
				   			console.log("LayuiIDArr_"+$IDarr);
				   			$("#TacherIDArr").val($IDarr);//存储教员编号
				   			layui.form.render('radio');
				   		}
				   }	
				   //------[加载教员信息]
		 	  
		 	  
		});

    </script>			
		
	</body>
</html>
</c:if>
<c:if test="${adminid==null }">
	<script>location.href="<%=request.getContextPath()%>/AdminLogin.jsp";</script>
</c:if>
<c:if test="${adminTypeID>3 }">
	<div style="margin-top:20%;margin-left:35%;">
		<font color="red" style="font-size:50px;">您没有权限访问改功能页面</font>
	</div>
</c:if>