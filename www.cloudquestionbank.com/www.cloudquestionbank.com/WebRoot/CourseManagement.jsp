<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
		<title>课程管理</title>
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
				//隐藏提示
				$(".course_namePrompt").hide();
				$(".attribute_IDPrompt").hide();
				$(".stageIDPrompt").hide();
				$(".Upd").hide();
				//表单提交事件				
				$("#sub").click(function(){
					var $bool=false;var $course_nameBool=false;var $attribute_IDBool=false;
					var $stageIDBool=false;var $idBool=false;
					$idBool=VerificationsTextBox($("#id"),"不能为空！");
					$course_nameBool=VerificationsTextBox($("#course_name"),"给新课程取个名吧！");
					$attribute_IDBool=VerificationsChoolIdOrclassId($("#attribute_ID"),"您还未选择课程的所属分类呢！");
					$stageIDBool=VerificationsChoolIdOrclassId($("#stageID"),"请选择课程所属阶段！");
					if($course_nameBool==true&&$attribute_IDBool==true&&$stageIDBool==true){
						$bool=true;
					}
					if($bool){
						var $data="";
						    $data+="&id="+$("#id").val().trim();
						    $data+="&course_name="+$("#course_name").val().trim();
						    $data+="&attribute_ID="+$("#attribute_ID").val().trim();
						    $data+="&stageID="+$("#stageID").val().trim();
						    console.log($data);
						$(".Upd").hide();
					}
					
				})
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				$(".upd").live("click",function(){
					var $data="";
					//alert($(this).parent().parent().parent().html());
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//写入数据
						if($(this).attr("name")=="course_name"){
							TextBoxWrite($("#course_name"),$(this).html());
						}
						if($(this).attr("name")=="attribute_ID"){
							SelectedDrop_DownBox($("#attribute_ID"),$(this).html());
						}
						if($(this).attr("name")=="stageID"){
							SelectedDrop_DownBox($("#stageID"),$(this).html());
						}
						if($(this).attr("name")=="id"){
							TextBoxWrite($("#id"),$(this).html());
						}
					})
					$data=$data.substring(0,$data.length-1);
					$data="[ {"+$data+"} ]";
					console.log($data);
					$(".Upd").show();
				})
			})
			
		</script>
	</head>
	<body >
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>课程管理</legend>
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
     <!--修改-->
     <div class="Upd">
     	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>修改课程</legend>
		</fieldset>
		<!--表单填写部分-->
		<form class="layui-form" id="Addcourse" action="" >
			<div class="layui-form-item">
			    <div class="layui-input-inline">
			    	<input type="hidden" name="id" id="id" />
		    	</div>
			</div>
			<div class="layui-form-item">
				  <label class="layui-form-label">所属课程</label>
			    <div class="layui-input-inline">
			      <select id="attribute_ID" name="stageID" lay-verify="required" lay-filter="aihao">
			      	<option value="0" selected="">一级分类</option>
			        <option value="1" >msql</option>
			        <option value="2" >Java</option>
			        <option value="3" >C#</option>
			      </select>
		   	 	</div>
	   	 	  <div class="layui-form-mid layui-word-aux stageIDPrompt"></div>
				
			    <label class="layui-form-label">所属阶段:</label>
			    <div class="layui-input-inline">
			      <select id="stageID" name="stageID" lay-verify="required" lay-filter="aihao">
			        <option value="1" >Accp7.0S1</option>
			        <option value="2" >Accp7.0S2</option>
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
      <th >课程名</th>\
      <th >所属课程</th>\
      <th >所属阶段</th>\
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
		     <td name="id">'+item.id+'</td>\
		      <td name="course_name">'+item.username+'</td>\
		      <td name="attribute_ID">0</td>\
		      <td name="stageID">1</td>\
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
