<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学校排行</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="ST/layui/css/layui.css"  media="all">
	<script src="ST/layui/layui.js" charset="utf-8"></script>
<style>
			
			/*1000px以上屏幕显示*/
			@media screen and (min-width:1200px){
				*{font-size: 1em;}
				.rank-info1 p span{color: cornflowerblue;font-size:0.8em;}
			}
			/*屏幕宽度在 640~1000px*/
			@media screen  and (min-width:640px )and (max-width:1200px) {
				*{font-size: 0.8em;}
				.rank-info1 p span{color: cornflowerblue;font-size:0.6em;}
				
			}
			/*屏宽640px以下 */
			@media  screen and (max-width:640px ) {
				*{font-size: 0.5em;}
				.layui-table th{height: 120px;}
				}
			}
			
			
			
			*{
				font-family: "微软雅黑";
			}
			.rank-box{
				height: 70px;
			}
			.rank-data{
			}
			#span_top{
				color: #0066FF;
				font-size: 18px;
			}
			.rank-main{
				width: 200px;
				height: 50px;
				line-height:30px;
				margin-left: 900px;
				padding-left:5px;
				text-align: center;
				float: right;
			}
			.rank-main a span{
				display:inline-block; 
				width: 80px;
				height: 35px;
				border: 1px solid #DBDBDF;
				margin-left: -4px;
			}
			.rank-main a:first-child span{
				background-color: #0058DD;
				color: white;
				border: 0px;
			}
			.rank-none{
				width: 600px;
				height: 250px;
				color: #919191;
				font-size:18px;
				margin: 0 auto;
				text-align: center;
				
			}
			.rank-tip{
				width: 100%;
				margin-top: 150px;
				height: 100px;
			}
			.rank-tip .rank-info_left{
				width: 200px;
				height: 120px;
				border: 1px solid #919191;
				color: #5E5E5E;
				padding-left: 30px;
				padding-top: 20px;
				background-color: #F6F6F7;
				margin-left: 30px;
			}
			.rank-btm_right{
				width: 500px;
				height: 200px;
				margin-left: 500px;
				margin-top: -142px;
			}
			.rank-info1 p span:first-child{
				
				margin: auto;
				width: 600px;
				color: #0058DD;
				
			.yui3-u-1_A{
				margin: 0 auto;
				width: 600px;
			}
			
		</style>
	</head>
	<body class="layui-container" oncontextmenu="event.returnValue=false" onselectstart="event.returnValue=false">
<div class="sub2">
	<div class="yui3-g wrap">
    	<div class="yui3-u-1 whites content pad10">
    		<div class="rank-box">
				<span id="span_top">时间：2017.10.30~2017.11.5</span><div class="rank-main">
				<a><span class="on" name="week"><font >上周榜</font></span></a>
				<a href="#">	
				   <span name="month">上月榜</span></a>
		</div>
	</div>
	
	<div class="rank-data">
	<div >
		<table class="layui-table" border="1">
			<tr>
				<th>排名</th>
				<th>班级</th>
				<th>姓名</th>
				<th>实际答题数</th>
				<th>正确率</th>
			</tr>
			
		</table>
		
	
		<div class="rank-tip layui-row" >
						<div class=" layui-col-xs6 layui-top">
							<p class="top">上榜条件：</p>
							<p>1、答题数量100道以上<br>
							   2、答题正确率60%以上<br>
							   3、排名前10名</p>
						</div>
						<div class="layui-col-xs6" style="float: left;">
							<div class="rank-info1">
							<p>
								<span>您上周的答题成果在全校排名第<font color="red">199</font>位，本周好好努力一下，争取上榜吧！<font color="red" size="32"></font></span><br>
								<font color="#6F6F6F">把答题成果发到<a href="javascript:void()" class="blue" id="openDialog" style="color: #0058DD;">云豆网</a> ，让更多的人看到吧。</font>
							</p>
							</div>
						</div>
		</div>
	</div>

	<div class="yui3-g wrap">
        <div class="yui3-u-1 content footer-bg" style="height: 0px;"></div>
        <div class="yui3-u-1_A">
            Copyright ©  1999~2017  长沙新途高新信息产业技术有限公司 | 
            <a href="#" target="_blank" title="" class="blue">云豆网</a> 
            <a href="#" target="_blank" title="" class="blue">面试第一站</a>
        </div>
    </div>
    
	</body>
</html>
