<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<title>管理员管理</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/ST/layui/css/layui.css" media="all" />
		<script src="${pageContext.request.contextPath }/ST/layui/layui.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/ST/zf/css/UserManagement.css" />
		<script src="${pageContext.request.contextPath }/ST/yanglu/js/jquery-1.4.2.min.js"></script>	
		<script src="ST/zf/js/Currency.js"></script>
		<style>
			.Upd{max-width: 960px;margin: auto;}
			.Notice{border: 1px solid orangered;}
			#imgUrl{max-width: 190px;}
		</style>
		<script>
			$(function(){
				  	$.ajaxSetup({async:false});//同步加载数据
				  	var $StatusIDS="";		   //存储管理员状态集合
				  	var $TypeIDs="";		   //存储管理员类型编号集合
				   	var data;//数据集合
				  	 	data=LoadPage("&admin.adminTypeId="+<%=session.getAttribute("adminTypeID")%>+"&admin.schoolId="+<%=session.getAttribute("schoolID")%>);
					//----[加载Page]
					function LoadPage($data){
						var datas="";
						$.post("<%=request.getContextPath()%>/Admin_GetObjectListAdmin",$data,success,"json");
						function success(result){
							datas=result;
							//console.log(datas);
						}
						return datas;
					}
					//----[END][加载Page]
					
					GetAdminStatuSAndType("&admin.adminTypeId="+<%=session.getAttribute("adminTypeID")%>);
					//-----[获取管理员状态，类型]GetAdminStatusAndType
					function GetAdminStatuSAndType($data){
						$.post("<%=request.getContextPath()%>/Admin_GetAdminStatusAndType",$data,success,"json");
						function success(result){
							//加载管理员状态
							var $html="";
							$.each(result.Status,function(i,o){
								//console.log(o[0]+"/"+o[1]);
								$html+="<option value='"+o[0]+"' >"+o[1]+"</option>";
								$StatusIDS+=i==0?o[0]:","+o[0];
							})
							$("#status").html($html);$html="";//清空
							//加载管理员类型
							$.each(result.type,function(i,o){
								//console.log(o[0]+"/"+o[1]);
								$html+="<option value='"+o[0]+"' >"+o[1]+"</option>";
								$TypeIDs+=i==0?o[0]:","+o[0];
							})
							$("#adminTypeID").html($html);
							render();//渲染
						}
					}
					
					//-----[END][获取管理员状态，类型]
			
			
			
					 //-----[渲染]
					function render(){
						layui.use(['form', 'layedit', 'laydate','util', 'layer','jquery'], function(){
							layui.form.render('checkbox');
							layui.form.render('select');
						})
					}
					//-----[END][渲染]
			
			
				
					 
			
				
			
					//隐藏 提示
					$(".statusPrompt").hide();
					$(".imgUrlPrompt").hide();
					$(".schoolIDPrompt").hide();
					$(".adminTypeIDPrompt").hide();	
					$(".Upd").hide();
				//表单提交事件				
				$("#sub").click(function(){
					var $bool=false;
					var $addressBool=false;
					var $adminTypeIDBool=false;
					var $statusBool=false;var $idBool=false;
					$idBool=VerificationsTextBox($("#id"),"修改管理员的编号不能为空哦！"); //验证ID
					$addressBool=VerificationIllegalAndPrompt($("#address"),"用户的地址不能为空哦~!","地址中是包含非法字符的哦~");     //验证住址
					$adminTypeIDBool=VerificationsChoolIdOrclassId($("#adminTypeID"),"哎呀你是不是忘了选择管理员的类型啊~！");  //验证管理员类型
					$statusBool=VerificationsChoolIdOrclassId($("#status"),"哎呀你是不是忘了选择管理员状态啊~！");//验证管理员状态
					//console.log($phoneBool+$guestNameBool+$emailBool+$pwdBool+$addressBool+$realNameBool+$cardNoBool+$imgUrlBool+$schoolIDBool+$adminTypeIDBool);
					if($idBool==true&&$addressBool==true  && $adminTypeIDBool==true ){
					  	//验证管理员状态
					  	if(VerificationValIsArray($StatusIDS,$("#status").val().trim())){
					  		console.log($TypeIDs+"//"+$("#adminTypeID").val());
					  		if(VerificationValIsArray($TypeIDs,$("#adminTypeID").val().trim())){//验证管理员类型
					  		//console.log($("#adminTypeID").val()+"//"+<%=session.getAttribute("adminTypeID")%>);
					  		  if($("#adminTypeID").val()><%=session.getAttribute("adminTypeID")%>){//如果修改管理员的类型必须低于当前管理员的类型
					  		  	$bool=true;
					  		  }else{FriendlyPrompt("您修改的管理员类型必须低于您哦~!");}
					  		}else{FriendlyPrompt("您修改的管理员类型好像不在当前管理员范围哦~!");}
					  	}else{FriendlyPrompt("您选择的管理员状态好像有点错误呢~!");}
					  }
					  
					//验证通过,获取数据
					if($bool){
						var $data="";
						    $data+="&admin.adminId="+$("#id").val().trim();
						    $data+="&admin.address="+$("#address").val().trim();
						    $data+="&admin.adminTypeId="+$("#adminTypeID").val().trim();
						    $data+="&admin.status="+$("#status").val().trim();
							console.log($data);
						//$("#AddGuest").submit();
						if(Updadmin($data)){
							FriendlyPrompt("修改成功！刷新即可查看~");
							$(".Upd").hide();
							$("#UpDAdmin")[0].reset();//重置修改表单
						}else{FriendlyPrompt("修改信息失败")}
						
					}
				})	
				
				//-----[修改管理员信息]
				function Updadmin($data){
					var bool=false;
					$.post("<%=request.getContextPath()%>/Admin_UpdAdmin",$data,success,"json");
					function success(result){
						console.log(result==true);
						bool=result;
					}
					return bool;
				}
				//-----[END][修改管理员信息]
				
					
				
				$(".upd").live("click",function(){
					var $data="";
					//alert($(this).parent().parent().parent().html());
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//写入修改数据
						if($(this).children("[name=id]").attr("name")=="id"){
							//console.log("/val"+$(this).children("[name=id]").val());
							TextBoxWrite($("#id"),$(this).children("[name=id]").val());
						}
						if($(this).attr("name")=="adminName"){
							TextBoxWrite($("#cardNo"),$(this).html());
						}
						if($(this).attr("name")=="address"){
							TextBoxWrite($("#address"),$(this).html());
						}
						//选中管理员类型
						if($(this).children("[name=adminTypeId]").attr("name")=="adminTypeId"){
							SelectedDrop_DownBox($("#adminTypeID"),$(this).children("[name=adminTypeId]").val());
						}
						if($(this).children("[name=statusid]").attr("name")=="statusid"){
							SelectedDrop_DownBox($("#status"),$(this).children("[name=statusid]").val());
						}
						
					})
					$data=$data.substring(0,$data.length-1);
					$data="[ {"+$data+"} ]";
					console.log($("#id").val()+"//"+<%=session.getAttribute("adminid")%>);
					//alert($data);
					$(".Upd").show();
					
					
				})
				
				//-----[Layui专区]
			layui.use(['util', 'laydate', 'layer','carousel','code','element','flow','form','jquery','laydate','layedit','laypage','laytpl','mobile','table','tree','upload'], function(){
				 var form = layui.form
							  ,layer = layui.layer
							  ,layedit = layui.layedit
							  ,laydate = layui.laydate;
							   var util = layui.util
							  ,laydate = layui.laydate
							  ,layer = layui.layer;
				  var laypage = layui.laypage
				  ,layer = layui.layer;
				  var $ = layui.jquery,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
				 				
					//console.log("data_"+data);
				  var table_heaeHtml="<thead>\
				    <tr>\
				      <th >管理员编号</th>\
				      <th >用户名</th>\
				      <th >手机号</th>\
				      <th >最后一次登录时间</th>\
				      <th >修改时间</th>\
				      <th >管理员状态</th>\
				      <th >管理员类型</th>\
				      <th >邮箱</th>\
				      <th >登录密码</th>\
				      <th >创建时间</th>\
				      <th >修改时间</th>\
				      <th >详细地址</th>\
				      <th >真实姓名</th>\
				      <th >身份证号</th>\
				      <th >学校编号</th>\
				      <th class='operation'>操作</th>\
				    </tr> \
				  </thead>";
					var $html="";
					layui.each(data, function(i, o){
					  		$html=i==0?'<option value="'+o.adminId+'" selected="true">'+o.realName+'</option>':'<option value="'+o.adminId+'">'+o.realName+'</option>';
					  	//console.log($html);
					  	$('#SearchBox').append($html);
					  }) 
					layui.form.render('select');
				 
				 
				 //加载数据调用分页
				  laypage.render({
				    elem: 'pagutui'
				    ,count: data.length
				    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
				    ,jump: function(obj){
				      //模拟渲染
				      document.getElementById('Guest').innerHTML = function(){
				        var arr = []
				        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
				         arr.push(table_heaeHtml);
				        layui.each(thisData, function(index, item){
				          arr.push('<tr>\
						      <td name="adminId">'+item.adminId.replace(/^(\w{6})\w{10}(.*)$/, '$1**********$2')+'<input type="hidden" name="id" value="'+item.adminId+'"/></td>\
						      <td name="adminName">'+item.adminName+'</td>\
						      <td name="adminPhone">'+item.adminPhone+'</td>\
						      <td name="lastLoginTime">'+item.lastLoginTime+'</td>\
						      <td name="lastLoginTime">'+item.lastLoginTime+'</td>\
						      <td name="status">'+item.statusName+'<input type="hidden" name="statusid" value="'+item.status+'"/></td>\
						      <td name="adminTypeId">'+item.AdminTypeName+'<input type="hidden" name="adminTypeId" value="'+item.adminTypeId+'"/></td>\
						      <td name="email">'+item.email+'</td>\
						      <td name="pwd">'+item.pwd.replace(/^(\w{0})\w{6}(.*)$/, '$1**********$2')+'</td>\
						      <td name="createTime">'+item.createTime+'</td>\
						      <td name="updateTime">'+item.updateTime+'</td>\
						      <td name="address">'+item.address+'</td>\
						      <td name="realName">'+item.realName.replace(/^(\S{0})\S{1}(.*)$/, '$1*$2')+'</td>\
						      <td name="cardNo">'+item.cardNo.replace(/^(\w{6})\w{10}(.*)$/, '$1**********$2')+'</td>\
						      <td name="schoolID">'+item.SchoolName+'<input type="hidden" name="schoolID" value="'+item.schoolID+'"/></td>\
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
			
			//-----[END][Layui专区]
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			})
			
			
			
			
		</script>
		
		
		
		
	</head>
	<body>
		
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>管理员管理</legend>
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
	 
		<!--[END]搜索框-->
		<!--表格数据展示-->
	   <table id="Guest" class="layui-table"></table>
		<!--[END]表格数据展示-->
		<!--分页-->
	   <div class="page"> 
	 	<div id="pagutui"></div>
       </div>   	
		<!--[END]分页-->
		
		
		<!--修改-->
			<div class="Upd">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				  <legend>修改管理员信息</legend>
				</fieldset>
		
		
		<!--表单填写部分-->
			<form class="layui-form" id="UpDAdmin"  >
			  <div class="layui-form-item">
				     <div class="layui-input-inline">
				     	<input type="hidden" name="id" id="id"/>
				    </div>
			  </div>
			  <div class="layui-form-item">
			  		<label class="layui-form-label">用户名:</label>
				     <div class="layui-input-inline">
				     	<input type="text" class="layui-input" readonly="readonly" id="cardNo" />
				    </div>
			  </div>
			 <div class="layui-form-item">
				    <label class="layui-form-label">管理员类型:</label>
				    <div class="layui-input-inline">
				      <select id="adminTypeID" name="adminTypeID" lay-verify="required" lay-filter="aihao">
				      </select>
			    	</div>
			    	 <div class="layui-form-mid layui-word-aux adminTypeIDPrompt">您还未选择新增的管理员类型哦~</div>
			  </div>
			  
			  
			  <div class="layui-form-item">
			   <label class="layui-form-label">管理员状态:</label>
				    <div class="layui-input-inline">
				      <select id="status" name="status" lay-verify="required" lay-filter="aihao">
				       
				      </select>
			    	</div>
		    	    <div class="layui-form-mid layui-word-aux statusPrompt">您还未选择新增的管理员类型哦~</div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">现住地址:</label>
			    	<div class="layui-input-block" >
				      <textarea id="address" name="address" maxlength="250" lay-verify="required" placeholder="湖南省长沙市……" class="layui-textarea"></textarea>
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
		
		
		
		
		<!--[END]修改-->
		
		
		
		
		
		
		
		
		
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
		<font color="red" style="font-size:50px;">您没有权限访问该页面!</font>
	</div>
</c:if>