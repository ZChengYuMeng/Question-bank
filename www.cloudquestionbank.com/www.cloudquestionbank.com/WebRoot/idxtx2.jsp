<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>柱状统计图1</title>

<link type="text/css" rel="stylesheet" href="./css/index.css" />
</head>
<body><script src="/demos/googlegg.js"></script>
<div id="ring"></div>
<div id="line"></div>

<p>柱状统计图1</p>
<div id="pillar1" style="width:838px;height:305px;"></div>


<script type="text/javascript" src="ST/yanglu/js/jquery-1.7.2-min.js"></script>
<script type="text/javascript" src="ST/yanglu/js/echarts.min.js"></script>
</body>
<script type="text/javascript">
// JavaScript Document
// echarts
// create for AgnesXu at 20161115
//环状图
$(function(){
   $.ajaxSetup({async:false});
   var $avg=0;
   var $avg1=0;
   var $avg2=0;
   var $avg3=0;
   var $avg4=0;
   var $avg5=0;
   var $avg6=0;
  $.post("<%=request.getContextPath()%>/Index_tuxing",success,"json");
  function success(data){
  	var obj = eval(data);
  	var sroce=[];
  	var $sor=[];
  	var $sor1=[];
  	var $sor2=[];
  	var $sor3=[];
  	var $sor4=[];
  	var $sor5=[];
  var $sum=0;
  var $sum1=0;
  var $sum2=0;
  var $sum3=0;
  var $sum4=0;
  var $sum5=0;
  var $sum6=0;
  if(obj.list[0]==""){
	 sroce=0;
  }else{
  	$.each(obj.list[0],function(i,o){
  		sroce[sroce.length]=o[4];
  	})
  }
  
  if(obj.list[1]==""){
	 $sor=0;
  }else{
  	$.each(obj.list[1],function(i1,o1){
  		$sor[$sor.length]=o1[4];
  	})
  }
  
  if(obj.list[2]==""){
	 $sor1=0;
  }else{
  	$.each(obj.list[2],function(i,o){
  		$sor1[$sor1.length]=o[4];
  	})
  }
  if(obj.list[3]==""){
	 $sor2=0;
  }else{
  	$.each(obj.list[3],function(i,o){
  		$sor2[$sor2.length]=o[4];
  	})
  }
   if(obj.list[4]==""){
	 $sor3=0;
  }else{
  	$.each(obj.list[4],function(i,o){
  		$sor3[$sor3.length]=o[4];
  		//alert(o1[4])
  	})
  }
     if(obj.list[5]==""){
	 $sor4=0;
  }else{
  	$.each(obj.list[5],function(i,o){
  		$sor4[$sor4.length]=o[4];
  		//alert(o1[4])
  	})
  }
     if(obj.list[6]==""){
	 $sor5=0;
  }else{
  	$.each(obj.list[6],function(i,o){
  		$sor5[$sor5.length]=o[4];
  		//alert(o1[4])
  	})
  }
  if(sroce!=0){
  	for (var j = 0; j < sroce.length; j++) {
	$sum+=sroce[j];
	}
	$avg=$sum/sroce.length;
}
  if($sor!=0){
  	for (var j = 0; j < $sor.length; j++) {
	$sum1+=$sor[j];
	}
	$avg1=$sum1/$sor.length;
}
	if($sor1!=0){
	for (var j = 0; j < $sor1.length; j++) {
	$sum2+=$sor1[j];
	}
	$avg2=$sum2/$sor1.length;
}
if($sor2!=0){
	for (var j = 0; j < $sor2.length; j++) {
	$sum3+=$sor2[j];
	}
	$avg3=$sum3/$sor2.length;
}
if($sor3!=0){
	for (var j = 0; j < $sor3.length; j++) {
	$sum4+=$sor3[j];
	}
	$avg4=$sum4/$sor3.length;
}
if($sor4!=0){
	for (var j = 0; j < $sor4.length; j++) {
	$sum5+=$sor4[j];
	}
	$avg5=$sum5/$sor4.length;
}
if($sor5!=0){
	for (var j = 0; j < $sor5.length; j++) {
	$sum6+=$sor5[j];
	}
	$avg6=$sum6/$sor5.length;
}	
	
  }

var ring = echarts.init(document.getElementById('ring'));
var labelTop = {
    normal : {
        label : {
            show : true,
            position : 'center',
            formatter : '{b}',
            textStyle: {
                baseline : 'bottom'
            }
        },
        labelLine : {
            show : false
        }
    }
};

var labelFromatter = {
    normal : {
        label : {
            formatter : function (params){
                return 100 - params.value + '%';
            },
            textStyle: {
                baseline : 'top'
            }
        }
    },
}
var labelBottom = {
    normal : {
        color: '#ccc',
        label : {
            show : true,
            position : 'center'
        },
        labelLine : {
            show : false
        }
    },
    emphasis: {
        color: 'rgba(0,0,0,0)'
    }
};
var radius = [40, 55];
ring.setOption({
    color:["#33bb9f","#ffa259","#4cbbe6"],
    series : [
        {
            type : 'pie',
            center : ['15%', '58%'],
            radius : radius,
            x: '0%', // for funnel
            itemStyle : labelFromatter,
            data : [
                {name:'other', value:26, itemStyle : labelBottom},
                {name:'完成', value:84,itemStyle : labelTop}
            ]
        },
        {
            type : 'pie',
            center : ['45%', '58%'],
            radius : radius,
            x:'20%', // for funnel
            itemStyle : labelFromatter,
            data : [
                {name:'other', value:76, itemStyle : labelBottom},
                {name:'退回', value:24,itemStyle : labelTop}
            ]
        },
        {
            type : 'pie',
            center : ['75%', '58%'],
            radius : radius,
            x:'40%', // for funnel
            itemStyle : labelFromatter,
            data : [
                {name:'other', value:35, itemStyle : labelBottom},
                {name:'未完成', value:65,itemStyle : labelTop}
            ]
        }
    ]
}) ;





//折线图
var line = echarts.init(document.getElementById('line'));
line.setOption({
    color:["#32d2c9"],
    title: {
        x: 'left',
        text: '成绩统计',
        textStyle: {
            fontSize: '18',
            color: '#4c4c4c',
            fontWeight: 'bolder'
        }
    },
    tooltip: {
        trigger: 'axis'
    },
    toolbox: {
        show: true,
	      feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']}
        }
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['前六天','前五天','前四天','前三天','前二天','前一天','当天'],
        axisLabel: {
            interval:0
        }
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'成绩',
            type:'line',
            data:[$avg6.toFixed(2), $avg5.toFixed(2), $avg4.toFixed(2),$avg3.toFixed(2), $avg2.toFixed(2), $avg1.toFixed(2),$avg.toFixed(2)],
            markLine: {data: [{type: 'average', name: '平均值'}]}
        }
    ]
}) ;



//柱状图
var pillar1 = echarts.init(document.getElementById('pillar1'));
pillar1.setOption({
    color:["#ce6e73","#ee804b","#ffc668"],
    title : {
        subtext: '平均分（分）'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        x: 'right',
        data:['专业技能型','课程复习型','模拟真题型']
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['1月','2月','3月','4月','5月',
            '6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'专业技能型',
            type:'bar',
            data:[74, 62, 56, 79, 80, 30, 55, 35, 38, 41, 75, 89]
        },
        {
            name:'课程复习型',
            type:'bar',
            data:[70, 65, 80, 71, 70, 40, 35, 46, 58, 40, 56, 30]
        },
        {
            name:'模拟真题型',
            type:'bar',
            data:[60, 55, 70, 61, 60, 30, 45, 36, 48, 50, 56, 40]
        }
    ]
}) ;



//柱状图2
var pillar2 = echarts.init(document.getElementById('pillar2'));
pillar2.setOption({
    color:["#00afff"],
    tooltip : {
        trigger: 'axis'
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['语言','词汇','词汇1','词汇2','词汇3','词汇4',
            '词汇5','词汇6','词汇7']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'您的班级',
            type:'bar',
            data:[74, 62, 56, 79, 80, 30, 55, 35, 38]
        }
    ]
});


});

</script>
</html>