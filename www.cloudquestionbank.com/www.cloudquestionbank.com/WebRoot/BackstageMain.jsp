<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<c:if test="${adminid!=null }">
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>云题库管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <link href="ST/layui/css/layui.css" rel="stylesheet" media="all"  />
     <script type="text/javascript" src="ST/layui/layui.all.js"></script> 
    <link rel="stylesheet" href="./plugins/font-awesome/css/font-awesome.min.css" media="all" />
    <link rel="stylesheet" href="./build/css/app.css" media="all" />
    <link rel="stylesheet" href="./build/css/themes/default.css" media="all" id="skin" kit-skin />
    <script type="text/javascript" src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
      <script type="text/javascript">
	  	//关闭浏览器后退
		window.history.go(1);
 	  </script>
    <script type="text/javascript">
    
    $(function(){
    	$.ajaxSetup({async:false});
    	var $adminid=$(".adminid").val();
    	//console.log($adminid);
    	$.post("<%=request.getContextPath()%>/Admin_LoadBMN","&admin.adminId="+$adminid,success,"json");
    	function success(date){
    		//$.ajaxSetup({async:false});
    		var $htmltext="";
	    	//console.log(date);
	    	//var obj = eval(date);
	    	//输出管理员信息
    		$.each(date.admin,function(i,o){
    			//console.log(o);
    			$("#imgUrl").attr("src",o[1]);
    			$(".adminname").html(o[0]);
    			$("#adminTypeName").html(o[2]);
    		});
    		//页面加载
    		$.each(date.load,function(i,o){
    			$htmltext+='<li class="layui-nav-item layui-nav-itemed">';
    			for(b=0;b<o.length;b++){
    				//console.log(o[b]);
    				var obj=o[b];
    				//console.log(obj[0]);
    				if(obj[4]==""){//筛选出主标题
    					$htmltext+="<a href=\"javascript:;\"><i class=\"fa fa-plug\" aria-hidden=\"true\"></i><span>"+obj[3]+"</span></a>\
                        <dl class='layui-nav-child'>";
    					//console.log(obj[3]);
    				}else{
    								//'<dd><a href="javascript:;" kit-target data-options="{url:'+obj[1]+',icon:'+obj[2]+',title:'+obj[3]+',id:'obj[0]+'}"><i class="layui-icon">+obj[2]+</i><span>+obj[3]+</span></a></dd>';
    					$htmltext+="<dd><a href=\"javascript:;\" kit-target data-options=\"{url:'"+obj[1]+"',icon:'"+obj[2]+"',title:'"+obj[3]+"',id:'"+obj[0]+"'}\"><i class='layui-icon'>"+obj[2]+"</i><span>"+obj[3]+"</span></a></dd>";
    				}
    			}
    			$htmltext+="</dl></li>";
    		});
    		$("#BMN").html($htmltext);
    		//console.log($htmltext);
    		//layui.render("layui-nav-itemed");
    	}
    })
    </script>
</head>
<!-- <script src="ST/zf/js/nav.js"></script> -->
<body class="kit-theme">
<input type="hidden" class="adminid" value="<%=session.getAttribute("adminid")%>">
    <div class="layui-layout layui-layout-admin kit-layout-admin">
        <div class="layui-header">
            <div id="adminTypeName" class="layui-logo">Management</div>
            <div class="layui-logo kit-logo-mobile">K</div>
            <ul class="layui-nav layui-layout-left kit-nav">
                <!--<li class="layui-nav-item"><a href="javascript:;">控制台</a></li>-->
            </ul>
            <ul class="layui-nav layui-layout-right kit-nav">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe63f;</i> 皮肤</a>
                    </a>
                    <dl class="layui-nav-child skin">
                        <dd><a href="javascript:;" data-skin="default" style="color:#393D49;"><i class="layui-icon">&#xe658;</i> 默认</a></dd>
                        <dd><a href="javascript:;" data-skin="orange" style="color:#ff6700;"><i class="layui-icon">&#xe658;</i> 橘子橙</a></dd>
                        <dd><a href="javascript:;" data-skin="green" style="color:#00a65a;"><i class="layui-icon">&#xe658;</i> 原谅绿</a></dd>
                        <dd><a href="javascript:;" data-skin="pink" style="color:#FA6086;"><i class="layui-icon">&#xe658;</i> 少女粉</a></dd>
                        <dd><a href="javascript:;" data-skin="blue.1" style="color:#00c0ef;"><i class="layui-icon">&#xe658;</i> 天空蓝</a></dd>
                        <dd><a href="javascript:;" data-skin="red" style="color:#dd4b39;"><i class="layui-icon">&#xe658;</i> 枫叶红</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img id="imgUrl" src="" class="layui-nav-img"> <span class="adminname">请登录</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'basic.html',icon:'&#xe658;',title:'基本资料',id:'966'}"><span>基本资料</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'basic.html',icon:'&#xe658;',title:'安全设置',id:'998'}"><span>安全设置</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:void(onclick);" onclick="location.href='Admin_admin_zhuxiao?admin.adminid=<%=session.getAttribute("adminid")%>';"  ><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black kit-side">
            <div class="layui-side-scroll">
                <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul id="BMN" class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                </ul>
            </div>
        </div>
        <div class="layui-body" id="container">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">&#xe63e;</i> 请稍等...</div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            2017 &copy;
            <a href="#">www.cloudquestionbank.com/</a> MIT license
        </div>
    </div>
   <!-- <script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1264021086'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1264021086%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
    </script>-->
    <script src="./plugins/layui/layui.js"></script>
    <script>
        var message;
        layui.config({
            base: 'build/js/',
            version: '1.0.1'
        }).use(['app', 'message'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer;
            //将message设置为全局以便子页面调用
            message = layui.message;
            //主入口
            app.set({
                type: 'iframe'
            }).init();
            $('dl.skin > dd').on('click', function() {
                var $that = $(this);
                var skin = $that.children('a').data('skin');
                switchSkin(skin);
            });
            var setSkin = function(value) {
                    layui.data('kit_skin', {
                        key: 'skin',
                        value: value
                    });
                },
                getSkinName = function() {
                    return layui.data('kit_skin').skin;
                },
                switchSkin = function(value) {
                    var _target = $('link[kit-skin]')[0];
                    _target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
                    setSkin(value);
                },
                initSkin = function() {
                    var skin = getSkinName();
                    switchSkin(skin === undefined ? 'default' : skin);
                }();
        });
    </script>
</body>

</html>
</c:if>
<c:if test="${adminid==null }">
	<script>location.href="<%=request.getContextPath()%>/AdminLogin.jsp";</script>
</c:if>