<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${adminid!=null && adminTypeID<3}">
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
		<title>校区管理</title>
			
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all"/>
		<script src="ST/layui/layui.js"></script>
		<link rel="stylesheet" href="ST/zf/css/TestQuestionsManagement.css" />
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<style>
			.Upd{max-width: 960px;margin: auto;}
			.Notice{border: 1px solid orangered;}
		</style>
		<script>
			$(function(){
					$.ajaxSetup({async:false});//同步加载数据
					LoadSchoolStatus();
					//------[加载校区状态]
					function LoadSchoolStatus(){
						$.post("<%=request.getContextPath()%>/School_GetSchoolStatus",success,"json");
						function success(result){
							var $html="";var $SchoolStatusIDArr="";//存储校区状态编号
							$.each(result,function(i,o){
								$html+=i==0?"<option value='"+o[0]+"' selected='selected' >"+o[1]+"</option>":"<option value='"+o[0]+"' >"+o[1]+"</option>";
								$SchoolStatusIDArr+=i==0?o[0]:","+o[0];
							})
							$("#SchoolStatusIDArr").val($SchoolStatusIDArr);
							$("#state").html($html);					
						}
					}
					//------[END][加载校区状态]
					
			
			
			
			
			
			
				//隐藏
				$(".Upd").hide();
				$(".namePrompt").hide();
				$(".addressPrompt").hide();
				$(".PostalCodePrompt").hide();
				
				$(".upd").live("click",function(){
					var $data="";
					//alert($(this).parent().parent().parent().html());
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//写入学校名称、ID、地址、状态。邮政编号
						if($(this).children("[name=id]").attr("name")=="id"){
							TextBoxWrite($("#id"),$(this).children("[name=id]").val());
						}
						if($(this).attr("name")=="name"){
							TextBoxWrite($("#name"),$(this).html());
						}
						if($(this).attr("name")=="address"){
							TextBoxWrite($("#address"),$(this).html());
						}
						if($(this).children("[name=statID]").attr("name")=="statID"){
							SelectedDrop_DownBox($("#state"),$(this).children("[name=statID]").val());
						}
						if($(this).attr("name")=="PostalCode"){
							TextBoxWrite($("#PostalCode"),$(this).html());
						}
					})
					$data=$data.substring(0,$data.length-1);
					$data="[ {"+$data+"} ]";
					//console.log($data);
					//alert($data);
					$(".Upd").show();
				})
				
				
				//点击提交时间
				$("#sub").click(function(){
					var  $bool=false;var $StatBool=false;var $PostalCodeBool=false;
					var  $addressBool=false;var $idBool=false;
					$idBool=VerificationsTextBox($("#id"),"修改校区编号不能为空哦！");
					$StatBool=VerificationsTextBox($("#state"),"校区状态不能为空!");
					$PostalCodeBool=VerificationsZipCode($("#PostalCode"),"邮箱好像有点问题呢！");
					$addressBool=VerificationsTextBox($("#address"),"地址不能为空哦！");
					if($StatBool==true&&$PostalCodeBool==true&& $addressBool==true&&$idBool==true){
						if(VerificationValIsArray($("#SchoolStatusIDArr").val().trim(),$("#state").val().trim())){
							if(VerificationValIsArray($("#SchoolIDarr").val().trim(),$("#id").val().trim())){//确认校区编号
								$bool=true;
							}else{FriendlyPrompt("您输入的校区编号不能为空!")}
							
						}else{FriendlyPrompt("您选择的学校状好像有点问题呢!");}//确认校区状态
					}
					if($bool){
						var $data="";
							$data+="&school.id="+$("#id").val().trim();
							$data+="&school.state="+$("#state").val().trim();
							$data+="&school.PostalCode="+$("#PostalCode").val().trim();
							$data+="&school.address="+$("#address").val().trim();
							console.log($data);
							updSchool($data);
					}
					
				})
				//------[修改学校信息]
				function  updSchool($data){
					$.post("<%=request.getContextPath()%>/School_UpdatSchool",$data,success,"json");
					function success(result){
						//console.log(result);
						var $ts=result?"修改校区信息成功！":"修改校区信息失败……";
						if(result){$("#Upd")[0].reset();$(".Upd").hide();SX();}
						FriendlyPrompt($ts);
					}					
				}
				//------[]
				
				
				
						var data;
					  	//-----[加载页面]
					  	//$.ajaxSetup({async:false});//同步加载数据
					  	LoadPage("&school.id="+<%=session.getAttribute("schoolID")%>);
					  	function LoadPage($data){
					  		$.post("<%=request.getContextPath()%>/School_GetSchoolJsonStr",$data,success,"json");
					  		function success(result){
					  			data=result;
					  			console.log(data);
					  		}
					  	}
					  	//-----[加载页面]
				
				
				//----[LayUI专区]
				layui.use(['util', 'laydate', 'layer','carousel','code','element','flow','form','jquery','laydate','layedit','laypage','laytpl','mobile','table','tree','upload'], function(){
					  var laypage = layui.laypage
					  ,layer = layui.layer;
					  var $ = layui.jquery,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
					  //测试数据
					  
					  
					  //------[写入搜索条]
					  var $html="";
						layui.each(data, function(i, o){
						  		$html=i==0?'<option value="'+o.id+'" selected="true">'+o.name+'</option>':'<option value="'+o.id+'">'+o.name+'</option>';
						  	//console.log($html);
						  	$('#SearchBox').append($html);
						  }) 
						layui.form.render('select');
					  //------[END][写入搜索条]
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  var table_heaeHtml="<thead>\
					    <tr>\
					      <th >学校名称</th>\
					      <th >学校地址</th>\
					      <th >学校状态</th>\
					      <th >学校邮政编码</th>\
					      <th >学校LOGO</th>\
					      <th class='operation'>操作</th>\
					    </tr> \
					  </thead>";
					  var $IDarr="";//存储校区编号
					  //加载数据调用分页
					  laypage.render({
					    elem: 'pagutui'
					    ,url:'table.json'
					    ,count: data.length
					    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
					    ,jump: function(obj){
					      //模拟渲染
					      document.getElementById('DataDisplay').innerHTML = function(){
					        var arr = []
					        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
					         arr.push(table_heaeHtml);
					         arr.push("<tabody>");
					         $IDarr="";
					        layui.each(thisData, function(index, item){
					          arr.push('<tr>\
							     <td name="name">'+item.name+'</td>\
							      <td name="address">'+item.address+'</td>\
							      <td name="state">'+item.StateName+'<input type="hidden" name="statID" value="'+item.statID+'"/></td>\
							      <td name="PostalCode">'+item.PostalCode+'</td>\
							      <td name="Icon"><img src="'+item.Icon+'" /><input type="hidden" name="id" value="'+item.id+'"/></td>\
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
							    $IDarr+=index==0?item.id:","+item.id;
					        });
					        	$("#SchoolIDarr").val($IDarr);
					        return arr.join('');
					      }();
					      
					    }
					  });
					  
					});
					//----[END][LayUI专区]
				
				
				
				
				
				
				
				
				
			})
			
		</script>
	</head>
	<body >
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>校区管理</legend>
			</fieldset>
		<!--搜索框-->
		<div class="layui-row search">
			<div class="search_text">
				<div class="layui-form component">
			      <select  id="SearchBox" lay-search="" lay-filter="component"  >
			      
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
	 
	 <table id="DataDisplay" class="layui-table">
	 	
	 </table>
     <div class="page"> 
     	<div id="pagutui"></div>
     </div>   
     
    <!--修改部分-->
    <div class="Upd">
    	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>修改校区信息</legend>
		</fieldset>
		<form class="layui-form" id="Upd" action=""> 
			<div class="layui-form-item">
				     <div class="layui-input-inline">
				     	<input type="hidden" name="id" id="id"/>
				    </div>
			 </div>
			
		
		
     		<div class="layui-form-item">
		   	   <label class="layui-form-label">学校名称:</label>
		   		<div class="layui-input-inline" >
			       <input type="text" id="name"  maxlength="50" name="name" lay-verify="title" autocomplete="off" placeholder="学校名称" readonly="readonly" class="layui-input">
			    </div>
			     <div class="layui-form-mid layui-word-aux namePrompt"></div>
		   	
		    	<label class="layui-form-label">邮编:</label>
			     <div class="layui-input-inline" >
			       <input type="text" id="PostalCode" maxlength="50" name="PostalCode" lay-verify="title" autocomplete="off" placeholder="邮编" class="layui-input">
			    </div>
			     <div class="layui-form-mid layui-word-aux PostalCodePrompt">请输入邮编！</div>
			     
	   		 </div>
	    	<div class="layui-form-item">
	    		<label class="layui-form-label">学校状态:</label>
	    		<div class="layui-input-block" >
	    			<select id="state" name="state" lay-verify="required" lay-filter="aihao">

			        </select>
	    	 	</div>
	    	</div>
	   <div class="layui-form-item">
	    <label class="layui-form-label">学校地址:</label>
	    	<div class="layui-input-block" >
		       <input type="text" id="address" maxlength="50" name="address" lay-verify="title" autocomplete="off" placeholder="学校地址" class="layui-input">
		    </div>
		    <div class="layui-input-block" >
		     <div class="layui-form-mid layui-word-aux addressPrompt">请输入学校地址?</div>
		    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button type="button" class="layui-btn" style="width: 100px;" id="sub">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary" style="width: 100px;">重置</button>
	    </div>
	  </div> 
		
		</form>
     </div>
    <!--[END]修改部分-->
     
     
     
     
     
     
<script>

</script>
	<input type="hidden" id="SchoolIDarr">
	<input type="hidden" id="SchoolStatusIDArr" />
	</body>
</html>
</c:if>
<c:if test="${adminid==null }">
	<script>location.href="<%=request.getContextPath()%>/AdminLogin.jsp";</script>
</c:if>
<c:if test="${adminTypeID>2 }">
	<div style="margin-top:20%;margin-left:35%;">
		<font color="red" style="font-size:50px;">您没有权限访问该页面!</font>
	</div>
</c:if>