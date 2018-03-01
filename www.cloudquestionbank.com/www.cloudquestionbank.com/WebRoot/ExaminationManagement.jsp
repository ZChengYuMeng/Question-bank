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
		<title>考试管理</title>
		<link rel="stylesheet" href="ST/layui/css/layui.css" media="all" />
		<script src="ST/layui/layui.js"></script>
		<link rel="stylesheet" href="css/TestQuestionsManagement.css" />
		<script src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<style>
			.Upd{max-width: 960px;margin: auto;}
			.Notice{border: 1px solid orangered;}
			#imgUrl{max-width: 190px;}
			.row{width:70px;}
		</style>
		<script>
			$(function(){
				$.ajaxSetup({async:false});//同步加载数据
				var data="";//数据显示
				data=Load("&admin.schoolId="+<%=session.getAttribute("schoolID")%>);
				//------[加载页面]
				function Load($data){
					var data="";
					$.post("<%=request.getContextPath()%>/Admin_GetItemAnalysisList",$data,success,"json");
					function success(result){
						console.log(result);
						data=result;
					}
					return data;
				}
				//------[END][加载页面]
				
  				 
				
				//------[LayUI]
				layui.use(['util', 'laydate', 'layer','carousel','code','element','flow','form','jquery','laydate','layedit','laypage','laytpl','mobile','table','tree','upload'], function(){
					  var laypage = layui.laypage
					  ,layer = layui.layer;
					  var $ = layui.jquery,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
					  	var laydate=layui.laydate;			
					  //时间选择器
					  laydate.render({
					     elem: '#startTime'
					    ,type: 'datetime'
					  }); 
					  
					    laydate.render({
					     elem: '#endTIme'
					    ,type: 'datetime'
					  	}); 				
					  				
					 
					  
					  var table_heaeHtml="<thead>\
					    <tr>\
					      <th >考试阶段</th>\
					      <th >课程范围</th>\
					      <th >总题数</th>\
					      <th >试卷名称</th>\
					      <th >试卷总数</th>\
					      <th >考试时间</th>\
					      <th >创建试卷人类型</th>\
					      <th >创建人</th>\
					      <th >创建时间</th>\
					      <th >开始时间</th>\
					      <th >结束时间</th>\
					      <th >考试学校</th>\
					      <th >考试班级</th>\
					      <th >操作</th>\
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
							      <td name="stageID">'+item.stageName+'</td>\
							      <td name="courseID">'+item.courseName+'</td>\
							      <td name="count">'+item.count+'</td>\
							      <td name="name">'+item.name+'</td>\
							      <td name="fraction">'+item.fraction+'<input type="hidden" name="id" value="'+item.id+'"/></td>\
							      <td name="minute">'+item.minute+'</td>\
							      <td name="createAuthorType">'+item.createAuthorType+'</td>\
							      <td name="createAuthorID">'+item.createAuthorID+'</td>\
							      <td name="creaTeime">'+item.creaTeime.substring(0,item.creaTeime.length-2)+'</td>\
							      <td name="startTime">'+item.startTime.substring(0,item.startTime.length-2)+'</td>\
							      <td name="endTIme">'+item.endTIme.substring(0,item.endTIme.length-2)+'</td>\
							      <td name="schoolID">'+item.schoolID+'</td>\
							      <td name="classID">'+item.classID+'</td>\
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
				
				//-----
			
			
			
				//隐藏 提示
				$(".startTimePrompt").hide();
				$(".endTImePrompt").hide();
				$(".Upd").hide();
				//监听提交事件
					$("#sub").click(function(){
						var $bool=false;var $idbool=false;
						var $startTimeBool=false;
						var $endTImeBool=false;
						$idbool=VerificationsTextBox($("#id"));//验证编号
						$startTimeBool=VerificationsTextBox($("#startTime"));//验证试卷开始时间
						$endTImeBool=VerificationsTextBox($("#endTIme"));    //验证试卷结束时间
						if($startTimeBool==true&&$endTImeBool==true&&$idbool==true){
						   	if(TimeDifference($("#startTime"),$("#endTIme"))){//验证开始时间大于结束时间
					   			//验证考试时间在5~60分钟之间
					   			if((GetDateDiff($("#startTime").val(),$("#endTIme").val(),"minute")<61)==true &&(GetDateDiff($("#startTime").val(),$("#endTIme").val(),"minute")>5)==true)
					   			{$bool=true;}else{FriendlyPrompt("考试时间必须在5~60分钟区域哦~!")}
						   	}
						 }
						if($bool){
							var $data="";
								$data+="&itemanalysis.id="+$("#id").val().trim();
								$data+="&itemanalysis.startTime="+$("#startTime").val().trim();
								$data+="&itemanalysis.endTime="+$("#endTIme").val().trim();
							console.log($data);
							//upd($data);
						}
						
					})
				
				
				/* $(".upd").live("click",function(){
					var $data="";
					//alert($(this).parent().parent().parent().html());
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//写入修改数据
						if($(this).children("[name=id]").attr("name")=="id"){
							TextBoxWrite($("#id"),$(this).children("[name=id]").val());
						}
						if($(this).attr("name")=="name"){
							TextBoxWrite($("#name"),$(this).html());
						}
						if($(this).attr("name")=="startTime"){
							TextBoxWrite($("#startTime"),$(this).html());
						}
						if($(this).attr("name")=="endTIme"){
							TextBoxWrite($("#endTIme"),$(this).html());
						}
					})
					$data=$data.substring(0,$data.length-1);
					$data="[ {"+$data+"} ]";
					$(".Upd").show();
				}) */
				
				//------[修改试卷]
				function upd($data){
					$.post("<%=request.getContextPath()%>/Admin_UpdItemAnalysisStartTimeAndEndTIme",$data,success,"json");
					function success(result){
						if(result){$(".Upd").hide();SX();}
						var $ts=result?"修改试卷成功!":"修改试卷失败……";
						FriendlyPrompt($ts);
					}				
				}
				//------[END][修改试卷]
				
				
				
				//-----[计算时间差]
				function GetDateDiff(startTime, endTime, diffType) {
				    //将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式 
				    var reg=/-/g;		
				    startTime = startTime.replace(reg, "/");
				    endTime = endTime.replace(reg, "/");
				    //将计算间隔类性字符转换为小写
				    diffType = diffType.toLowerCase();
				    var sTime =new Date(startTime); //开始时间
				    var eTime =new Date(endTime); //结束时间
				    //作为除数的数字
				    var timeType =1;
				    switch (diffType) {
				        case"second":
				            timeType =1000;
				        break;
				        case"minute":
				            timeType =1000*60;
				        break;
				        case"hour":
				            timeType =1000*3600;
				        break;
				        case"day":
				            timeType =1000*3600*24;
				        break;
				        default:
				        break;
				    }
				    return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(timeType));
				}
				//-----[END][计算时间差]
				
				
				
				
				
				
			})
			
		</script>
	</head>
	<body >
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>考试管理</legend>
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
		</div>
	 
	 <table id="subject" class="layui-table"></table>
     <div class="page"> 
     	<div id="pagutui"></div>
     </div>   
     
     
     <!--修改-->
     <div class="Upd">
     	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>考试修改</legend>
		</fieldset>
		
		<form class="layui-form" id="AddItemAnalysis" action="" >	
			<div class="layui-form-item">
			      <div class="layui-input-inline">
						<input class="layui-input" readonly="" type="hidden" id="id"  />
				  </div>	
			</div>
			
			<div class="layui-form-item">
				  <label class="layui-form-label">试卷名称:</label>
			      <div class="layui-input-inline">
						<input class="layui-input" readonly="" type="text" id="name"  />
				  </div>	
			</div>
			
	     	 <div class="layui-form-item">
			    <label class="layui-form-label">开始时间:</label>
			    <div class="layui-input-inline">
	        		<input type="text" class="layui-input" name="startTime" id="startTime" placeholder="yyyy-MM-dd HH:mm:ss">
			    </div>
			    
			    <div class="layui-form-mid layui-word-aux startTimePrompt">您得给个考试的开始时间啊！~</div>
			    
			     <label class="layui-form-label">结束时间:</label>
			    <div class="layui-input-inline">
			      <input type="text" class="layui-input" name="endTIme" id="endTIme" placeholder="yyyy-MM-dd HH:mm:ss">
			    </div>
			    <div class="layui-form-mid layui-word-aux endTImePrompt">什么时候交卷嘞？!</div>
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