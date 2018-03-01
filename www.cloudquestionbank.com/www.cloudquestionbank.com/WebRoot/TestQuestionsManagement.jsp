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
		<title>试题管理</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/ST/layui/css/layui.css" media="all" />
		<script src="${pageContext.request.contextPath }/ST/layui/layui.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/ST/zf/css/TestQuestionsManagement.css" />
		<script src="${pageContext.request.contextPath }/ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<script>
			$(function(){
				//隐藏提示
				$(".stemPrompt").hide();
				$(".aPrompt").hide();
				$(".bPrompt").hide();
				$(".cPrompt").hide();
				$(".dPrompt").hide();
				$(".answerPrompt").hide();
				$(".course_idPrompt").hide();
				$(".analysisPrompt").hide();
				$(".isMultiselectPrompt").hide();
				$(".Upd").hide();
				$(".upd").live("click",function(){
					var $data="";
					//alert($(this).parent().parent().parent().html());
					$(this).parent().parent().parent().parent().children("td[name]").each(function(i,o){
						$data+='"'+$(this).attr("name")+'":'+$(this).html()+',';
						//写入标准答案
						if($(this).attr("name")=="answer"){
							CheckBox($(".answer"),$(this).html());
						}
						//写入题干、A、B、C、D选项
						if($(this).attr("name")=="stem"){
							TextBoxWrite($("#stem"),$(this).html());
						}
						if($(this).attr("name")=="a"){
							TextBoxWrite($("#a"),$(this).html());
						}
						if($(this).attr("name")=="b"){
							TextBoxWrite($("#b"),$(this).html());
						}
						if($(this).attr("name")=="c"){
							TextBoxWrite($("#c"),$(this).html());
						}
						if($(this).attr("name")=="d"){
							TextBoxWrite($("#d"),$(this).html());
						}
						//选中所属课程
						if($(this).attr("name")=="course_id"){
							SelectedDrop_DownBox($("#course_id"),$(this).html());
						}
						//写入题目解析
						if($(this).attr("name")=="analysis"){
							TextBoxWrite($("#analysis"),$(this).html());
						}
						//是否多选选中
						if($(this).attr("name")=="isMultiselect"){
							SelectedDrop_DownBox($("#isMultiselect"),$(this).html());
						}
						//ID赋值
						if($(this).attr("name")=="id"){
							TextBoxWrite($("#id"),$(this).html());
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
					var $bool=false;var $stemBool=false;var $aBool=false;var $bBool=false;
					var $cBool=false;var $dBool=false;var $answerBool=false;var $course_idBool=false;
					var $analysisBool=false;var $isMultiselectBool=false;var $idBool=false;
					$idBool=$("#id").val().trim()!=""?true:false;
					$stemBool=VerificationsTextBox($("#stem"),"给个题目内容吧！");
					$aBool=VerificationsTextBox($("#a"),"给个选项内容吧！");
					$bBool=VerificationsTextBox($("#b"),"给个选项内容吧！");
					$cBool=VerificationsTextBox($("#c"),"给个选项内容吧！");
					$dBool=VerificationsTextBox($("#d"),"给个选项内容吧！");
					$answerBool=VerificationsCheckBox($("#answer"),"subject.answer");
					$course_idBool=VerificationsChoolIdOrclassId($("#course_id"),"您的还未选择标准答案哦！");
					$analysisBool=VerificationsTextBox($("#analysis"),"总得给个理由吧！");
					$isMultiselectBool=VerificationsChoolIdOrclassId($("#isMultiselect"),"是不是多选呢？！");
					if($stemBool==true&&$aBool==true&&$bBool==true&&$cBool==true&&$dBool==true&&$idBool==true
					  &&$answerBool==true&&$course_idBool==true&&$analysisBool==true&&$isMultiselectBool==true){
					  	$bool=true;
					 }
					  //console.log($stemBool+"/"+$aBool+"/"+$bBool+"/"+$cBool+"/"+$dBool+"/"+$answerBool+"/"+$course_idBool+"/"+$analysisBool+"/"+$isMultiselectBool);
					if($bool){
						var $data="";
						$data+="&subject.id="+$("#id").val().trim();
						$data+="&subject.stem="+$("#stem").val().trim();
						$data+="&subject.a="+$("#a").val().trim();
						$data+="&subject.b="+$("#b").val().trim();
						$data+="&subject.c="+$("#c").val().trim();
						$data+="&subject.d="+$("#d").val().trim();
						$data+="&subject.answer="+ObtainCheckBox($("#answer"),"subject.answer");
						$data+="&subject.course_id="+$("#course_id").val().trim();
						$data+="&subject.analysis="+$("#analysis").val().trim();
						$data+="&subject.isMultiselect="+$("#isMultiselect").val().trim();
						console.log($data);
						alert($data);
						$(".Upd").hide();
					}
				})
			})
			
		</script>
	</head>
	<body >
		
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>试题管理</legend>
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
     
     
     <div class="Upd">
     	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>修改试题</legend>
		</fieldset>
		<form class="layui-form" id="Upd" action="">
			
		 <div class="layui-form-item">
		    	<div class="layui-input-block" >
		    		<input type="hidden" name="subject.id" id="id" />	
			    </div>
		  </div>	
		<div class="layui-form-item">
		    <label class="layui-form-label">题干:</label>
		    <div class="layui-input-block" >
		      <textarea id="stem" name="subject.stem" maxlength="500" lay-verify="required" encode:true; placeholder="请输入内容" class="layui-textarea"></textarea>
		    </div>
		    <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux stemPrompt">给个题目内容吧！</div>
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		      <label class="layui-form-label">选项A:</label>
		    	<div class="layui-input-block" >
			      <textarea id="a" name="subject.a"  maxlength="500" lay-encode="true"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			    <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux aPrompt">给个选项吧！</div>
			    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">选项B:</label>
		    	<div class="layui-input-block" >
			      <textarea id="b" name="subject.b"  maxlength="500"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			      <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux bPrompt">给个选项吧！</div>
			    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">选项C:</label>
		    	<div class="layui-input-block" >
			      <textarea id="c" name="subject.c"  maxlength="500"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			    <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux cPrompt">给个选项吧！</div>
			    </div>
		
		  </div>
		  <div class="layui-form-item">
		   <label class="layui-form-label">选项D:</label>
		    	<div class="layui-input-block" >
			      <textarea id="d" name="subject.d"  maxlength="500"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			    <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux dPrompt">给个选项吧！</div>
			    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">标准答案:</label>
			     <div class="layui-input-block">
							        <input type="checkbox" id="answer" class="answer" name="subject.answer" value="A" title="A"/>
							        <input type="checkbox" id="answer" class="answer" name="subject.answer" value="B" title="B"/>
							        <input type="checkbox" id="answer" class="answer" name="subject.answer" value="C" title="C"/>
							        <input type="checkbox" id="answer" class="answer" name="subject.answer" value="D" title="D"/>
				 </div>
				  <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux answerPrompt">您的还未选标准答案哦！</div>
				  </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">所属课程:</label>
		    <div class="layui-input-block">
		      <select id="course_id" class="course_id" name="subject.aourseId" lay-verify="required"  lay-filter="aihao">
		      	<option value="" ></option>
		      	<option value="1" >sql</option>
		      </select>
		    </div>
		     <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux course_idPrompt">您的还未选择需要添加的题目所属课程哦！</div>
			  </div>
		  </div>
		  
		 <div class="layui-form-item">
		    <label class="layui-form-label">题目解析:</label>
		    	<div class="layui-input-block" >
			      <textarea id="analysis" name="subject.analysis" lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			    <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux analysisPrompt">总得给个理由吧！</div>
			  </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">是否多选</label>
		    <div class="layui-input-block">
		      <select id="isMultiselect" name="subject.isMultiselect" lay-verify="required" lay-filter="aihao">
		        <option value="0" >否</option>
		        <option value="1" >是</option>
		      </select>
		    </div>
		     <div class="layui-input-block">
				   	<div class="layui-form-mid layui-word-aux isMultiselectPrompt">是否多选啊！</div>
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
  //将一段数组分页展示
  				/*$('.SearchResult  li').on('click',function(){
  					$('#SearchBox').val($(this).html());
  					$('#SearchBox').attr("placeholder",$(this).html());
  				})*/
  				/*//监听滑轮滚动事件
  				$(window).bind('scroll',function(){
  					if(parseInt($(window).scrollTop())>30){
  						shouHide();
  					}else{
  						$('.SearchResult  li').show();
  					}
  					
  				})*/
  				//搜索框按下键盘事件
  				
  				
  				/*$('.layui-input').on("keyup",function(){
  					var name=$(this).val();
  					//alert(name);
  					console.log(name);
					if(name!=""){
  					var reg = new RegExp(name);
					var html="";
					var Shtml="";
  					 layui.each(data, function(index, item){
  					 	
  					 	if(reg.test(item.username) ){
  					 		html+='<dd lay-value="'+item.username+'" class>'+item.username+'</dd>'
  					 		console.log(item.username);
  					 		Shtml+='<option value="'+item.username+'">'+item.username+'</option>';
  					 	}
  					 	console.log(html);
  					 	$('.layui-anim-upbit').html(html);
  					 	$("#SearchBox").html(Shtml);
  					 })
  					}
  				})
  				*/
  				//点击修改时
  				/*$(".upd").live('click',function(){
  					alert(1);
  				})*/
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
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
      <th lay-data='{field:id, width:80, sort: true}'>编号</th>\
      <th >题干</th>\
      <th >选项A</th>\
      <th >选项B</th>\
      <th >选项C</th>\
      <th >选项D</th>\
      <th >标准答案</th>\
      <th >所属课程</th>\
      <th >解析</th>\
      <th >创建时间</th>\
      <th >修改时间</th>\
      <th >上传题目的人员类型</th>\
      <th >上传题目的人员的编号</th>\
      <th >修改题目人员的编号</th>\
      <th >修改题目的人员类型</th>\
      <th >是否多选</th>\
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
		      <td name="stem">'+item.username+'</td>\
		      <td name="a">a</td>\
		      <td name="b">b</td>\
		      <td name="c">c</td>\
		      <td name="d">ddd</td>\
		      <td name="answer">B,D</td>\
		      <td name="course_id">1</td>\
		      <td name="analysis">AA</td>\
		      <td name="createTime">2016-11-28</td>\
		      <td name="updateTime">2016-11-28</td>\
		      <td name="uploadAuthorType">教员 A</td>\
		      <td name="uploadAuthorID">1221</td>\
		      <td name="updateAuthorID">1221</td>\
		      <td name="updateAuthorType">教员</td>\
		       <td name="isMultiselect">0</td>\
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
