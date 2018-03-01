<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${admin.uID!=null && admin.role.roleGrade<=2 }">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset="UTF-8">
		<title>试题管理</title>
		<link rel="stylesheet" href="static/layui/css/layui.css" media="all" />
		<script src="static/layui/layui.js"></script>
		<link rel="stylesheet" href="css/TestQuestionsManagement.css" />
		<script src="static/js/jquery-1.4.2.min.js"></script>
		<script src="static/js/Currency.js"></script>
		<script>
			$(function(){
				//隐藏提示
				$(".phonePrompt").hide();
				$(".userRolePrompt").hide();
				$(".depIdPrompt").hide();
				$(".correctionDatePrompt").hide();
				$(".departurePrompt").hide();
				$(".educationPrompt").hide();
				$(".politicalOutlookPrompt").hide();
				$(".userStatusPrompt").hide();
				$(".Upd").hide();
				
				$(".upd").live("click",function(){
					var $data="";
					//alert($(this).parent().parent().parent().html());
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//写入编号 手机号码、学历、政治面貌、转正时间、入职时间
						if($(this).attr("name")=="uID"){
							TextBoxWrite($("#uID"),$(this).html());
						}
						if($(this).attr("name")=="phone"){
							TextBoxWrite($("#phone"),$(this).html());
						}
						if($(this).attr("name")=="education"){
							TextBoxWrite($("#education"),$(this).html());
						}
						if($(this).attr("name")=="politicalOutlook"){
							TextBoxWrite($("#politicalOutlook"),$(this).html());
						}
						if($(this).attr("name")=="correctionDate"){
							TextBoxWrite($("#correctionDate"),$(this).html());
						}
						if($(this).attr("name")=="joinDate"){
							TextBoxWrite($("#joinDate"),$(this).html());
						}
						//选中 部门、角色、用户状态
						if($(this).children("[name=userRole]").attr("name")=="userRole"){
							SelectedDrop_DownBox($("#userRole"),$(this).children("[name=userRole]").val());
						}
						if($(this).children("[name=depId]").attr("name")=="depId"){
							SelectedDrop_DownBox($("#depId"),$(this).children("[name=depId]").val());
						}
						if($(this).children("[name=userStatus]").attr("name")=="userStatus"){
							SelectedDrop_DownBox($("#userStatus"),$(this).children("[name=userStatus]").val());
						}
						//选中是否离职
						if($(this).attr("name")=="departureDate"){
							var $sel=$(this).html().trim()==""?2:1;
							RadioBtnSelected($("#departure"),$sel);
						}
					})
					$data=$data.substring(0,$data.length-1);
					$data="[ {"+$data+"} ]";
					//console.log($data);
					//alert($data);
					$(".Upd").show();
				})
				
				
				//监听提交
				$("#sub").click(function(){
					//验证开始       
					var $bool=false;var $uIDBool=false ;var $departureDateBool=false;var $phoneBool=false;
					var $depIdBool=false;var $userRoleBool=false;var $educationBool=false;
					var $politicalOutlookBool=false;var $userStatusBool=false;var $correctionDateBool=false;
					$phoneBool=VerificationPhon($("#phone"));		  								       //验证手机号	
					$uIDBool=VerificationsTextBox($("#uID"),"您修改的用户信息有点问题哦！");    			       //编号
					$departureDateBool=VerificationsRadioBtn($("#departure"),"是否离职状态有点错误哦！");        //是否离职
					$depIdBool=VerificationsChoolIdOrclassId($("#depId"),"部门信息选中有点问题哦~");			   //部门
					$userRoleBool=VerificationsTextBox($("#userRole"),"哎呀~用户角色信息有点问题哦~重选一下试试！");  //角色
					$educationBool=VerificationsTextBox($("#education"),"更新的学历信息不能为空!");			   //学历
					$politicalOutlookBool=VerificationsTextBox($("#politicalOutlook"),"更新的政治面貌不能为空!");//政治面貌
					$userStatusBool=VerificationsChoolIdOrclassId($("#userStatus"),"用户状态数据错误！");	   //用户状态
					if($("#correctionDate").val().trim()==""){//如果转正时间为空，不做验证获取信息
						$correctionDateBool=true;
					}else{
						$correctionDateBool=$("#joinDate").val().trim()>$("#correctionDate").val().trim()?false:true;//如果入职时间在转正时间后验证不通过
					}
					if($uIDBool==true&&$departureDateBool==true&&$phoneBool==true&&$depIdBool==true&&$userRoleBool==true&&$educationBool==true
					  &&$politicalOutlookBool==true&&$userStatusBool==true&&$correctionDateBool==true){
					  	$bool=true;
					 }
					if($bool){
						var $data="";
						$data+="&uID="+$("#uID").val().trim();
						$data+="&departureDateBool="+($("#departure").val().trim()==1);
						$data+="&phone="+$("#phone").val().trim();
						$data+="&depId="+$("#depId").val().trim();
						$data+="&userRole="+$("#userRole").val().trim();
						$data+="&education="+$("#education").val().trim();
						$data+="&politicalOutlook="+$("#politicalOutlook").val().trim();
						$data+="&userStatus="+$("#userStatus").val().trim();
						$data+=$("#correctionDate").val().trim()!=""?"&correctionDate="+$("#correctionDate").val().trim():"";//如果填写了转正时间则赋值该属性
						console.log($data);
						//alert($data);
						$(".Upd").hide();
					}
					
				})
				
				
				
				
				
				
				
				
				
			})
			
		</script>
	</head>
	<body >
		
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>用户信息管理</legend>
		</fieldset>
		<!--搜索框-->
		
		<div class="layui-row search">
			<div class="search_text">
				<div class="layui-form component">
			      <select  id="SearchBox" lay-search="" lay-filter="component"  >
			      	<option value="0">综合部</option>
			      	<option value="1">教质部</option>
			      	<option value="2">质询部</option>
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
	 <table id="subject" class="layui-table"></table>
     <div class="page"> 
     	<div id="pagutui"></div>
     </div>   
     
     
     <div class="Upd">
     	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>用户信息更新</legend>
		</fieldset>
		<form class="layui-form" id="Upd" action="">
			
		 <div class="layui-form-item">
		    	<div class="layui-input-block" >
		    		<input type="hidden" name="uID" id="uID" />	
			    </div>
		  </div>	
		  <div class="layui-form-item">
		    	<div class="layui-input-block" >
		    		<input type="hidden" name="joinDate" id="joinDate" />	
			    </div>
		  </div>	
		  <div class="layui-form-item">
		       <label class="layui-form-label">手机号码:</label>
		      	<div class="layui-input-inline">
		        	<input maxlength="11" id="phone" type="tel" name="phone" lay-verify="required" autocomplete="off" class="layui-input">
		     	</div>
	     	    <div class="layui-form-mid layui-word-aux phonePrompt">手机号有误!</div>
	 	 </div>
		   <div class="layui-form-item">
			    <label class="layui-form-label">部门:</label>
			    <div class="layui-input-inline">
			      <select id="depId" name="depId" lay-verify="required" lay-filter="aihao">
			      	<option value="" selected=""></option>
			        <option value="1" >综合部</option>
			        <option value="2" >教质部</option>
			        <option value="3" >教质部</option>
			      </select>
			    </div>
			    <div class="layui-form-mid layui-word-aux depIdPrompt">您的学校编号好像有点问题哦~</div>
			    <label class="layui-form-label">角色:</label>
			    <div class="layui-input-inline">
			      <select id="userRole" name="userRole" lay-verify="required" lay-filter="aihao">
			        <option value="1" >管理员</option>
			        <option value="2" >校长</option>
			        <option value="3" >主管</option>
			        <option value="4" >经理</option>
			      </select>
			    </div>
				<div class="layui-form-mid layui-word-aux userRolePrompt">您还未选择用户角色哦~</div>
	      </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">学历:</label>
	    	<div class="layui-input-inline" >
		       <input type="text" id="education" maxlength="10" name="education" lay-verify="title" autocomplete="off" placeholder="如：本科" class="layui-input">
		    </div>
		     <div class="layui-form-mid layui-word-aux educationPrompt">学历不能为空！</div>
		  </div>
		  <div class="layui-form-item">
			    <label class="layui-form-label">政治面貌:</label>
		    	<div class="layui-input-inline" >
			       <input type="text" id="politicalOutlook" maxlength="25" name="politicalOutlook" lay-verify="title" autocomplete="off" placeholder="如：共青团员" class="layui-input">
			    </div>
			    <div class="layui-form-mid layui-word-aux politicalOutlookPrompt">政治面貌不能为空！</div>
		  </div> 
		   <div class="layui-form-item">
			    <label class="layui-form-label">用户状态:</label>
		    	<div class="layui-input-inline">
			      <select id="userStatus" name="userStatus" lay-verify="required" lay-filter="aihao">
			        <option value="1" >正常</option>
			        <option value="2" >离职</option>
			        <option value="3" >普通管理员</option>
			      </select>
			    </div>
				<div class="layui-form-mid layui-word-aux userStatusPrompt">用户状态有点问题哦~</div>
		  </div> 
		   <div class="layui-form-item">
		 	    <label class="layui-form-label">转正时间:</label>
			    <div class="layui-input-inline">
			      <input type="text" class="layui-input" name="expirationDate" id="correctionDate"   placeholder="yyyy-MM-dd HH:mm:ss">
			    </div>
			    <div class="layui-form-mid layui-word-aux correctionDatePrompt">用户什么时候转正!</div>
		   </div>
		   
		   <div class="layui-form-item">	
				<label class="layui-form-label">是否离职:</label>
				 <div class="layui-input-block">
				       <input type="radio" id="departure" name="departure" value="1" title="是" >
                       <input type="radio" id="departure" name="departure" value="2" title="否" checked="" >
			       </div>
			       <div class="layui-input-block">
			       	<div class="layui-form-mid layui-word-aux departurePrompt">是否离职状态好像有点问题</div>
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
     
     
     
     
     
     
     
     
     
     
     
     
<script>
layui.use(['util', 'laydate', 'layer','carousel','code','element','flow','form','jquery','laydate','layedit','laypage','laytpl','mobile','table','tree','upload'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  var $ = layui.jquery,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
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
			  
			   laydate.render({
			     elem: '#correctionDate'
			    ,type: 'datetime'
			  	}); 
	  	
  				
  				
  				
  				
  				
  //测试数据
  var data = [
    {
            "id": 10000,
            "username": "user-0",
            "sex": 0,
            "city": 1,
            "sign": "签名-0",
            "experience": 499,
            "logins": 138,
            "wealth": 62007298,
            "classify": 0,
            "score": "11.47"
        },
        {
            "id": 10001,
            "username": "user-1",
            "sex": 1,
            "city": 2,
            "sign": "签名-1",
            "experience": 960,
            "logins": 24,
            "wealth": 71513669,
            "classify": 1,
            "score": "28.34"
        },
        {
            "id": 10002,
            "username": "user-2",
            "sex": 0,
            "city": 0,
            "sign": "签名-2",
            "experience": 911,
            "logins": 49,
            "wealth": 12867792,
            "classify": 2,
            "score": "25.85"
        },
        {
            "id": 10003,
            "username": "user-3",
            "sex": 1,
            "city": 2,
            "sign": "签名-3",
            "experience": 112,
            "logins": 32,
            "wealth": 6736741,
            "classify": 2,
            "score": "95.36"
        },
        {
            "id": 10004,
            "username": "user-4",
            "sex": 0,
            "city": 3,
            "sign": "签名-4",
            "experience": 695,
            "logins": 159,
            "wealth": 70617394,
            "classify": 4,
            "score": "42.48"
        },
        {
            "id": 10005,
            "username": "user-5",
            "sex": 0,
            "city": 3,
            "sign": "签名-5",
            "experience": 407,
            "logins": 88,
            "wealth": 98900963,
            "classify": 0,
            "score": "77.31"
        },
        {
            "id": 10006,
            "username": "user-6",
            "sex": 1,
            "city": 1,
            "sign": "签名-6",
            "experience": 230,
            "logins": 73,
            "wealth": 4063839,
            "classify": 4,
            "score": "72.66"
        },
        {
            "id": 10007,
            "username": "user-7",
            "sex": 0,
            "city": 2,
            "sign": "签名-7",
            "experience": 1042,
            "logins": 198,
            "wealth": 9805772,
            "classify": 0,
            "score": "2.88"
        },
        {
            "id": 10008,
            "username": "user-8",
            "sex": 0,
            "city": 1,
            "sign": "签名-8",
            "experience": 942,
            "logins": 147,
            "wealth": 96230862,
            "classify": 2,
            "score": "79.54"
        },
        {
            "id": 10009,
            "username": "user-9",
            "sex": 1,
            "city": 0,
            "sign": "签名-9",
            "experience": 1014,
            "logins": 104,
            "wealth": 55726955,
            "classify": 4,
            "score": "64.30"
        },
        {
            "id": 10010,
            "username": "user-10",
            "sex": 0,
            "city": 2,
            "sign": "签名-10",
            "experience": 700,
            "logins": 66,
            "wealth": 93316089,
            "classify": 4,
            "score": "94.40"
        },
        {
            "id": 10011,
            "username": "user-11",
            "sex": 1,
            "city": 3,
            "sign": "签名-11",
            "experience": 1014,
            "logins": 15,
            "wealth": 74173151,
            "classify": 4,
            "score": "12.68"
        },
        {
            "id": 10012,
            "username": "user-12",
            "sex": 0,
            "city": 1,
            "sign": "签名-12",
            "experience": 332,
            "logins": 48,
            "wealth": 14365229,
            "classify": 0,
            "score": "86.82"
        },
        {
            "id": 10013,
            "username": "user-13",
            "sex": 1,
            "city": 2,
            "sign": "签名-13",
            "experience": 405,
            "logins": 120,
            "wealth": 34695563,
            "classify": 0,
            "score": "33.42"
        }
  ];
  
  var table_heaeHtml="<thead>\
    <tr>\
      <th >编号</th>\
      <th >用户名</th>\
      <th >密码</th>\
      <th >性别</th>\
      <th >电话</th>\
      <th >身份证</th>\
      <th >角色</th>\
      <th >部门</th>\
      <th >入职时间</th>\
      <th >转正时间</th>\
      <th >离职时间</th>\
      <th >学历</th>\
      <th >籍贯</th>\
      <th >政治面貌</th>\
      <th >积分</th>\
      <th >创建人</th>\
      <th >创建日期</th>\
      <th >最后一次操作人</th>\
      <th >最后一次操作时间</th>\
      <th >真实姓名</th>\
      <th>用户状态</th>\
      <th>最近一次登录</th>\
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
         arr.push("<tabody>");
        layui.each(thisData, function(index, item){
          arr.push('<tr>\
		     <td name="uID">'+item.id+'</td>\
		      <td name="userName">'+item.username+'</td>\
		      <td name="userpwd">*******</td>\
		      <td name="sex">男</td>\
		      <td name="phone">18894775870</td>\
		      <td name="cardID">431222********2013</td>\
		      <td name="userRole">部门经理<input type="hidden" name="userRole" value="2"/></td>\
		      <td name="depId">教质部<input type="hidden" name="depId" value="2"/></td>\
		      <td name="joinDate">2016-11-28 12:12:12</td>\
		      <td name="correctionDate">2016-12-28 12:12:12</td>\
		      <td name="departureDate">2016-12-28 12:12:12</td>\
		      <td name="education">本科</td>\
		      <td name="placeOrigin">湖南省长沙市岳麓区高新区6906北斗大厦</td>\
		      <td name="politicalOutlook">党员</td>\
		      <td name="userPicPath">20</td>\
		      <td name="creditNumber">黄校</td>\
		      <td name="createdBy">2016-11-28 12:12:12</td>\
		      <td name="modifyBy">黄校</td>\
		       <td name="modifyDate">2016-11-28 12:12:12</td>\
		      <td name="realName">何剩夫</td>\
		      <td name="userStatus">正常<input type="hidden" name="userStatus" value="2"/></td>\
		       <td name="lastLoginTime">2018-1-20 12:12:12</td>\
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
</script>



	</body>
</html>
</c:if>