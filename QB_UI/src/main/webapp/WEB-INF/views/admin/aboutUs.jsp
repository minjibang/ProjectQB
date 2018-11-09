<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#map {
 height: 400px;
 width: 100%;
}

.flex-container {
 display: -webkit-flex;
 display: flex;
 -webkit-flex-flow: row wrap;
 flex-flow: row wrap;
 text-align: center;
}

.flex-container>* {
 padding: 15px;
 -webkit-flex: 1 100%;
 flex: 1 100%;
}

.article {
 text-align: left;
}

header {
 background: black;
 color: white;
}

footer {
 background: #aaa;
 color: white;
}

.nav {
 background: none;
}

.nav ul {
 list-style-type: none;
 padding: 0;
}

.nav ul a {
 text-decoration: none;
}

@media all and (min-width: 768px) {
 .nav {
  -webkit-flex: 1 auto;
  flex: 1 auto;
  -webkit-order: 1;
  order: 1;
 }
 .article {
  -webkit-flex: 5 0px;
  flex: 5 0px;
  -webkit-order: 2;
  order: 2;
 }
 footer {
  -webkit-order: 3;
  order: 3;
 }
}

.button {
 background-color: #4CAF50; /* Green */
 border: none;
 color: white;
 text-align: center;
 text-decoration: none;
 display: inline-block;
 font-size: 22px;
 margin: 4px 2px;
 -webkit-transition-duration: 0.4s; /* Safari */
 transition-duration: 0.4s;
 cursor: pointer;
 width: 100%;
 height: 80px;
}

.button5 {
 background-color: white;
 color: black;
 border: 2px solid #555555;
}

.button5:hover {
 background-color: #555555;
 color: white;
}
</style>
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
				<div class="panel-heading">
					<header class="panel-heading wht-bg">
						<h4 class="gen-case">
							<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;소개
						</h4>
					</header>
				</div>
				    <img src="${pageContext.request.contextPath}/img/logo1.png" alt="QB_logo" class="QB_logo" style="width:500px;height:100px;"/>
				<nav class="nav">
					<ul>
						<li><input type="button" class="button button5"
							value="비트캠프_서초점" id="gang"></li>
					</ul>
				</nav>
				<article class="article">
					<!-- 구글 맵 출력 태그 -->
					<div id="map" ></div>
					  <!-- 구글맵 API 키 -->
   <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsXbEQ9aeugj_K1kmEVToG1-9ZZE-E9Js
"></script>
  </article> 
			</div>
		</div>
	</section>
</section>
<script>
 function initMap() { /*구글맵 실행 함수*/
  var uluru = { /*맵 초기 경도 위도 값 설정*/
   lat : 37.494572,
   lng : 127.027522
  }; 
  var map = new google.maps.Map(document.getElementById('map'), { /*구글맵 <div id="map">에 생성*/
   zoom : 6, /*맵 확대 값 초기화*/
   center : uluru  /*설정한 위도 경도로 위치 설정*/
  
  });
 }
 window.onload = function() {

  var image = new google.maps.MarkerImage(new google.maps.Size(10, 10)); /*마크 이미지 생성 및 크기 설정*/

   var uluru = {
    lat : 37.494572,
    lng : 127.027522
   };
   var map = new google.maps.Map(document.getElementById('map'), {
    zoom : 17,
    center : uluru
   });  
   var marker = new google.maps.Marker({/*마커 생성*/
    position : uluru, /*마커 위치 지정*/
    map : map, /*구글맵*/
    icon : image, /*마커 이미지 */
    title : '서초점' /*마커 title*/
   });
   var content = "비트캠프_서초점<br/><br/>Tel: 010-1234-1234";
   var infowindow = new google.maps.InfoWindow({
    content : content
   });
   google.maps.event.addListener(marker, "click", function() {
    infowindow.open(map, marker);
   });
   /*마커 클릭 시 생성되는 말풍선 실행함수*/

  
 }
</script>