<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${adminid!=null && adminTypeID<2}">
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta charset="UTF-8">
		<title>课程阶段管理</title>
		
		
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<link rel="stylesheet" href="ST/zf/css/UserManagement.css" />
		<style>
			.Upd{max-width: 960px;margin: auto;}
			.Notice{border: 1px solid orangered;}
			#ADDStage{text-align: center;padding-top: 10px;color: deepskyblue;}
			#ADDStage:hover{color:orangered;cursor:pointer;}
		</style>
		<script>
			$(function(){
				//隐藏元素
				$(".Upd").hide();
				$(".stage_namePrompt").hide();
				var IsUpdOrAdd="ADD";
				$(".upd").live("click",function(){
					$("#Title").html("修改课程阶段");
					IsUpdOrAdd="UPD"
					$(".sub").attr("id","UPD");
					var $data="";
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//写入阶段名、ID
						if($(this).attr("name")=="stage_name"){
							TextBoxWrite($("#stage_name"),$(this).html());
						}
						if($(this).attr("name")=="id"){
							TextBoxWrite($("#id"),$(this).html());
						}
					})
					$data=$data.substring(0,$data.length-1);
					$data="[ {"+$data+"} ]";
					$(".Upd").show();
				})
				//点击去添加时
				$("#ADDStage").click(function(){
					$("#Title").html("添加课程阶段");
					IsUpdOrAdd="ADD"
					$(".sub").attr("id","ADD");
					$(".Upd").show();
				})
				
				
				//监听修改提交
				$("#UPD").live("click",function(){
					var $bool=false;var $idBool=false;var $stage_nameBool=false;
					$idBool=$("#id").val().trim()>0?true:false;
					$stage_nameBool=VerificationsTextBox($("#stage_name"),"阶段名称不能为空哦！");
					if($idBool==true&&$stage_nameBool==true){
						$bool=true;
					}
					//console.log($idBool+"、"+$stage_nameBool);
					if($bool){
						var $data=""
							$data+="&id="+$("#id").val().trim();
							$data+="&stage_name="+$("#stage_name").val().trim();
							console.log($data);
							if(IsUpdOrAdd=="UPD"){
								alert("upd");
								$(".Upd").hide();
							}
					}
					
				})
				//监听添加提交
				$("#ADD").live("click",function(){
					var $bool=false;var $idBool=false;var $stage_nameBool=false;
					$stage_nameBool=VerificationsTextBox($("#stage_name"),"阶段名称不能为空哦！");
					if($stage_nameBool==true){
						$bool=true;
					}
					console.log("、"+$stage_nameBool);
					if($bool){
						var $data=""
							$data+="&stage_name="+$("#stage_name").val().trim();
							console.log($data);
							if(IsUpdOrAdd=="ADD"){
								alert("ADD");
							}
					}
					
				})
				
				
				
				//-----[修改]
				function Upd($data){
					$.post("URl",$data,success,"json");
					function success(result){
						
					}
				}
				//-----[END][修改]
				//-----[添加]
				function ADD($data){
					$.post("URl",$data,success,"json");
					function success(result){
						
					}
				}
				//-----[END][添加]
				
			})
			
			
		</script>
		
		
		
		
	</head>
	<body>
		
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>课程阶段管理</legend>
		</fieldset>
		<!--搜索框-->
			<div class="layui-row search">
				<div class="search_text">
					<div class="layui-form component">
				      <select  id="SearchBox" lay-search="" lay-filter="component"  >
				      	<option value="">1</option>
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
				<div id="ADDStage" >添加阶段</div>
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
		
		
		
		
		<div class="Upd" >
			
			<form class="layui-form" id="Upd" action="" >
			
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend id="Title">修改课程阶段管理</legend>
			</fieldset>
			<div class="layui-form-item">
			   <div class="layui-input-block" >
			   		<input type="hidden" name="id" id="id" />
			   	</div>
			</div>
			<div class="layui-form-item">
				 <label class="layui-form-label">阶段名称:</label>
			    	<div class="layui-input-block" >
				       <input type="text" id="stage_name" maxlength="50" name="stage_name" lay-verify="title" autocomplete="off" placeholder="课程阶段名称" class="layui-input">
				    </div>
				    <div class="layui-input-block" >
				      <div class="layui-form-mid layui-word-aux stage_namePrompt">请输入课程名！</div>
				    </div>
	 		 </div>
			<div class="layui-form-item">
			    <div class="layui-input-block">
			      <button type="button" style="width: 100px;" class="layui-btn sub" id="ADD">立即提交</button>
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
      <th >阶段名</th>\
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
      document.getElementById('Guest').innerHTML = function(){
        var arr = []
        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
         arr.push(table_heaeHtml);
         arr.push("<tabody>");
        layui.each(thisData, function(index, item){
          arr.push('<tr>\
		     <td name="id">'+item.id+'</td>\
		      <td name="stage_name">'+item.username+'</td>\
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
