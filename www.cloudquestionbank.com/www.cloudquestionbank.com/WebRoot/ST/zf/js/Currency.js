/*layui-JS简单的通用方法 date:2017-11-22~*/




//-----[文本框写入value](元素，value)
function TextBoxWrite(element,value){
	element.val(value);
}
//-----[END][写入value]


//-----[写入html]
function HtmlWrite(element,value){
	element.html(value);
}
//-----[END][写入html]

//-----[复选框选中元素](元素，value)PS：value:1,2
function CheckBox(element,text){
	var arr = text.split(',');
	console.log(arr.length);
	 $('input:checkbox[name='+element.attr("name")+']').removeAttr("checked");
	 //layui.form.render('checkbox');
	 $('input:checkbox[name='+element.attr("name")+']').each(function(i){
      	for(j=0;j<arr.length;j++){
      		if($(this).val()==arr[j]){
      			//console.log($(this).attr("checked"));
      			$(this).attr("checked","checked"); 
      			//console.log($(this).attr("checked"));
      			break;
      		}
      	}
      	layui.form.render('checkbox');
      });
}
//-----[END][复选框选中元素]


//------[获取复选框值](传入元素)
function ObtainCheckBox(element,$name){
	var $bool=false;
	var $lxid="";
	 $('input:checkbox[name='+$name+']:checked').each(function(i){
       if(0==i){
        $lxid = $(this).val();
       }else{
        $lxid += (","+$(this).val());
       }
      });
     return $lxid;
}
//------[END][获取复选框值]
//-----[选中下拉框]
function SelectedDrop_DownBox(element,$val){
	element.children("option[value='"+$val+"']").attr("selected","true");
	layui.form.render('select');
}
//-----[END][选中下拉框]

//-----[验证下拉框中是否选中值]
function VerificationsChoolIdOrclassId(element,$TS){
	var $bool=false;
	if(element.val()!=""){
		$bool=element.val().trim()>=0;
		ShowPrompt(element,$bool,$TS);	
	}else{
		ShowPrompt(element,$bool,"不能为空哦！");	
	}
	
	return $bool;
}
//-----[END][验证下拉框中是否选中值]

/*//------[获取复选框值]
function ObtainCheckBox(element,$name){
	var $bool=false;
	var $lxid="";
	 $('input:checkbox[name='+$name+']:checked').each(function(i){
       if(0==i){
        $lxid = $(this).val();
       }else{
        $lxid += (","+$(this).val());
       }
      });
     return $lxid;
}
//------[获取复选框值]*/

//-----[清除特殊字符并提示]
function KeyUP_Cler(element){
	var $val=RegeMatch(element.val())?"":element.val();
	var $bool=RegeMatch(element.val())?false:true;
	ShowPrompt(element,$bool,"不能有特殊字符哦~");
	return $val;
}
//-----[END][清除特殊字符并提示]

//-----[过滤特殊字符]
function RegeMatch($name){
	var pattern = new RegExp("[-_` ~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）—+|{}【】‘；：”“’。，、？]");  
    if($name != "" && $name.length>0){  
        if(pattern.test($name)){ return true;}
        else{return false;}
    }  
}
//-----[END][过滤特殊字符]
//-----[验证文本框并提示]	
function VerificationsTextBox(element,$TS){
	var $bool=false;
	$bool=element.val().trim()!="";
	ShowPrompt(element,$bool,$TS);	
	return $bool;
}
//-----[END][验证文本框并提示]
 //----[显示/隐藏.提示PS:$bool为false时显示,true：隐藏]
  function ShowPrompt(element,$bool,$TShtml){
  	var $PromptName=element.attr("id");
  	$("."+element.attr("id")+"Prompt").html($TShtml);
  	var $bl=false;
  		$bl=$bool?$bl:true;
	if($bool==false)
	    {$("."+$PromptName+"Prompt").show();}
	else{$("."+$PromptName+"Prompt").hide();}
  	Notice(element,$bl);
  }
  //----[END][显示提示]

//-----[验证复选框是否选中值]
function VerificationsCheckBox(element,$name){
	var $bool=false;
	var $lxid="";
	 $('input:checkbox[name='+$name+']:checked').each(function(i){
       if(0==i){
        $lxid = $(this).val();
       }else{
        $lxid += (","+$(this).val());
       }
      });
     $bool= $lxid!=""?true:false;
     //console.log($lxid);
     ShowPrompt(element,$bool,"您的还未选择哦~")
     return $bool;
}
//-----[END][验证复选框是否选中值]	

//-----[警告框颜色]
function Notice(element,$bool){
	if($bool){element.addClass("Notice");}
	else{element.removeClass("Notice");};
}
//-----[END][警告框颜色]

//-----[弹出框提示]
function Laert_Prompt($TS){
	layer.open({
	  title: false
	  ,closeBtn: 0
	  ,anim: 6
	  ,content: '<i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe69c;</i>  '+$TS+''
	  ,btnAlign: 'c'
	  ,area: ['50']
	  ,scrollbar: false
	});
}
//-----[END][弹出框提示]

//-----[验证邮编]
function VerificationsZipCode(element,$TS){
	//console.log(element.val());
	var $bool=false;
	if(element.val().trim()!=""){
		var arg=/[1-9]\d{5}(?!\d)/;
		$bool=arg.test(element.val());
		ShowPrompt(element,$bool,$TS);
	}else{
		ShowPrompt(element,$bool,"不能为空哦！");
	}
	return $bool;
}
//-----[END][验证邮编]

//-----[单选按钮选中]
function RadioBtnSelected(element,$val){
	$('input:radio[name='+element.attr("name")+']').each(function(i){
       if($(this).val()==$val){
         $(this).attr("checked","true");
       }
	})
 	layui.form.render('radio');
}
//-----[单选按钮选中]
//----[验证单选按钮是否选择]
function VerificationsRadioBtn(element,$TS){
	console.log(element.attr("checked")+"//");
	var  $bool=false;
	if(element.val().trim()!=""){
	 var $lxid="";
	 $('input:radio[name='+element.attr("name")+']:checked').each(function(i){
       if(0==i){$lxid = $(this).val();}
       else{ $lxid += (","+$(this).val()); }
      });
      $bool= $lxid!=""?true:false;	
      ShowPrompt(element,$bool,$TS);
	}else{ ShowPrompt(element,$bool,"您还未选中哦！");}
    return $bool;
}
//----[验证单选按钮是否选择]
//------[获取单选按钮的值]
function GetRadioBtnVal(element){
	var $val=""
	$('input:radio[name='+element.attr("name")+']:checked').each(function(i){
			$val+=$(this).val().trim();
	})
	return $val;
}
//------[END][获取单选按钮的值]
//-----[验证手机号]
function VerificationPhon(element){
	var $bool=false;
	var $TShtml="";
	if(element.val().trim()!=""){
		var $testph=/^1(3|4|5|7|8)\d{9}$/;
		$bool=$testph.test(element.val());
		$TShtml="您输入的手机号有误！";
	}else{$TShtml="请输入手机号";}
	ShowPrompt(element,$bool,$TShtml);
	return $bool;
}
//-----[END][验证手机号]	



//-----[验证文本框内是否有非法字符,给与弹出框提示,$DefaultTS:默认提示(即为空是的提示),$ErrorTs:错误提示(包含有非法字符时的提示)]
function VerificationIllegalAndPrompt(element,$DefaultTS,$ErrorTs){
	var $bool=false;
	var $bl=true;
	var DefaultTS=$DefaultTS;
	var ErrorTs=$ErrorTs;
	if(element.val()!=""){
		 $bool=RegeMatch(element.val())?false:true;
		 if($bool==false){
			Laert_Prompt(ErrorTs);
		 }
	}else{
		Laert_Prompt(DefaultTS);
	}
	$bl=$bool?false:$bl;
	Notice(element,$bl);
	return $bool;
}
//-----[END][验证文本框内是否有非法字符,给与弹出框提示]

//-----[验证来两时间差]
function TimeDifference(element1,element2){
	//console.log(element1.val()+" /"+element2.val());
	var $bool=false;
   	$bool=element1.val() > element2.val()?false:true;
    if($bool==false){Laert_Prompt("开始时间和结束时间有错误哦！");}    
    return $bool;
}
//-----[END][验证来两时间差]



//-------[验证邮箱并给与提示]
  function VerificationEmail(element){
  	var $bool=false;
  	var $TShtml="";
  	if(element.val()!=""){
  		var re = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
  		$bool=re.test(element.val().trim());
  		$TShtml="邮箱格式有误！";
  	}else{
  		$TShtml="请填写邮箱！";
  	}
  	ShowPrompt(element,$bool,$TShtml);
  	return $bool;
  }
   //-----[END][验证邮箱并给与提示]
   

 //----[验证密码]
function VerificationPwd(element1,element2){
var $bool=false;
var $TShtml="";
if(element1.val().trim()!="" && element2.val().trim()!=""){
	
	if(element1.val().trim().length>=6 && element2.val().trim().length>=6){
		$TShtml="两次输入的密码不一致!";
		$bool=element1.val()==element2.val()?true:false;
		ShowPrompt(element2,$bool,$TShtml);
	}else{
		$TShtml="密码长度需大于六位数~哦！";
		if(element1.val().trim().length<6){
			ShowPrompt(element1,$bool,$TShtml);
		}
		if(element2.val().trim().length<6){
			ShowPrompt(element2,$bool,$TShtml);
		}
	}
	
	
}else{
	$TShtml="请填写密码!";
  			ShowPrompt(element2,$bool,$TShtml);
  			ShowPrompt(element1,$bool,$TShtml);
  		}
  		return $bool;
  	}
  //----[END][验证密码]
  //-----[验证元素不为空，过滤特殊字符]
function VerificationGuestName(element){
	var $TShtml="不能为空哦~！";
	var $bool=false;
	var $bl=true;
	if(element.val()!=""){
		var $val=RegeMatch(element.val())?"":element.val();
		 $bool=RegeMatch(element.val())?false:true;
		 $TShtml="不能有非法字符！";
	}
	ShowPrompt(element,$bool,$TShtml);
	$bl=$bool?false:$bl;
	Notice(element,$bl);
	return $bool;
}
//-----[END][验证元素不为空，过滤特殊字符]
//-----[验证身份证]
function VerificationCardNo(element){
	var $bool=false;var $bl=true;
	if(element.val().trim()!=""){
		var $testph=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;//十八身份证正则表达式 
		$bool=$testph.test(element.val());
		if($bool==false){Laert_Prompt("您的身份证号码好像有点问题~！");}
	}else{
		 Laert_Prompt("身份证号码是不能为空的哦~！");
	}
	$bl=$bool?false:$bl;
	Notice(element,$bl);
	return $bool;
}
//-----[END][验证身份证]
	//-----[验证用户头像像是否选择]
	function  VerificationImgUrl(element){
		var $bool=false;
		    $bool=element.val()!=""?true:false;
		ShowPrompt(element,$bool,"您还未选择图片哦~！");	
		return $bool;
	}
	//-----[END][验证用户头像像是否选择]
	
//----[生成数字加法验证码](传入写入元素，返回验证码计算结果)
function productionVerificationCode(element){
    var code = 9999; 
	var ranColor = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); //随机生成颜色
	// alert(ranColor)
	var ranColor2 = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); 
 	var num1 = Math.floor(Math.random() * 100);  
    var num2 = Math.floor(Math.random() * 100);  
    code = num1 + num2;  
    element.val(num1 + "+" + num2 + "=?");  
    if (element.hasClass("nocode")) {  
        element.removeClass("nocode");  
        element.addClass("code"); 
    }  
    element.css('background',ranColor);
    element.css('color',ranColor2);
    return code;
}
//----[END][生成数字加法验证码]



//-----[验证文本框不能有特殊字符&&不为空&&长度大于多少]
function  VerificationTextBoxAndLeng(element,Len){
	var $TShtml="不能为空哦~！";
	var $bool=false;
	var $bl=true;
	//console.log(element.val().length+"/"+Len);
	if(element.val()!="" && element.val().length>Len){
		var $val=RegeMatch(element.val())?"":element.val();
		 $bool=RegeMatch(element.val())?false:true;
		 $TShtml="不能有非法字符！";
		 ShowPrompt(element,$bool,$TShtml);
	}else{
		if(element.val()!=""){ShowPrompt(element,$bool,"长度小于"+(Len+1)+"位数");}
		else{ShowPrompt(element,$bool,$TShtml);}
	}
	$bl=$bool?false:$bl;
	Notice(element,$bl);
	return $bool;
}
//-----[END][验证文本框不能有特殊字符&&不为空&&长度大于多少]
//-----[友好提示]
function FriendlyPrompt($TS){
		layer.msg($TS,{
 			time:2000
 			,btn:['好的']
 			,btnAlign: 'c' 
 			})
}
//-----[END][友好提示]

//-----[传入【1,2】格式的字符串,值 ，值判断这个值是否在这个数组中true:在False:不在]
function VerificationValIsArray($arr,$val){
	var bool=false;
	//console.log($arr+"/"+$val);
	var $newArr=$arr.split(",");//切割字符串
	  	for(i=0;i<$newArr.length;i++){
	  		bool=$newArr[i]==$val?true:false;
	  		//console.log($newArr[i]==$val);
	  		if(bool){break;}
	  	}
	return bool;
}
//-----[END][传入数组，值判断这个值是否在这个数组中]

//----[验证内容是否是纯数字]
function VerificationValIsNumber($val,$ts){
	var bool=false;
	if($val==""){
		Laert_Prompt("不能为空哦！");
	}else{
		var reg=/^[0-9]*$/;
		bool=reg.test($val);
		if(bool==false){Laert_Prompt($ts);}
	}
	
	
	return bool;
}
//----[验证内容是否是纯数字]
//-----[获取当前时间]
function getdatetime(){
	var myDate = new Date();
	//获取当前年
	var year=myDate.getFullYear();
	//获取当前月
	var month=myDate.getMonth()+1;
	//获取当前日
	var date=myDate.getDate(); 
	var h=myDate.getHours();       //获取当前小时数(0-23)
	var m=myDate.getMinutes();     //获取当前分钟数(0-59)
	var s=myDate.getSeconds();  
	var now=year+'-'+p(month)+"-"+p(date)+" "+p(h)+':'+p(m)+":"+p(s);

	return now; 
}
function p(s) {
    return s < 10 ? '0' + s: s;
}
//-----[获取当前时间]
//-----[传入参照数组，选中值数组判断是否现在数组中]
function VerificationArrIsArrArg($argArr,$arr){
	console.log($argArr+"/"+$arr);
	var bool=false;var $IsBool=false;
	var $newArr=$argArr.split(",");//切割参照数组
	var $val=$arr.split(",");//切割值数组
	var $TrueCount="";//记录==true的个数
	var $TRUE=$val.length;//全部在参数数组中返回true
	  	for(i=0;i<$newArr.length;i++){
	  		for(j=0;j<$val.length;j++){
	  			$IsBool=$newArr[i]==$val[j]?true:false;
	  			if($IsBool){$TrueCount++;}
	  		}
	  		if($TRUE==$TrueCount){bool=true;break;}//全部匹配返回TRUE
	  	}
	return bool;
}
//-----[传入参照数组，选中值数组判断是否现在数组中]

//-----[刷新界面]
function SX(){
	setTimeout(function showTime(){
		window.location.reload();
	}, 1000);
}
//-----[END][刷新界面]


