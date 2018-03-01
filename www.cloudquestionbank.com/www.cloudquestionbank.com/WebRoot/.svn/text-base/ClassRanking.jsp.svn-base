<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>班级排行</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="ST/layui/css/layui.css"  media="all">
	<script src="ST/layui/layui.js" charset="utf-8"></script>
  <style>
  		body{min-width:290px;}
			/*1000px以上屏幕显示*/
			@media screen and (min-width:1200px){
				.layui-table font {font-size: 1em;}
				.rank-btm p{color: cornflowerblue;font-size:0.8em;}
			}
			/*屏幕宽度在 640~1000px*/
			@media screen  and (min-width:640px )and (max-width:1200px) {
				.layui-table font {font-size: 0.8em;}
				.rank-btm p{color: cornflowerblue;font-size:0.8em;}
			}
			/*屏宽640px以下 */
			@media  screen and (max-width:640px ) {
				.layui-table font {font-size: 0.8em;}
				.layui-table th{height: 120px;}
				 .rank-btm p{color: cornflowerblue;font-size:0.7em;}
			}
			
			
			
			
			*{
				font-family: "微软雅黑";
				padding: 0px;
				margin: 0px;
			}
			.rank-box{
				width: 100%;
				height: 100px;
				border:1px solid #DDDDDD;
				margin-top: 10px;
				color: #1170FF;
				font-size: 16px;
			}
			.rank-main{
				margin-top: 20px;
				width: 275px;
				height: 35px;
				line-height:30px;
				float: right;
				
			}
			.rank-main span{
				display:inline-block; 
				width: 25%;
				height: 33px;
				margin: 0 -3px;
				text-align: center;
				border-left: 1px solid #DDDDDD;
				background-color: #0099CB;
			}
			.rank-main span {
				color: white;
			}
			.rank-main span:hover{
				background-color: deepskyblue;
			}
			.rank-box .sp{
				display:block; 
				margin-left: 200px;
			}
			
			.tab_list tr{
				//border: 1px solid #000711;
				height: 40px;
				background-color: #F6F6F7;
				text-align: center;
			}
			.tab_list thead tr:first-child th{
				background-color: #0052CC;
				color: white;
			}
			.tab_list tr:nth-of-type(even){
				background:white;
			}
			.rank-btm{
				margin: auto;
				color: #0058DD;
				font-size: 20px;
				
			}
			.yui3-u-1 {
				margin: 0 auto;
				
			}
			.time{margin-left:10px;}
		</style>
	</head>
	<body class="layui-container" oncontextmenu="event.returnValue=false" onselectstart="event.returnValue=false">
		
		<div class="rank-box">
			<span class='time'>时间：2017.11.6~2017.11.8</span>
			<div class="rank-main layui-row">
				<a href="#"><span  class="layui-col-lg3 layui-col-sm3 layui-col-xs3" name="week" style="margin-left:16px;"><font>本周榜</font></span></a>
				<a href="#"> <span  class="layui-col-lg3 layui-col-sm3 layui-col-xs3" name="month">本月榜 </span></a>
				<a href="#"> <span  class="layui-col-lg3 layui-col-sm3 layui-col-xs3" name="week">上周榜 </span></a>
				<a href="#"> <span  class="layui-col-lg3 layui-col-sm3 layui-col-xs3" name="week" >上月榜 </span></a>
			</div>
		</div>
		
		
	<div>
		<table class="layui-table">
			<div class="layui-row" id="title">
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >排名</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >姓名</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >累计答题数</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >实际答题数</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >正确率</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >用时(小时)</font></th>
			</div>
		
			<tr class="layui-row">
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >1</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >左梦思</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >0</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2">
				<font >0</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >--</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >--</font></th>
			</tr>
			
			
			<tr class="layui-row">
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >1</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >李晶</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >0</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2">
				<font >0</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >--</font></th>
				<th class="layui-col-lg2 layui-col-sm2 layui-col-xs2"><font >--</font></th>
			</tr>
			
			</table>
	</div>
	<div class="rank-btm ">
		
		<p>
			<span >您在本周没有做任何试题，需要加倍努力了！<font color="red" size="32"></font></span><br>
			把答题成果发到<a href="javascript:void()" class="blue" id="openDialog">云豆网</a> ，让更多的人看到吧。
		</p>
		
	</div>
	
		<hr />
	<div class=" yui3-g wrap">
        <div class="yui3-u-1 content footer-bg" style="height: 0px;"></div>
        <div class="yui3-u-1 acenter footer footer-new content whites">
            Copyright ©  1999~2017  北京阿博泰克北大青鸟信息技术有限公司 | 
            <a href="#" target="_blank" title="" class="blue">云豆网</a> 
            <a href="#" target="_blank" title="" class="blue">面试第一站</a>
        </div>
    </div>
    
		
	</body>
</html>
