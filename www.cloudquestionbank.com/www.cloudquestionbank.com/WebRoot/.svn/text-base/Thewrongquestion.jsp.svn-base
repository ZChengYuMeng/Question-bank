<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Thewrongquestion.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
html, body{
   padding:0px;
   margin:0px;
   font-family: 'Raleway', sans-serif;
   color:#FFF;
   height:100%;
}
body{
   background:rgba(0, 0, 0, 0.5); 
}

.container{
   position:fixed;
   max-width:200px;
   background:rgba(0, 0, 0, 0.75);
   margin:0px 10px;
   padding:10px 0px 20px 0px;
   border:1px solid #111;
   border-radius:4px;
   box-shadow:0px 4px 5px rgba(0, 0, 0, 0.75);
}
.link{
   font-size:16px;
   font-weight:300;
   text-align:center;
   position:relative;
   height:40px;
   line-height:40px;
   margin-top:10px;
   overflow:hidden;
   width:90%;
   margin-left:5%;
   cursor:pointer;
}
.link:after{
   content: '';
   position:absolute;
   width:80%;
   border-bottom:1px solid rgba(255, 255, 255, 0.5);
   bottom:50%;
   left:-100%;
   transition-delay: all 0.5s;
   transition: all 0.5s;
}
.link:hover:after,
.link.hover:after{
   left:100%;
}
.link .text{
   text-shadow:0px -40px 0px rgba(255, 255, 255, 1);
   transition:all 0.75s;
   transform:translateY(100%) translateZ(0);
   transition-delay:all 0.25s;
}
.link:hover .text,
.link.hover .text{
   text-shadow:0px -40px 0px rgba(255, 255, 255, 0);
   transform:translateY(0%) translateZ(0) scale(1.1);
   font-weight:600;
}

</style>
<script type="text/javascript" src="ST/yanglu/js/jquery-1.4.2.min.js"></script>

  </head>
  <script type="text/javascript">
  $(document).ready(function(){
	var $cname = $(".cname").val();
	var $sid = $(".sid").val();
	var $gid = $(".gid").val();
	$.post("<%=request.getContextPath()%>/Subject_Checkerror?course.courseName="+$cname+"&course.stageId="+$sid+"&guest.guestId="+$gid+"",
			function(data){
			var obj = eval(data);
			//alert(obj)
			$.each(obj.errorList,function(i,o){
				$(".stem").append('<div style="width:100%;height: 500px;">'+
			    		'<!--[提干]-->'+
			    		'<div style="width:100%;height: 100px;background-color: #ccc">'+
			    		'	<div style="width: 0px; height: 100px;border-top: 100px solid red;border-right: 100px solid transparent;text-align: center;"><h2 style="margin-left:20px;margin-top:-80px">'+(i+1)+'</h2></div>'+
			    		'	<div style="width:90%;height: 100px;float:left; margin-left:110px;margin-top:-200px; line-height: 100px;color: black;font-size: 20px">'+o[1]+'</div>'+
			    	'	</div>'+
			    		'<!--[结束]-->'+
			    		'<!--[选项卡]-->'+
			    		'<div style="width:100%;height: 400px;font-size:18px;line-height: 80px;color: black;">'+
			    			'<div style="width:98.2%;height: 79px;background-color:#E0E0E0;padding-left: 20px;border-bottom:1px solid #ccc;"> <font style="color:green;">'+o[2]+'</font></div>'+
			    			'<div style="width:98.2%;height: 79px;background-color: #E0E0E0;padding-left: 20px;border-bottom:1px solid #ccc;"><font style="color:#0099FF;">'+o[3]+'</font></div>'+
			    			'<div style="width:98.2%;height: 79px;background-color: #E0E0E0;padding-left: 20px;border-bottom:1px solid #ccc;"><font style="color:#0099FF;">'+o[4]+'</font></div>'+
			    			'<div style="width:98.2%;height: 79px;background-color: #E0E0E0;padding-left: 20px;border-bottom:1px solid #ccc;"><font style="color:#0099FF;">'+o[5]+'</font></div>'+
			    			'<div style="width:95.5%;height: 79px;background-color: #E0E0E0;padding-left: 50px;">'+
			    			'正确答案是'+o[6]+'， 最近回答的是'+o[7]+''+
			    				'<a target="itemanalysisjsp" class="itemanalysis" style=" float: right;margin-right: 10px">试题分析</a><a href="" style="float: right;margin-right: 10px">删除此题</a>'+
			    				'</div>'+
			    		'</div>'+
			    		'<!--[结束]-->'+
			    		'</div>');
				
			})
	
	})
	$(".itemanalysis").live("click",function(){
		alert(0)
	});
})
</script>
  <body>

  <input type="hidden" value="<%=request.getParameter("cname")%>" class="cname">
  <input type="hidden" value="<%=request.getParameter("sid")%>" class="sid">
  <input type="hidden" value="<%=request.getParameter("gid")%>" class="gid">
  <div class="container">
  <div class="link">
    <div class="text">题库首页</div>
  </div>
  <div class="link">
    <div class="text">关于我们</div>
  </div>
  <div class="link">
    <div class="text">产品中心</div>
  </div>
  <div class="link">
    <div class="text">项目案例</div>
  </div>
  <div class="link">
    <div class="text">人才招聘</div>
  </div>
  <div class="link">
    <div class="text">联系我们</div>
  </div>
</div>
 	
    <div class="stem" style="width:80%;height:100%;margin-left: 230px;position:absolute;top:0px;background-color: white;">
    		
    		
    </div>
 <div class="GalMenu GalDropDown">
	  <div class="circle" id="gal">
		<div class="ring">
		  <a href="index.jsp" title="" class="menuItem">首页</a>
		  <a href="#" title="" class="menuItem">博客</a>
		  <a href="#" title="" class="menuItem">项目</a>
		  <a href="#" title="" class="menuItem">综合</a>
		  <a href="#" title="" class="menuItem">杂项</a>
		  <a href="#" title="" class="menuItem">留言</a></div>
		<audio id="audio" src="ST/yanglu/other/audio/niconiconi.mp3"></audio>
	  </div>
</div>
<div id="overlay" style="opacity: 1; cursor: pointer;"></div>
<script type="text/javascript">
var items = document.querySelectorAll('.menuItem');
  for (var i = 0,
  l = items.length; i < l; i++) {
	items[i].style.left = (50 - 35 * Math.cos( - 0.5 * Math.PI - 2 * (1 / l) * i * Math.PI)).toFixed(4) + "%";
	items[i].style.top = (50 + 35 * Math.sin( - 0.5 * Math.PI - 2 * (1 / l) * i * Math.PI)).toFixed(4) + "%"
  }</script>
 <script src="ST/yanglu/other/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="ST/yanglu/other/css/GalMenu.css" />
<script type="text/javascript" src="ST/yanglu/other/js/GalMenu.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	$('body').GalMenu({
	  'menu': 'GalDropDown'
	})
  });
</script>
 
  </body>
  <script>
//For Demo only
var links = document.getElementsByClassName('link')
for(var i = 0; i <= links.length; i++)
   addClass(i)


function addClass(id){
   setTimeout(function(){
      if(id > 0) links[id-1].classList.remove('hover')
      links[id].classList.add('hover')
   }, id*750) 
}
</script>
</html>
