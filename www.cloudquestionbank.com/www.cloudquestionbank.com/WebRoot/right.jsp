<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery蓝色网页右侧栏悬浮在线客服代码</title>

<script type="text/javascript" src="ST/yanglu/js/jquery-1.10.2.min.js"></script>
<style type="text/css">



/* popup */

.popup{
  width: 100%;
  height: 100vh;
  display: none;

  position: fixed;
  top: 0;
  right: 0;
}

#popup-article:target{
  display: block;
}

.popup__block{
  height: calc(100vh - 40px);
  padding: 5% 15%;
  box-sizing: border-box;
  
  margin-top: 20px;
  overflow: auto;
  -webkit-animation: fade .5s ease-out 1.3s both;
          animation: fade .5s ease-out 1.3s both;
}

.popup:before{
  content: "";
  box-sizing: border-box;
  width: 100%;
  
  box-shadow: inset 0 0 0 20px #f0f0f0;
  background: #fff;

  position: fixed;
  top: 50%;
  will-change: height, top;
  -webkit-animation: open-animation .6s cubic-bezier(0.83, 0.04, 0, 1.16) .65s both;
          animation: open-animation .6s cubic-bezier(0.83, 0.04, 0, 1.16) .65s both;
}

.popup:after{
  content: "";
  width: 0;
  height: 2px;
  background-color: #f0f0f0;
  
  will-change: width, opacity;
  -webkit-animation: line-animation .6s cubic-bezier(0.83, 0.04, 0, 1.16) both;
          animation: line-animation .6s cubic-bezier(0.83, 0.04, 0, 1.16) both;

  position: absolute;
  top: 50%;
  left: 0;
  margin-top: -1px;
}

@-webkit-keyframes line-animation{

  0%{
    width: 0;
    opacity: 1;
  }

  99%{
    width: 100%;
    opacity: 1;
  }

  100%{
    width: 100%;
    opacity: 0;
  }  
}

@keyframes line-animation{

  0%{
    width: 0;
    opacity: 1;
  }

  99%{
    width: 100%;
    opacity: 1;
  }

  100%{
    width: 100%;
    opacity: 0;
  }  
}

@-webkit-keyframes open-animation{

  0%{
    height: 0;
    top: 50%;
  }

  100%{
    height: 100vh;
    top: 0;
  }
}

@keyframes open-animation{

  0%{
    height: 0;
    top: 50%;
  }

  100%{
    height: 100vh;
    top: 0;
  }
}

@-webkit-keyframes fade{

  0%{
    opacity: 0;
  }

  100%{
    opacity: 1;
  }
}

@keyframes fade{

  0%{
    opacity: 0;
  }

  100%{
    opacity: 1;
  }
}

.popup__title{
  margin: 0 0 1em;
}

.popup__close{
  width: 3.2rem;
  height: 3.2rem;
  text-indent: -9999px;
  position: absolute;
  
  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjMDAwMDAwIiBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4gICAgPHBhdGggZD0iTTE5IDYuNDFMMTcuNTkgNSAxMiAxMC41OSA2LjQxIDUgNSA2LjQxIDEwLjU5IDEyIDUgMTcuNTkgNi40MSAxOSAxMiAxMy40MSAxNy41OSAxOSAxOSAxNy41OSAxMy40MSAxMnoiLz4gICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjwvc3ZnPg==);
}

.popup__media{
  margin-bottom: 2rem;
}

@media screen and (min-width: 641px){

  .popup__title{
    font-size: 3.8rem;
  }

  .popup__close{
    top: 40px;
    right: 40px;
  }
  
  .popup__media{
    max-width: 35%;
  }

  .popup__media_left{
    float: left;
    margin-right: 3rem;
  }

  .popup__media_right{
    float: right;
    margin-left: 3rem;
  }  
}

@media screen and (max-width: 640px){

  .popup__title{
    font-size: 2.2rem;
  }

  .popup__close{
    top: 20px;
    right: 20px;
  }
}

/*
* demo page
*/

@media screen and (min-width: 768px){

  html{
    font-size: 62.5%;
  }
}

@media screen and (max-width: 767px){

  html{
    font-size: 50%;
  }
}


p{
  margin: 0;
  line-height: 1.5;
}

p:not(:last-child){
  margin-bottom: 1.5rem;
}

img{
  display :block;
  max-width: 100%;
}

a{
  text-decoration: none;
  color: #039be5;
}

.page{
  min-height: 100vh;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
  -ms-flex-pack: distribute;
      justify-content: space-around;
}

.page__demo{
  -webkit-box-flex: 1;
      -ms-flex-positive: 1;
          flex-grow: 1;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
}

.main-container{
  max-width: 1200px;
  padding-left: 1rem;
  padding-right: 1rem;

  margin-left: auto;
  margin-right: auto;
}

.page__container{
  margin: auto;
}

.footer{
  padding-top: 1rem;
  padding-bottom: 1rem;
  text-align: center;  
  font-size: 1.4rem;
}

.footer__link{
  color: #fff;
}

@media screen and (min-width: 361px){

  .footer__container{
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: justify;
        -ms-flex-pack: justify;
            justify-content: space-between;
  }
}

@media screen and (max-width: 360px){

  .melnik909{
    display: none;
  } 
}
</style>
</head>
<body><h3> <a href="#popup-article" class="card__link">THE MY ADVENTURE IN THE FRANCE AND PHOTOGRAPHY WITH TOUR DE FRANCE</a></h3>        
       
<div id="popup-article" class="popup">
  <div class="popup__block">
    <h1 class="popup__title">The my adventure in the France and photography with Tour De France</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam eaque optio vitae in explicabo recusandae sit id sapiente excepturi tempore, nemo, nulla odio deleniti rerum nisi perferendis aut molestias! Incidunt nesciunt iusto praesentium! In at maiores quibusdam enim quis, quam!</p>
    <img src="https://placeimg.com/640/400/nature" class="popup__media popup__media_right" alt="The foto of nature">
    <p>Architecto magni dolores cumque tenetur nemo id aperiam, ratione temporibus at, consectetur totam, fuga et illo rerum earum dicta. Vitae ullam harum enim aliquid hic commodi voluptas cumque iste ex accusantium architecto doloremque reprehenderit, asperiores vero dolor, esse inventore dolorem.</p>
    <p>Excepturi eaque, reprehenderit dolores, cum molestias repellendus in expedita. Placeat totam, quos pariatur quidem explicabo id harum ab voluptatum. Necessitatibus, aliquam! Dolorum voluptatem ut laudantium excepturi cumque, hic iure impedit ullam accusantium error natus recusandae, quia fuga quo voluptates officiis?</p>    
    <p>Dignissimos debitis eos necessitatibus accusantium natus voluptates illo blanditiis corporis minus. Repudiandae libero quae, illo error expedita consectetur possimus voluptate eum esse quam molestiae tempore dignissimos ipsam similique ab quod. Ea earum adipisci rem voluptatem aliquid voluptatum deleniti necessitatibus provident.</p>
    <p>Dicta eum amet impedit maiores accusamus numquam saepe necessitatibus temporibus ut! Velit ducimus repellendus fuga repudiandae culpa voluptatibus delectus praesentium totam odit ratione, tenetur assumenda, labore esse et nostrum a, aut veritatis. Nihil, voluptas, impedit? Magnam dolorum, iure repellendus vitae.</p>
    <p>Temporibus voluptatum voluptatibus iste, nam atque dignissimos quam labore sequi adipisci tempore exercitationem quos, libero, reprehenderit facere quasi soluta, itaque at eum cum possimus! Facilis, tempora soluta at quis. Nemo expedita voluptate esse nam ex odit, sequi eveniet quibusdam, dolores?</p>
    <p>Praesentium laboriosam iste dolore cumque voluptatibus deleniti quia, delectus provident, illum aperiam, atque molestiae. Cum delectus, doloribus expedita eius veritatis assumenda deleniti veniam reprehenderit animi ut, eaque asperiores, dicta incidunt omnis repellendus dolorum enim inventore rerum voluptatem saepe error id.</p>
    <a href="#" class="popup__close">close</a>
  </div>
</div>


</body>
</html>
