<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="utf-8">
  <title>本班排行榜</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="ST/layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body> 
 
<div class="demoTable">
  搜索ID：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div>
 
<table class="layui-hide" id="LAY_table_user" lay-filter="user">
	
</table> 
               
          
<script src="ST/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
$(function(){
window.open ('Ranking2.jsp','newwindow','height=100,border:5px solid #ccc,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no,status=no') 
 $.ajaxSetup({async:false});
  var $data=[];
  $.post("<%=request.getContextPath()%>/Index_Ranking1?class1.id=<%=session.getAttribute("classid")%>&school.id=<%=session.getAttribute("schoolid")%>",
  function(resure){
  var obj = eval(resure);
  $.each(obj.listRank,function(i,o){
  	 $data[$data.length]={
      "id": ""+(i+1)+""
      ,"name": ""+o[0]+""
      ,"cname": ""+o[1]+""
      ,"realName": ""+o[2]+""
      ,"completedQuantity": ""+o[3]+""
    }
  })
   
  })
layui.use('table', function(){
  var table = layui.table;

 

  //方法级渲染
  table.render({
    elem: '#LAY_table_user'
    ,data:$data
      ,skin: 'row'
     ,even: true
    ,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', title: 'ID', width:180, sort: true, fixed: true}
      ,{field:'name', title: '学校名称', width:280}
      ,{field:'cname', title: '班级名称', width:180, sort: true}
      ,{field:'realName', title: '姓名', width:180,height:100}
      ,{field:'completedQuantity', title: '已做题数', width:180}
    ]]
   
    ,page: true
    ,height: 500
  });
  
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
     // alert(demoReload.val())
      //执行重载
      table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          key: {
            id: demoReload.val()
           
          }
           
        }
      });
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
})
</script>

</body>
</html>