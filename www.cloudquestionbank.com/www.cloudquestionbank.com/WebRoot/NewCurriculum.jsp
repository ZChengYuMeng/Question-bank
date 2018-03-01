<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
		<title>新增课程</title>
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<style>
			.Notice{border: 1px solid orangered;}
		</style>
		<script>
			$(function(){
				$.ajaxSetup({async:false});//同步
				//隐藏提示
				$(".course_namePrompt").hide();
				$(".attribute_IDPrompt").hide();
				$(".stageIDPrompt").hide();
				//表单提交事件				
				$("#sub").click(function(){
					var $bool=false;var $course_nameBool=false;var $attribute_IDBool=false;
					var $stageIDBool=false;
					$course_nameBool=VerificationsTextBox($("#course_name"),"给新课程取个名吧！");
					$attribute_IDBool=VerificationsChoolIdOrclassId($("#attribute_ID"),"您还未选择课程的所属分类呢！");
					$stageIDBool=VerificationsChoolIdOrclassId($("#stageID"),"请选择课程所属阶段！");
					if($course_nameBool==true&&$attribute_IDBool==true&&$stageIDBool==true){
						if(VerificationValIsArray($("#stageIDIDArrStr").val().trim(),$("#stageID").val().trim())){//判断所属阶段正确
							if(VerificationValIsArray($("#CourseIDArrStr").val().trim(),$("#attribute_ID").val().trim())){//判断所属课程是否在该阶段下
								if(ISexistenceCourse("&course.stageId="+$("#stageID").val()+"&course.attributeId="+$("#attribute_ID").val().trim()+"&course.courseName="+$("#course_name").val().trim())){
									$bool=true;
								}else{FriendlyPrompt("该阶段下的这个课程已有该课程名！");}
							}else{FriendlyPrompt("您选择的课程有点问题哦~!");}
						}else{FriendlyPrompt("您选择的阶段好像有点问题哦！~");}
						
						
					}
					if($bool){
						var $data="";
							$data+="&course.stageId="+$("#stageID").val();
							$data+="&course.attributeId="+$("#attribute_ID").val().trim();
							$data+="&course.courseName="+$("#course_name").val().trim();
							//console.log($data);
							AddCourse($data);
					}
					
					
					
					
				})
				//------[新增课程]
				function AddCourse($data){
					$.post("<%=request.getContextPath()%>/Admin_AddCourse",$data,success,"json");
					function success(result){
						var $ts=result?"新增课程成功！":"新增课程失败……";
						FriendlyPrompt($ts);
						if(result){$("#AddCourse")[0].reset();}
					}
				}
				//------[END][新增课程]
				
				GetStage();//加载阶段
				//----[加载阶段]
				function GetStage(){
					$.post("<%=request.getContextPath()%>/Admin_GetStage",success,"json");
					function success(result){
						//console.log(result);
						var $html="";var $stageIDs="";//接收储存编号
						$.each(result.stage,function(i,o){
							$html+=i==0?"<option value='"+o[0]+"' selected='selected'>"+o[1]+"</option>":"<option value='"+o[0]+"' >"+o[1]+"</option>";
							$stageIDs+=i==0?o[0]:","+o[0];
						})
						$("#attribute_ID").html($html);
						$("#stageIDIDArrStr").val($stageIDs);//存储阶段编号
					}
				}
				//----[END][加载阶段] 
				GetCourse("&course.stageId="+$("#attribute_ID").val().trim());
				//-----[获取某个阶段下的所课程] 
				 function GetCourse($data){
					console.log($data);				 
				 	$.post("<%=request.getContextPath()%>/Admin_GetCourse",$data,success,"json");
				 	function success(result){
				 		console.log(result);var $html="";var $Course="";//存储课程编号
				 		$.each(result,function(i,o){
				 			$html+=i==0?"<option value='"+o[0]+"' selected='selected'>"+o[1]+"</option>":"<option value='"+o[0]+"' >"+o[1]+"</option>";
				 			$Course+=i==0?o[0]:","+o[0];
				 		})
				 		$("#stageID").html($html);
						$("#CourseIDArrStr").val($Course);//存储阶段编号
				 	}
				 }
				//-----[获取某个阶段下的所课程]  
				
				//------[查询该课程是否存在]
				function ISexistenceCourse($data){
					var bool=false;
					$.post("<%=request.getContextPath()%>/Admin_ISexistenceCourse",$data,success,"json");
					function success(result){
						console.log(result);
						bool=result?false:true;
					}
					return bool;
				}
				//------[END][查询该课程是否存在]
			})
		</script>
	</head>
	<body class="layui-container">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>新增课程</legend>
		</fieldset>
		<!--表单填写部分-->
		<form class="layui-form" id="AddCourse" action="" >
			<div class="layui-form-item">
		    <label class="layui-form-label">所属阶段:</label>
		    <div class="layui-input-inline">
		      <select id="attribute_ID" name="attribute_ID" lay-verify="required" lay-filter="attribute_ID">
		      
		      </select>
		    </div>
		    <div class="layui-form-mid layui-word-aux attribute_IDPrompt">您的学校编号好像有点问题哦~</div>
		    <label class="layui-form-label">所属课程</label>
		    <div class="layui-input-inline">
		      <select id="stageID" name="stageID" lay-verify="required" lay-filter="aihao">
		      	
		      </select>
	   	 	</div>
	   	 	  <div class="layui-form-mid layui-word-aux stageIDPrompt">您的学校编号好像有点问题哦~</div>
	    </div>
	    <div class="layui-form-item">
	    	<label class="layui-form-label">课程名:</label>
		    <div class="layui-input-inline">
		      <input type="text" id="course_name" name="course_name" lay-verify="title" autocomplete="off" placeholder="课程名称" class="layui-input">
		    </div>
		    <div class="layui-form-mid layui-word-aux course_namePrompt">课程名不能为空哦~！</div>
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
			 	
			 	
			 	//阶段切换事件
					form.on('select(attribute_ID)', function(data){
						if(VerificationValIsArray($("#stageIDIDArrStr").val().trim(),data.value)){
							GetCourse("&course.stageId="+data.value);
						}else{FriendlyPrompt("您所选则的阶段好像不存在哦~");} 
					})  
			 	  
			 	//----[END][加载阶段] 
				//-----[获取某个阶段下的所课程] 
				 function GetCourse($data){
					console.log($data);				 
				 	$.post("<%=request.getContextPath()%>/Admin_GetCourse",$data,success,"json");
				 	function success(result){
				 		console.log(result);var $html="";var $Course="";//存储课程编号
				 		$.each(result,function(i,o){
				 			$html+=i==0?"<option value='"+o[0]+"' selected='selected'>"+o[1]+"</option>":"<option value='"+o[0]+"' >"+o[1]+"</option>";
				 			$Course+=i==0?o[0]:","+o[0];
				 		})
				 		$("#stageID").html($html);
						$("#CourseIDArrStr").val($Course);//存储阶段编号
						layui.form.render('select');
				 	}
				 }
				//-----[获取某个阶段下的所课程]    
			 	  
			 	
	  //-----[传入数组，值判断这个值是否在这个数组中true:在False:不在]
		function VerificationValIsArray($arr,$val){
			console.log($arr+"/"+$val);
			var bool=false;
			var $newArr=$arr.split(",");//切割字符串
			  	for(i=0;i<$newArr.length;i++){
			  		bool=$newArr[i]==$val?true:false;
			  		if(bool){break;}
			  	}
			return bool;
		}
		//-----[END][传入数组，值判断这个值是否在这个数组中]
	  
	  //-----[友好提示]
		function FriendlyPrompt($TS){
				layer.msg($TS,{
		 			time:2000
		 			,btn:['好的']
		 			,btnAlign: 'c'    
		 			})
		}
		//-----[END][友好提示]
	    
			});

    </script>	
	</body>
	<input type="hidden" id="stageIDIDArrStr"/>
	<input type="hidden" id="CourseIDArrStr"/> 
</html>
</c:if>
<c:if test="${adminid==null }">
	<script>location.href="<%=request.getContextPath()%>/AdminLogin.jsp";</script>
</c:if>
<c:if test="${adminTypeID!=1 }">
	<div style="margin-top:20%;margin-left:35%;">
		<font color="red" style="font-size:50px;">您没有权限访问改功能页面</font>
	</div>
</c:if>