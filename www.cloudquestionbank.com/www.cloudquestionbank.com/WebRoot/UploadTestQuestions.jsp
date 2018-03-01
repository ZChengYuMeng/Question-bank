<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${adminid!=null  }">
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传试题</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/ST/layui/css/layui.css" media="all" />
	<script src="${pageContext.request.contextPath }/ST/layui/layui.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/UploadTestQuestions.css"  />
		<script src="${pageContext.request.contextPath }/ST/yanglu/js/jquery-1.4.2.min.js"></script>
		<script src="ST/zf/js/Currency.js"></script>
		<script type="text/javascript" src="ST/zf/js/Currency.js"></script>
		<script>
			$(function(){
				$.ajaxSetup({async:false});
				
				
				
				
				
				
				
				loadStage("&stage.id=1");//加载页面课程阶段
				//------[加载阶段课程]
				function loadStage($data){
					$.post("<%=request.getContextPath()%>/Stage_GetStatgeAndCourse",$data,success,"json");
					function success(result){
						console.log(result);
						var $html="";var courseIDArr="";//存储课程编号
						$.each(result.stage,function(i,o){
							$html+=i==0?"<option value="+o[0]+" selected='true'>"+o[1]+"</option>":"<option value="+o[0]+" >"+o[1]+"</option>";
						})
						$("#stage").html($html);$html="";//阶段
						$.each(result.course,function(i,o){
							courseIDArr+=i==0?o[0]:","+o[0];
							$html+=i==0?"<option value="+o[0]+" selected='true'>"+o[1]+"</option>":"<option value="+o[0]+" >"+o[1]+"</option>";
						})
						console.log($html);
						$("#subject_aourseId").html($html);//课程
						$("#CourseIDArr").val(courseIDArr);//写入课程编号
					}
					//render();
				}
				//------[END][加载阶段]	
				
				
				
				
				
				
				//隐藏提示
				$(".subject_stemPrompt").hide();
				$(".subject_aPrompt").hide();
				$(".subject_bPrompt").hide();
				$(".subject_cPrompt").hide();
				$(".subject_dPrompt").hide();
				$(".subject_answerPrompt").hide();
				$(".subject_aourseIdPrompt").hide();
				$(".subject_analysisPrompt").hide();
				$(".subject_isMultiselectPrompt").hide();
				
				//题干、a/b/c/d选项失焦时
				$("#subject.stem").blur(function(){
					VerificationsTextBox($(this),"给个题目内容吧！");
				})
				$("#subject_a").blur(function(){
					VerificationsTextBox($(this),"给个选项内容吧！");
				})
				$("#subject_b").blur(function(){
					VerificationsTextBox($(this),"给个选项内容吧！");
				})
				$("#subject_c").blur(function(){
					VerificationsTextBox($(this),"给个选项内容吧！");
				})
				$("#subject_d").blur(function(){
					VerificationsTextBox($(this),"给个选项内容吧！");
				})
				$("#subject_analysis").blur(function(){
					VerificationsTextBox($(this),"总得给个理由吧！");
				})
				
				
				
				
				
				
				
				//监听提交
				$("#sub").click(function(){
					var $bool=false;var $stemBool=false;var $aBool=false;var $bBool=false;
					var $cBool=false;var $dBool=false;var $answerBool=false;var $course_idBool=false;
					var $analysisBool=false;var $isMultiselectBool=false;
					$stemBool=VerificationsTextBox($("#subject_stem"),"给个题目内容吧！");
					$aBool=VerificationsTextBox($("#subject_a"),"给个选项内容吧！");
					$bBool=VerificationsTextBox($("#subject_b"),"给个选项内容吧！");
					$cBool=VerificationsTextBox($("#subject_c"),"给个选项内容吧！");
					$dBool=VerificationsTextBox($("#subject_d"),"给个选项内容吧！");
					$answerBool=VerificationsCheckBox($("#subject_answer"),"subject.answer");
					$course_idBool=VerificationsChoolIdOrclassId($("#subject_aourseId"),"您的还未选择需要添加的题目所属课程哦！");
					$analysisBool=VerificationsTextBox($("#subject_analysis"),"总得给个理由吧！");
					$isMultiselectBool=VerificationsChoolIdOrclassId($("#subject_isMultiselect"),"是不是多选呢？！");
					if($stemBool==true&&$aBool==true&&$bBool==true&&$cBool==true&&$dBool==true
					  &&$answerBool==true&&$course_idBool==true&&$analysisBool==true&&$isMultiselectBool==true){
					  	if(VerificationArrIsArrArg($("#CourseIDArr").val(),$("#subject_aourseId").val().trim())){//检测课程是否正确
					  		$bool=true;
					  	}else{FriendlyPrompt("您选择的课程好像有点问题哦！~");}
					 }
					if($bool){
						var $data="";
						$data+="&subject.stem="+$("#subject_stem").val().trim();
						$data+="&subject.a="+$("#subject_a").val().trim();
						$data+="&subject.b="+$("#subject_b").val().trim();
						$data+="&subject.c="+$("#subject_c").val().trim();
						$data+="&subject.d="+$("#subject_d").val().trim();
						$data+="&subject.answer="+ObtainCheckBox($("#subject_answer"),"subject.answer");
						$data+="&subject.aourseId="+$("#subject_aourseId").val().trim();
						$data+="&subject.analysis="+$("#subject_analysis").val().trim();
						$data+="&subject.isMultiselect="+$("#subject_isMultiselect").val().trim();
						$data+="&admin.adminid=<%=session.getAttribute("adminid")%>";
						console.log($data);
						//UploadSubject($data);
					}
					
				})
				
				//-----[清空表单]
				
				
				//-----[上传题目]
				function UploadSubject($data){
					$.post("<%=request.getContextPath()%>/Subject_ins_subject",$data,success,"json");
						function success(result){
							if(result){
							  //layui.use('layer', function(){
							 	FriendlyPrompt("上传题目成功！");
							 // })
							  $("#upload")[0].reset();
							}
							else{Laert_Prompt("上传题目失败……");}
						}
				}
				//-----[END][上传题目]
				
				
					
			
			
			
			
				//A/B/C/D选项聚焦时写入选项
				$("textarea[name=subject.a]").focus(function(){
					$(this).val(WriteOptionTitle($(this)));
				})
				$("textarea[name=subject.b]").focus(function(){
					$(this).val(WriteOptionTitle($(this)));
				})
				$("textarea[name=subject.c]").focus(function(){
					$(this).val(WriteOptionTitle($(this)));
				})
				$("textarea[name=subject.d]").focus(function(){
					$(this).val(WriteOptionTitle($(this)));
				})
				
				//管理员写入题干输入时
				$("textarea[name=subject.stem]").keyup(function(e){
						keydow_Br($(this),e);
						$(this).val(TestPaperWriting($(this),e));
				})
				//A/B/C/D选项写入
				$("textarea[name=subject.a]").keyup(function(e){
						keydow_Br($(this),e);
						$(this).val(TestPaperWriting($(this),e));
				})
				$("textarea[name=subject.b]").keyup(function(e){
						keydow_Br($(this),e);
						$(this).val(TestPaperWriting($(this),e));
				})
				$("textarea[name=subject.c]").keyup(function(e){
						keydow_Br($(this),e);
						$(this).val(TestPaperWriting($(this),e));
				})
				$("textarea[name=subject.d]").keyup(function(e){
				
						keydow_Br($(this),e);
						var $html=TestPaperWriting($(this),e);
						//alert($html);
						$(this).val($html);
				})
				//可视化代码写入函数
				function TestPaperWriting(element,e){
					var $WriteHtml="";
					var reg = /^[a-z]{1}$/
					//console.log(element.val());
					if(reg.test(element.attr("name"))){
						if(element.val().trim()==""){
							$WriteHtml="<font color='#0000FF'>"+element.attr("name")+":</font>";
						}
					}
					$WriteHtml+=element.val();
					var $WiteElentName="#"+element.attr("id")+"_OPtion";
					//console.log($WiteElentName+"/"+$WriteHtml);
					$($WiteElentName).html($WriteHtml);
					//演示区代码写入输入框
					//$($WiteElentName).attr("encode","true");
					var $WiteNewHtml=element.val();
					var $WiteNewHtml="";
					//if(e.keyCode!=8){
						 $WiteNewHtml=$($WiteElentName).html();
					//}
					//console.log($WiteElentName+"/"+$WriteHtml);
					//console.log("New：——"+$WiteNewHtml);
					return $WiteNewHtml;
				}
				//按下CapsLock换行函数
				function keydow_Br(element,e){
					var $html=element.val();
					if(e.keyCode==20 ){
						$html=$html+"<br>";
					}
					if(e.keyCode==17){
						$html=$html+"&nbsp;";
					}
					if(e.keyCode==13){
						$html=$html+"<br>&nbsp;&nbsp;";
					}
					element.val($html);
				}
				//检查是否写入选项
				function WriteOptionTitle(element){
					var $html="";
					if(element.val()==""){
						$html="<font color='#0000FF'>"+element.attr("title")+":</font>";
					}else{
						$html=element.val();
					}
					return $html;
				}
				
				
				
				
			})
			
		</script>
		<script type="text/javascript" src="ST/yanglu/js/jquery-1.4.2.min.js"></script>
		
		
	</head>
	<body>
              
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>上传题目</legend>
</fieldset>

 <!--左边部分-->
 <div class="left">
 <!--表单填写部分-->
<form class="layui-form" id="upload" action="Subject_ins_subject?admin.id=<%=session.getAttribute("adminid")%>" method="post">
  <div class="layui-form-item">
    <label class="layui-form-label">题干:</label>
    <div class="layui-input-block" >
      <textarea id="subject_stem" name="subject.stem" maxlength="500" lay-verify="required" encode:true; placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
    <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_stemPrompt">给个题目内容吧！</div>
    </div>
  </div>
  
  <div class="layui-form-item">
      <label class="layui-form-label">选项A:</label>
    	<div class="layui-input-block" >
	      <textarea id="subject_a" name="subject.a" title="a"  maxlength="500" lay-encode="true"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	     <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_aPrompt">给个选项吧！</div>
	    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">选项B:</label>
    	<div class="layui-input-block" >
	      <textarea id="subject_b" name="subject.b" title="b" maxlength="500"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	     <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_bPrompt">给个选项吧！</div>
	    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">选项C:</label>
    	<div class="layui-input-block" >
	      <textarea id="subject_c" name="subject.c"  title="c" maxlength="500"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	    <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_cPrompt">给个选项吧！</div>
	    </div>
  </div>
  <div class="layui-form-item">
   <label class="layui-form-label">选项D:</label>
    	<div class="layui-input-block" >
	      <textarea id="subject_d" name="subject.d" title="d"  maxlength="500"  lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	    <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_dPrompt">给个选项吧！</div>
	    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">标准答案:</label>
    <div class="layui-input-block"  lay-search="" >
	        <input type="checkbox" id="subject_answer" class="subject_answer" name="subject.answer" value="A" title="A"/>
	        <input type="checkbox" id="subject_answer" class="subject_answer" name="subject.answer" value="B" title="B"/>
	        <input type="checkbox" id="subject_answer" class="subject_answer" name="subject.answer" value="C" title="C"/>
	        <input type="checkbox" id="subject_answer" class="subject_answer" name="subject.answer" value="D" title="D"/>
    </div>
    <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_answerPrompt">您的还未选标准答案哦！</div>
	 </div>
  </div>
  
  <div class="layui-form-item">
  	 <label class="layui-form-label">所属阶段:</label>
  	 <div class="layui-input-block">
  	 	<select id="stage" class="stage" lay-verify="required"  lay-filter="stage">
  	 		
  	 	</select>
  	 </div>
  </div>
  
  <div class="layui-form-item"> 
    <label class="layui-form-label">所属课程:</label>
    <div class="layui-input-block">
      <select id="subject_aourseId" class="course_id" name="subject.aourseId" lay-verify="required"  lay-filter="aihao">
      	
      </select>
    </div>
    <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_aourseIdPrompt">您的还未选择需要添加的题目所属课程哦！</div>
	 </div>
  </div>
  
 <div class="layui-form-item">
    <label class="layui-form-label">题目解析:</label>
    	<div class="layui-input-block" >
	      <textarea id="subject_analysis" name="subject.analysis" lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	     <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_analysisPrompt">总得给个理由吧！</div>
	  	 </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">是否多选</label>
    <div class="layui-input-block">
      <select id="subject_isMultiselect"  name="subject.isMultiselect" lay-verify="required" lay-filter="aihao">
        <option value="0" >否</option>
        <option value="1" >是</option>
      </select>
    </div>
     <div class="layui-input-block">
		   	<div class="layui-form-mid layui-word-aux subject_isMultiselectPrompt">是否多选啊！</div>
	  </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" type="button" id="sub"  >立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>

  <!--[END]表单填写部分-->  
   
  </div>
  <!--[END]左边部分-->
  
  
   
  <!--右边可视化题目样式-->
 	<div class="right">
					<!--表单-->
					<form action="" method="post">
					<!--题干-->
					<font class="Prompt">[效果图]题干</font>
					<div class="layui-col-lg12 stem">
						<div class="TopicContent " >
							<pre class="layui-code "  id="subject_stem_OPtion" lay-title="JavaScript" lay-skin="notepad"   lay-height="100px" style="font-size: 16px;">
编写sql语句时，按()键可以及时获取在线帮助资料</br>(选择一项)
							</pre>
						</div>
					</div>
					<!--【END】题干-->
					<!--选项卡-->
					<div class="layui-col-lg12 option_tab">
					<div class="AnswerOptions">	
						<font class="Prompt">选项A:</font>
						<div class="option_Click"><input type="checkbox" name="guestChoice" class="option_Click_Btn"/></div>
						<div class="option_main">
							<pre class="layui-code "  id="subject_a_OPtion" style="background: white;"   lay-skin="notepad"  lay-height="100px">
<font color="#0000FF">A:</font>F1
							</pre>	
						</div>
					</div>
					
					<div class="AnswerOptions">	
						<font class="Prompt">选项B:</font>
						<div class="option_Click"><input type="checkbox" name="guestChoice" class="option_Click_Btn"/></div>
						<div class="option_main">
							<pre class="layui-code " id="subject_b_OPtion"   style="background: white;"   lay-skin="notepad"  lay-height="100px">
<font color="#0000FF">B:</font>AL+F1
							</pre>	
						</div>
					</div>
					
					<div class="AnswerOptions">	
						<font class="Prompt">选项C:</font>
						<div class="option_Click"><input type="checkbox" name="guestChoice" class="option_Click_Btn"/></div>
						<div class="option_main">
							<pre class="layui-code " id="subject_c_OPtion"   style="background: white;"   lay-skin="notepad"  lay-height="100px">
<font color="#0000FF">C:</font>F7
							</pre>	
						</div>
					</div>
					
					<div class="AnswerOptions">	
						<font class="Prompt">选项D:</font>
						<div class="option_Click"><input type="checkbox" name="guestChoice" class="option_Click_Btn"/></div>
						<div class="option_main">
							<pre class="layui-code " id="subject_d_OPtion"   style="background: white;"   lay-skin="notepad"  lay-height="100px">
<font color="#0000FF">D:</font>F5
							</pre>	
						</div>
					</div>
					</div>
</div>
 
 
 
 
  <!--[END]右边可视化题目样式-->
 
  <!--右下角提示-->
  <span class="layui-word-aux" ></span>
   <!--[END]右下角提示-->
  
  
  
  
<script>
layui.use(['form', 'layedit', 'laydate','util', 'layer'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
   var util = layui.util
  ,laydate = layui.laydate
  ,layer = layui.layer;
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 	
 //友情提示框
   layer.open({
		 type: 1			//是否铺满窗口
        ,title: false 		//false不显示标题栏 需要标题时：'标题'
        ,closeBtn: true 	//右上角显示关闭按钮
        ,area: '350px;' 	//弹出框宽度
        ,shade: 0.1			//透明度
        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        ,btn: ['我以认真阅读']//选择按钮
        ,btnAlign: 'c'      //选择按钮的位置 l:左浮动 r:右浮动 c:居中
        ,moveType: 1 		//是否允许右下角拖拽模式，0或者1 （貌似没什么卵用）
        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">\
        			亲爱的管理员~<br>欢迎来到题库添加界面o(*￣︶￣*)o<br><br>在这里<br>←--左边的是题目输入框<br>右边是效果图--→<br>\
        			<font color="orangered">注意:</font>在这里您如果想要在题目添加时<br>输入"空格"按下<font color="orangered">【Ctrl】</font>键即可,<br>输入"换行"按下<font color="orangered">【CapsLock/Enter】</font>键<br>就可在右边界面达到题目展示效果了!~<br>\
        			<br><br></div>'//内容
        ,success: function(layero){//执行函数
          var btn = layero.find('.layui-layer-btn');//获取所有的class=".layui-layer-btn"的btn
          
		}
      })
 	
 		  //阶段切换事件
		   form.on('select(stage)', function(data){
		   		//console.log(data.value);
		   		loadStage("&stage.id="+data.value);
		   })	
  			
  			
  				//------[加载阶段课程]
				function loadStage($data){
					$.post("<%=request.getContextPath()%>/Stage_GetStatgeAndCourse",$data,success,"json");
					function success(result){
						console.log(result);
						var $html="";var courseIDArr="";//存储课程编号
						$.each(result.course,function(i,o){
							courseIDArr+=i==0?o[0]:","+o[0];
							$html+=i==0?"<option value="+o[0]+" selected='true'>"+o[1]+"</option>":"<option value="+o[0]+" >"+o[1]+"</option>";
						})
						$("#subject_aourseId").html($html);//课程
						$("#CourseIDArr").val(courseIDArr);//写入课程编号
					}
					layui.form.render('select');
				}
				//------[END][加载阶段]		
  			
 
  //固定块
  util.fixbar({
    bar1: true
    ,bar2: true
    ,css: {right: 50, bottom: 100,opacity:0.4}
    ,bgcolor: '#393D49'
    ,click: function(type){
      if(type === 'bar1'){
        layer.msg('如有疑问请联系管理员!')
      } else if(type === 'bar2') {
        layer.msg('PS:[CapsLock/Enter]键换行,[Ctrl]空格。')
      }
    }
  });
  
  
  
});

    </script>
    <input type="hidden" id="CourseIDArr" /> 
</body>
</html>
</c:if>
<c:if test="${adminid==null }">
	<script>location.href="<%=request.getContextPath()%>/AdminLogin.jsp";</script>
</c:if>