<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<meta charset="UTF-8">
		<title>班级管理</title>
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<link rel="stylesheet" href="css/TestQuestionsManagement.css" />
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<style>
			.Upd{max-width: 960px;margin: auto;}
			.Notice{border: 1px solid orangered;}
		</style>
		<script>
			$(function(){
				$.ajaxSetup({async:false});//同步加载数据
				var data="";//接受信息
				
				loadClassState();
				//------[班级状态加载]GetClassStatelist
				function loadClassState(){
					$.post("<%=request.getContextPath()%>/Class_GetClassStatelist","",success,"json");
					function success(result){
						console.log(result);
						var $html=""; var $statArr="";
						$.each(result,function(i,o){
							$statArr+=i==0?o[0]:","+o[0];
							$html+=i==0?"<option value='"+o[0]+"' selected='selected'>"+o[1]+"</option>":"<option value='"+o[0]+"'>"+o[1]+"</option>";
						})
						$("#state").html($html);
						$("#statArr").val($statArr);
						render();
					}
				}
					
				
				//------[END][班级状态加载]
				
				
			
				//隐藏提示
				$(".schoolIDPrompt").hide();
				$(".admin_IDPrompt").hide();
				$(".classSizePrompt").hide();
				$(".namePrompt").hide();
				$(".Upd").hide();
				
				
				//监听提交
				$("#sub").click(function(){
					var $bool=false;
					var $bool=false;var $nameBool=false;var $idBool=false;
					var $admin_IDBool=false;var $classSizeBool=false;var $statidbool=false;
					$idBool=VerificationsTextBox($("#id"),"修改编号好像有点问题哦！");
					$admin_IDBool=VerificationsRadioBtn($("#admin_ID"),"您还未选择教员老师哦！");//验证班级所属教员
					$classSizeBool=VerificationsTextBox($("#classSize"),"您还填写班级所容纳人数呢！");
					$nameBool=VerificationsTextBox($("#name"),"给班级取个名吧！");
					$statidbool=VerificationsChoolIdOrclassId($("#state"),"班级状态不能为空哦！");
					if($admin_IDBool==true&&$classSizeBool==true&&$nameBool==true&&$idBool==true&&$statidbool==true){
						if(VerificationValIsArray($("#statArr").val().trim(),$("#state").val().trim())){//验证班级状态
							if(VerificationValIsArray($("#AdminIDArr").val().trim(),GetRadioBtnVal($("#admin_ID")))){//验证教员编号
								$bool=true;
							}
						}
						
					}
					if($bool){
						var $data="";
						$data+="&ID="+$("#id").val().trim();
						$data+="&name="+$("#name").val().trim();
						$data+="&classSize="+$("#classSize").val().trim();
						$data+="&admin_ID="+GetRadioBtnVal($("#admin_ID"));
						$data+="&state="+$("#state").val().trim();
						console.log($data);
						$(".Upd").hide();
					}
				})
				
				
				
				
				
				
				
				
				
				
				$(".upd").live("click",function(){
					var $data="";var $schoolid="";
					//alert($(this).parent().parent().parent().html());
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//修改数据写入
						if($(this).children("[name=id]").attr("name")=="id"){
							TextBoxWrite($("#id"),$(this).children("[name=id]").val());
						}
						if($(this).attr("name")=="name"){
							TextBoxWrite($("#name"),$(this).html());
						}
						if($(this).attr("name")=="schoolID"){
							TextBoxWrite($("#schoolID"),$(this).html());
						}
						if($(this).attr("name")=="classSize"){
							TextBoxWrite($("#classSize"),$(this).html());
						}
						if($(this).children("[name=schoolID]").attr("name")=="schoolID"){
							$schoolid=$(this).children("[name=schoolID]").val();
							loadTeacher("&admin.schoolId="+$schoolid);
						}
						if($(this).children("[name=admin_ID]").attr("name")=="admin_ID"){
							RadioBtnSelected($("#admin_ID"),$(this).children("[name=admin_ID]").val());
						}
						if($(this).children("[name=state]").attr("name")=="state"){
							SelectedDrop_DownBox($("#state"),$(this).children("[name=state]").val());
						}
						
						
					})
					$data=$data.substring(0,$data.length-1);
					$data="[ {"+$data+"} ]";
					//console.log($data);
					//alert($data);
					
					$(".Upd").show();
					
					
				})
				
				
				//------[加载教员]
				function loadTeacher($data){
					$.post("<%=request.getContextPath()%>/Admin_GetTacher",$data,success,"json");
					function success(result){
						//console.log(result);
						var $html="";var $adminIDArr="";
						$.each(result.Teacher,function(i,o){
							$html+=i==0?"<input type='radio' id='admin_ID' name='admin_ID' value='"+o[0]+"' checked='checked' title='"+o[1]+"' >":"<input type='radio' id='admin_ID' name='admin_ID' value='"+o[0]+"' checked='checked' title='"+o[1]+"' >";
							$adminIDArr+=i==0?o[0]:","+o[0];
						});
						$("#Teachers").html($html);
						$("#AdminIDArr").val($adminIDArr);
						render();
					}					
				}
				//------[END][加载教员]
				
				
				
				 //-----[渲染]
					function render(){
						layui.use(['form', 'layedit', 'laydate','util', 'layer','jquery'], function(){
							layui.form.render('checkbox');
							layui.form.render('radio');
							layui.form.render('select');
						})
					}
					//-----[END][渲染]
				
				
				
				
				
				
				
				//-------layui区
				layui.use(['util', 'laydate', 'layer','carousel','code','element','flow','form','jquery','laydate','layedit','laypage','laytpl','mobile','table','tree','upload'], function(){
					  var laypage = layui.laypage
					  ,layer = layui.layer;
					  var $ = layui.jquery,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
					  				
				  	$.ajaxSetup({async:false});//同步加载数据 				
				  	data=loadPage("&classinfo.schoolId="+<%=session.getAttribute("schoolID")%>);
					//-----[获取班级信息]
					function loadPage($data){
						var datas="";
						$.post("<%=request.getContextPath()%>/Class_GetClassObj",$data,success,"json");
						function success(result){
							datas=result;
							//console.log(datas);
						}
						return datas;
					}
					//-----[END][获取班级信息]
					 
					  
					  var table_heaeHtml="<thead>\
					     <tr>\
					      <th>班级名称</th>\
					      <th>所属学校</th>\
					      <th>班级状态</th>\
					      <th>班级人数</th>\
					      <th>管理教员</th>\
					      <th>创建时间</th>\
					      <th>修改时间</th>\
					      <th class='operation'>操作</th>\
					    </tr> \
					  </thead>";
					  
					  //加载数据调用分页
					  laypage.render({
					    elem: 'pagutui'
					    ,count: data.length
					    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
					    ,jump: function(obj){
					      //模拟渲染
					      document.getElementById('subject').innerHTML = function(){
					        var arr = []
					        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
					         arr.push(table_heaeHtml);
					        layui.each(thisData, function(index, item){
					          arr.push('<tr>\
							      <td name="name">'+item.cname+'</td>\
							      <td name="schoolID">'+item.name+'</td>\
							      <td name="state">'+item.classStateName+'<input type="hidden" name="state" value="'+item.state+'"/><input type="hidden" name="schoolID" value="'+item.schoolID+'"/></td>\
							      <td name="classSize">'+item.classSize+'</td>\
							      <td name="admin_ID">'+item.realName+'<input type="hidden" name="admin_ID" value="'+item.admin_ID+'"/></td>\
							      <td name="createTime">'+item.createTime.substring(0,item.createTime.length-2)+'<input type="hidden" name="id" value="'+item.Id+'"/></td>\
							      <td name="updateTime">'+item.updateTime.substring(0,item.updateTime.length-2)+'</td>\
							        <td> <div class="row">\
								      		<div class="layui-col-lg6">\
								      			<button class="layui-btn  layui-btn-normal upd" title="修改"><i class="layui-icon">&#xe642;</i></button>\
								      		</div>\
								      		<div class="layui-col-lg6">\
								      			<button class="layui-btn  layui-bg-red" title="删除"><i class="layui-icon">&#x1007;</i></button>\
								      		</div>\
							      		</div>\
							  		</td>\
							    </tr>');
					        });
					        return arr.join('');
					      }();
					      
					    }
					  });
					  
					});
				
				
				
				//-------[END]layui区
				
			})
			
		</script>
	</head>
	<body >
		
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>班级管理</legend>
		</fieldset>
		
		
		<!--搜索框-->
		<div class="layui-row search">
			<div class="search_text">
				<div class="layui-form component">
			      <select  id="SearchBox" lay-search="" lay-filter="component"  >
			      	<option value="" >1</option>
			      	<option value="1">1</option>
			      	<option value="1">12</option>
			      	<option value="1">123</option>
			      	<option value="1">1234</option>
			      	<option value="1">123456</option>
			      	<option value="1">11235</option>
			      	<option value="1">11235</option>
			      	<option value="1">11235</option>
			      </select>
			    </div>
				
				 <!--<input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="题干搜索" class="layui-input">
    			 <ul class="SearchResult">
    			 	
    			 </ul>-->
			</div>
			<div class="search_btn">
				<button class="layui-btn  layui-bg-red" title="搜索"><i class="layui-icon">&#xe615;</i></button>
			</div>
		</div>
	 
	 <table id="subject" class="layui-table">
	 	
	 </table>
     <div class="page"> 
     	<div id="pagutui"></div>
     </div>   
     
     
     <!--修改部分-->
     <div class="Upd">
     	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>班级信息修改管理</legend>
		</fieldset>
     <form class="layui-form" id="AddItemAnalysis" action="" >
     		<div class="layui-form-item">
     			<div class="layui-input-inline" >
     				<input type="hidden" id="id" name="id" />
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
			    <label class="layui-form-label">所属学校:</label>
			    <div class="layui-input-inline">
			     <input type="text" id="schoolID" readonly="readonly" maxlength="25" name="schoolID" lay-verify="title" autocomplete="off" placeholder="学校名称" class="layui-input">
			    </div>
	  		</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">班级人数:</label>
			    <div class="layui-input-inline" >
		       		<input type="text" id="classSize" maxlength="25" name="classSize" lay-verify="title" autocomplete="off" placeholder="班级人数" class="layui-input">
		    	</div>
			    <div class="layui-form-mid layui-word-aux classSizePrompt">您的学校编号好像有点问题哦~</div>
	  		</div>
	  		 <div class="layui-form-item">
			    <label class="layui-form-label">班级状态:</label>
			    <div class="layui-input-block">
			      <select id="state" class="state" name="state" lay-verify="required"  lay-filter="aihao">
			      	
			      </select>
			    </div>
			     <div class="layui-input-block">
				  </div>
			  </div>
		  
	  		
	  		
	  		
	  		
	  		<div class="layui-form-item">	
				<label class="layui-form-label">所属教员:</label>
				   <div class="layui-input-block" id="Teachers">
				       
			       </div>
			       <div class="layui-input-block">
			       	<div class="layui-form-mid layui-word-aux admin_IDPrompt">您的还未选择班级所属教员哦~</div>
			       </div>
			</div>	
	  		 <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button type="button" style="width: 100px;" class="layui-btn" id="sub">立即提交</button>
			      <button type="reset" style="width: 100px;" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div> 
	  		
		</form>
		</div>
     <!--修改部分-->
     
     
     <input  type="hidden" id="AdminIDArr" /> 
     <input  type="hidden" id="statArr" /> 
     
     
     
     
     
     
     
     
     
     
     
     
<script>

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