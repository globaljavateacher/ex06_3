<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Home</title>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>

<p>Date: <input type="text" id="datepicker"></p>

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<input type="button" id="btnAjax" value="Ajax Test">
<div id="content"></div>

<script>

	self.location ="/board/list";

</script>
 <script>
 /*
 document.getElementById("btnAjax").addEventListener('click',function(){
   var request = new XMLHttpRequest(); // XMLHttpRequest 생성
   request.open("GET", "http://localhost:8080/date/now"); // 데이터를 GET Method로 요청
   request.send(); // 실제 Send
   request.onreadystatechange = function() {
    if ( request.readyState == 4 && request.status == 200 ) { // request가 끝났으며(4), 성공적(200)인 경우. request.onload=()=>{} 으로 교체해도 가능하다.
     document.getElementById("content").innerHTML = request.responseText; // #content 태그 내의 내용을 받아온 텍스트로 교체.
    }
   };
 });
 */
 $('#btnAjax').on('click',function(){
	 $.ajax({
		  method: "get",
		  url: "http://localhost:8080/date/now",
		  data: { name: "John", location: "Boston" }
		})
		  .done(function( msg ) {
			  document.getElementById("content").innerHTML = msg;
		  });
 });
 
	
  </script>

</body>
</html>












