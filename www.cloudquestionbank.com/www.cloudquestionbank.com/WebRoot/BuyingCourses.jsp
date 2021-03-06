<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${adminid!=null && adminTypeID<4}">
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>购买课程</title>
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<style>
			.Body{max-width: 1300px;margin: auto;}
		</style>
		<script type="text/javascript" src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<script>
			$(function(){
				$.ajaxSetup({async:false});
				var $schoolID=<%=session.getAttribute("schoolID")%>;//存储校区编号
				var $classID="";										//存储班级编号
				var $stageIDs="";										//存储阶段编号
				var $GuestID="";										//储存用户编号
				var $schoolIDs="";											//储存校区编号
				load("&school.id="+$schoolID);
				//------[加载校区班级]
				function load($data){
					$.post("<%=request.getContextPath()%>/School_GetList",$data,success,"json");
					function success(result){
						$classID="";//清空班级编号
						var $html="";$schoolIDs="";//清空
						$.each(result.School,function(i,o){
							//console.log(o[i]);
							$html+=i==0?"<option value='"+o[0]+"' selected='selected' >"+o[1]+"</option>":"<option  value='"+o[0]+"'  >"+o[1]+"</option>";
							$schoolIDs+=i==0?o[0]:","+o[0];
						})
						//console.log($html);
						$("#schoolID").html($html);$html="";//清空数据
						$.each(result.Class,function(i,o){
							//console.log(o[i]);
							$classID+=i==0?o[0]:","+o[0];
							$html+=i==0?"<option value="+o[0]+" selected='selected' >"+o[1]+"</option>":"<option value="+o[0]+" >"+o[1]+"</option>";
						})
						$("#ClassID").html($html);
						$("#ClassIDArrStr").val($classID);//存储班级编号
						$("#SChoolIDArrStr").val($schoolIDs);//存储校区编号
					}
				}
				//------[加载校区班级]
				
				//----[加载用户]
				function LoadGuest($data){
					console.log($data);
					$.post("<%=request.getContextPath()%>/Guest_GetCommonSchoolAndClassGuest",$data,success,"json");
					function success(result){
						var $html="";$GuestID="";//清空
						$.each(result,function(i,o){
							var Obj=o;
							//console.log(Obj[1]);
							$html+=" <input type='checkbox' id='guestID' class='guestID' name='guestID' value='"+Obj[0]+"' title='"+Obj[1]+"'/>";
							$GuestID+=i==0?Obj[0]:","+Obj[0];
						})
						$("#GuestIDArrStr").val($GuestID);//存储用户ID
						$("#GUestArr").html($html);
						//render();
					}
				}
				//----[END][加载用户]
				GetStage();//加载阶段
				LoadGuest("&guest.classId="+$("#ClassID").val()+"&guest.schoolId="+$("#schoolID").val()+"&stage.id="+$("#stageID").val());//加载班级未购买用户
				//----[加载阶段]
				function GetStage(){
					$.post("<%=request.getContextPath()%>/Admin_GetStage",success,"json");
					function success(result){
					//console.log(result);
						var $html="";
						$.each(result.stage,function(i,o){
							$html+=i==0?"<option value='"+o[0]+"' selected='selected'>"+o[1]+"</option>":"<option value='"+o[0]+"' >"+o[1]+"</option>";
							$stageIDs+=i==0?o[0]:","+o[0];
						})
						$("#stageID").html($html);
						$("#stageIDIDArrStr").val($stageIDs);//存储阶段编号
					}
				}
				//----[END][加载阶段]
				
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
				$(".guestIDPrompt").hide();
				$(".stageIDPrompt").hide();
				$(".expirationDatePrompt").hide();
				$(".schoolIDPrompt").hide();
				$(".ClassIDPrompt").hide();
				//监听提交
				$("#sub").click(function(){
					var $bool=false;var $guestIDBool=false;
					var $stageIDBool=false;var $expirationDateBool=false;
					var $schoolIDBool=false;var $ClassBool=false;
					$guestIDBool=VerificationsCheckBox($(".guestID"),"guestID");
					$stageIDBool=VerificationsChoolIdOrclassId($("#stageID"),"请选择用户需要购买的课程阶段！");
					$expirationDateBool=VerificationsTextBox($("#expirationDate"),"请选择课程阶段的到期时间！");
					$schoolIDBool=VerificationsChoolIdOrclassId($("#schoolID"),"您还未选中您所属的学校！");
					$ClassBool=VerificationsChoolIdOrclassId($("#ClassID"),"您还未选择班级呢！");
					
					if($guestIDBool==true && $stageIDBool==true&& $expirationDateBool==true&&
					   $schoolIDBool==true &&$ClassBool==true){
					   	 $expirationDateBool=getdatetime()<$("#expirationDate").val()?true:false;
					   	 if($expirationDateBool==true){
					   	 	if(VerificationValIsArray($("#SChoolIDArrStr").val(),$("#schoolID").val())){//过滤校区编号
					   	 		if(VerificationValIsArray($("#ClassIDArrStr").val(),$("#ClassID").val())){//过滤班级编号
					   	 			if(VerificationArrIsArrArg($("#GuestIDArrStr").val(),ObtainCheckBox($(".guestID"),"guestID"))){//过滤用户编号
					   	 				if(VerificationValIsArray($("#stageIDIDArrStr").val(),$("#stageID").val())){//过滤购买阶段
					   	 					$bool=true;
					   	 				}else{FriendlyPrompt("您购买的阶段有点问题哦！");}
					   	 			}else{FriendlyPrompt("用户好像不在该班级哦!");}
					   	 		}else{FriendlyPrompt("哎呀~好像没有这个班级哦！");}
					   	 	}else{FriendlyPrompt("您不能跨校区操作哦!");}
					   	 }else{
					   	 	ShowPrompt($("#expirationDate"),$expirationDateBool,"购买到期时间好像有点问题哦~！");
					   	 }
					   }
					if($bool){
						var $data="";
							$data+="&pe.stageId="+$("#stageID").val().trim();
							$data+="&pe.expirationDate="+$("#expirationDate").val().trim();
							$data+="&GuestIDArr="+ObtainCheckBox($(".guestID"),"guestID");
							console.log($data);
							GuestByStage($data);
					}
					//-----[用户购买课程]
					function GuestByStage($data){
						$.post("<%=request.getContextPath()%>/Admin_GuestByStage",$data,success,"json");
						function success(result){
							var $ts=result?"购买阶段成功!":"购买阶段失败";
							FriendlyPrompt($ts);
							if(result){SX();}//[购买成功后刷新界面]
						}
					}
					
					//-----[END][用户购买课程]
				})
				//---[购买成功后刷新界面]
				function SX(){
					setTimeout(function showTime(){
    				window.location.reload();//刷新当前页面.
					}, 2000);
				}
				//---[END][购买成功后刷新界面]
				
				
				  
			  
			   
				
			})
		</script>
	</head>
	<body class="Body">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>购买课程</legend>
		</fieldset>
		<form class="layui-form" id="AddItemAnalysis" action="" >	
		
	  <div class="layui-form-item">
		    <label class="layui-form-label">学校:</label>
		    <div class="layui-input-inline" >
		      <select id="schoolID"   lay-filter="schoolID">
		      	
		      </select>
		    </div>
		    <div class="layui-form-mid layui-word-aux schoolIDPrompt">您的学校编号好像有点问题哦~</div>
		    <label class="layui-form-label">班级:</label>
		    <div class="layui-input-inline">
		      <select id="ClassID"   lay-filter="ClassID">
		      	
		      </select>
	        </div>
	        <div class="layui-form-mid layui-word-aux ClassIDPrompt">您的还未选择需要考试的班级哦~</div>
	  </div>
	  <div class="layui-form-item">	
		<label class="layui-form-label">购买用户:</label>
		 <div id="GUestArr" class="layui-input-block">
		      
	       </div>
	       <div class="layui-input-block">
	       	<div class="layui-form-mid layui-word-aux guestIDPrompt">您的还未选购买用户哦~</div>
	       </div>
	</div>	
	  <div class="layui-form-item">
		    <label class="layui-form-label">购买阶段:</label>
		    <div class="layui-input-inline">
		      <select id="stageID" name="stageID"  lay-filter="stageID">
		      
		      </select>
		    </div>
		    <div class="layui-form-mid layui-word-aux stageIDPrompt">您还未选择需要购买的阶段哦~</div>
	 </div>	
	 
	 <div class="layui-form-item">
	 	<label class="layui-form-label">结束时间:</label>
		    <div class="layui-input-inline">
		      <input type="text" class="layui-input" name="expirationDate" id="expirationDate" placeholder="yyyy-MM-dd HH:mm:ss">
		    </div>
		    <div class="layui-form-mid layui-word-aux expirationDatePrompt">课程到期时间!</div>
	 </div>
	 <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button type="button" class="layui-btn" id="sub">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div> 
	 
	
	</form>
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
	 			 $.ajaxSetup({async:false});
	   laydate.render({
	     elem: '#expirationDate'
	    ,type: 'datetime'
	  	}); 
	  				//校区切换事件
					form.on('select(schoolID)', function(data){
						if(<%=session.getAttribute("schoolID")%>==0){
							//console.log("admintype_0");
							changeload("&school.id="+data.value);
							LoadGuest("&guest.classId="+$("#ClassID").val()+"&guest.schoolId="+$("#schoolID").val()+"&stage.id="+$("#stageID").val());
						}else{
							 if(<%=session.getAttribute("schoolID")%>==data.value){
								changeload("&school.id="+data.value);
								LoadGuest("&guest.classId="+$("#ClassID").val()+"&guest.schoolId="+$("#schoolID").val()+"&stage.id="+$("#stageID").val());
							}else{FriendlyPrompt("您的权限还不够哦！加油！");} 
						}
					})
					//班级切换事件
					form.on('select(ClassID)', function(data){
						if(VerificationValIsArray($("#ClassIDArrStr").val().trim(),data.value)){
							LoadGuest("&guest.classId="+$("#ClassID").val()+"&guest.schoolId="+$("#schoolID").val()+"&stage.id="+$("#stageID").val());
						}else{FriendlyPrompt("您所选则的班级好像不在本校区哦~");} 
					})
					//阶段切换事件
					form.on('select(stageID)', function(data){
						if(VerificationValIsArray($("#stageIDIDArrStr").val().trim(),data.value)){
							LoadGuest("&guest.classId="+$("#ClassID").val()+"&guest.schoolId="+$("#schoolID").val()+"&stage.id="+$("#stageID").val());
						}else{FriendlyPrompt("您所选则的班级好像不在本校区哦~");} 
					})
					
					
					var $classID="";//存储班级编号
	  				//------[加载班级]
					function changeload($data){
						$.post("<%=request.getContextPath()%>/School_GetList",$data,success,"json");
						function success(result){
							$classID="";//清空
							var $html="";
							$.each(result.Class,function(i,o){
								$classID+=i==0?o[0]:","+o[0];
								$html+=i==0?"<option value='"+o[0]+"' selected='selected' >"+o[1]+"</option>":"<option  value='"+o[0]+"'  >"+o[1]+"</option>";
							})
							$("#ClassIDArrStr").val($classID);//存储班级编号
							$("#ClassID").html($html);
							layui.form.render('select');
						}
					}
					//------[END][加载班级]
	  				//----[加载用户]
	  				var $GuestID="";
					function LoadGuest($data){
						console.log($data);
						$.post("<%=request.getContextPath()%>/Guest_GetCommonSchoolAndClassGuest",$data,success,"json");
						function success(result){
							var $html="";
							$.each(result,function(i,o){
								var Obj=o;
								//console.log(Obj[1]);
								$html+=" <input type='checkbox' id='guestID' class='guestID' name='guestID' value='"+Obj[0]+"' title='"+Obj[1]+"'/>";
								$GuestID+=i==0?Obj[0]:","+Obj[0];
							})
							$("#GuestIDArrStr").val($GuestID);//存储用户ID
							$("#GUestArr").html($html);
							layui.form.render('checkbox');
						}
					}
					//----[END][加载用户]
	  
	  
	  
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
		<input type="hidden" id="ClassIDArrStr"/>
		<input type="hidden" id="GuestIDArrStr"/>
		<input type="hidden" id="SChoolIDArrStr"/>
		<input type="hidden" id="stageIDIDArrStr"/>
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