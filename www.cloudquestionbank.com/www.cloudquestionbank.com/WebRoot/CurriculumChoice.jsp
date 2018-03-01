<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程选择</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="ST/layui/css/layui.css"  media="all">
	<script src="ST/layui/layui.js" charset="utf-8"></script>
	<link rel="stylesheet" href="ST/zms/css/CurriculumCoice.css"  media="all">
	<script type="text/javascript" src="./ST/yanglu/js/jquery-1.4.2.min.js"></script>
  </head>
  <script type="text/javascript">
  	$(function(){
  	var $courseName=$(".courseName").val();
  	var $stageId= $(".stageId").val();
  	var kc_two=[];
  	var kc_id=[];
    var $data="&course.courseName="+$courseName+"&course.stageId="+$stageId;	
    $.ajaxSetup({async:false});
  $.post("<%=request.getContextPath()%>/Guest_twolevelfind",$data,success,"json");
  			function success(result){
  				var obj = eval(result);
    			$.each(obj.twolevel,function(i,o){
    				kc_two[kc_two.length]=o[1];
    				kc_id[kc_id.length]=o[0];
    			});
    			
  			}  			
  			
  			 $("body").append("<p style=' background: -webkit-linear-gradient(left, #FFFAF0 , black);background: -o-linear-gradient(right,  #FFFAF0 , black);background: -moz-linear-gradient(right,  #FFFAF0 , black);background: linear-gradient(to right, #FFFAF0 , black);wdith:100%;height:100px;color:#ffffff;font-size:25px;text-align:center;line-height:100px;text-shadow: 5px 5px 5px #FF0000;'>"+$courseName+"</p>");
   for (var j = 0; j < kc_two.length; j++) {
		  	 $("body").append("<div class='layui-collapse' lay-filter='test'>\
			  <div class='layui-colla-item'>\
			    <h2 class='layui-colla-title'><p class='kc_name'>"+kc_two[j]+"</p><input type='hidden' value='"+kc_id[j]+"'></h2>\
			    <div class='layui-colla-content'>\
			    </div>\
			  </div>\
		    			</div>");
		    	//post		
		    			
    		}	
    	$(".kc_name").live("click",function(){
    	var cid=$(this).next().val();
    	var cname=$(this).html();
    	var kc_two1=[];
    	var kc_id1=[];
    	var kc_bf=[];
    	
  		    var $data="&course.courseName="+cname+"&course.stageId="+$stageId;	
  $.post("<%=request.getContextPath()%>/Guest_sanlevalfind",$data,success,"json");
  			function success(result){
  				var obj = eval(result);
    			$.each(obj.twolevel,function(i,o){
    				kc_two1[kc_two1.length]=o[1];
    				kc_id1[kc_id1.length]=o[0];
    			});
    			for (var j = 0; j < obj.list.length; j++) {
					kc_bf[kc_bf.length]=obj.list[j];
					}
    			} 
    			$(".course").remove();
    			for (var a = 0; a < kc_id1.length; a++) {
				$("<!--子课程-->\
	    	<div class='course'>\
		    		<font class='course_name'>"+kc_two1[a]+"</font>\
		    	<font class='Percentage'>"+kc_bf[a]+"%</font><input type='hidden' value='"+kc_id1[a]+"'><div class='course_option_Btn layui-bg-blue'>进入测试</div>\
		      	<div id='jd' class='layui-progress layui-progress-big ' lay-filter='demo"+a+"' lay-showPercent='true'>\
				  <div id='jindu' class='layui-progress-bar layui-bg-red' lay-percent='40%'></div>\
				</div>\
		    </div>\
		    <!--[END]子课程-->").appendTo(".layui-colla-content");
				}
				var prss=[];
				for (var q = 0; q < kc_bf.length; q++) {
					prss[prss.length]=kc_bf[q]+"%";
				}
				layui.use(['element', 'layer'], function(){
				  var element = layui.element;
				  var layer = layui.layer;
				  for (var i = 0; i < prss.length; i++) {
					 element.progress('demo'+i+'', prss[i]);
				}
				 
				});
    	});
    	
    	 $(".course_option_Btn").live("click",function(){
    		var cname1=$(this).prev().prev().prev().html();
    		var cid = $(this).prev().val();
    	// 	alert(cid);
    		$.post("<%=request.getContextPath()%>/Subject_find_subject?subject.aourseId="+cid,
    		function(date){
    		var obj = eval(date);
    		//alert(obj["kCount"])
    		if(obj["kCount"]==0){
    		alert("此课程暂无题目！！！");
    		}else{
    		parent.window.document.location.href="Subject_find_topic?course.courseName="+cname1+"&course.stageId="+$stageId+"&guest.guestId="+<%=session.getAttribute("uid")%>;
    		 	}
    		}
    		) 
    		//alert(window.parent);
    		//控制父窗口的跳转
    		//
    		//window.location.href='Examination.jsp';
    	});
    
  	});
  </script>
 <body  oncontextmenu="event.returnValue=false" onselectstart="event.returnValue=false">
  <%   
    String courseName = request.getParameter("course.courseName"); 
    String stageId= request.getParameter("course.stageId");
    //HelloService helloService = SpringManager.getApplicationContext().getBean(HelloService.class);  
%>  
  <input type="hidden" value="<%=courseName%>" class="courseName">
  <input type="hidden" value="<%=stageId%>" class="stageId">
<script>
layui.use(['element', 'layer'], function(){
  var element = layui.element;
  var layer = layui.layer;
  
  //监听折叠
  element.on('collapse(test)', function(data){
	//这里是课程展开时间监听
	element.progress('test', '50%');
  });
});
</script>	
		
		
</body>
</html>
