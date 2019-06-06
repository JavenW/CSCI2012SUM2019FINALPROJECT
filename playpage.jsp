q<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Play Page</title>
		<style>
			@font-face {
				font-family: Savoye;
				src: url(Images/Savoye.woff);
			}
			#topbar {
				position: absolute;
				background-color: rgba(125,125,125,0.3);
				width: 100%;
				height: 15%;
				top: 0;
				left: 0;
			}
			#return {
				position: relative;
				background: none;
				border: none;
				color: black;
				font-family: Savoye;
				font-size: 70px;
				top: 20px;
				left: 220px;
				text-shadow: 1px 2px 5px;
			}
			.output {
				position:absolute;
				top: 380px;
				left: 450px;
  				width: 40rem;
  				min-height: 20rem;
				display: block;
				font-size: 1.6rem;
  				font-family: Consolas,monaco,monospace; 
  				background-color: rgba(125,125,125,0.3);
  				position: fixed;
			}
			#message{
				position:absolute;
				top:380px;
				left:360px;
				font-family: Savoye;
				font-size: 1.8rem;
				text-orientation:upright;
				writing-mode:vertical-rl;
			}
			#begin{
				position:absolute;
				left:77.5%;
				top:80%;
				background-color:white;
				border-radius:30px;
				font-size:30px;
				font-family: Consolas,monaco,monospace; 
				color:grey;
				padding-left:25px;
				padding-right:25px;
				padding-top:4px;
				padding-bottom:4px;
				position: fixed;
			}
			.sidenav {
  				height: 40%;
 				width: 320px;
  				position: fixed;
  				z-index: 1;
  				top: 20%;
  				left: 0;
  				background-color: rgba(125,125,125,0.3);
  				overflow-x: hidden;
  				padding-top: 20px;
			}

			.sidenav h2 {
  				padding: 6px 8px 6px 16px;
  				text-decoration: none;
  				font-family: Consolas,monaco,monospace; 
  				font-size: 25px;
  				color: gray;
  				display: block;
			}

			.sidenav h2:hover {
  				color: #f1f1f1;
			}
			.chatarea {
  				height: 40%;
 				width: 320px;
  				position: fixed;
  				z-index: 1;
  				top: 20%;
  				right:0;
  				background-color: rgba(125,125,125,0.3);
  				overflow-x: hidden;
  				padding-top: 20px;
			}
			.codeimage {
  				height: 20%;
 				width: 640px;
  				position: fixed;
  				z-index: 1;
  				top: 20%;
  				left:30%;
  				background-color: rgba(125,125,125,0.3);
  				overflow-x: hidden;
  				padding-top: 20px;
			}
			body {
				width:1510px;
				height:687px;
				background-color:black;
			}
			#bg{
		    width:100%;
			height:120%;
			background-image:url(Images/try.jpg);
			background-size: 1500px 780px;	
			filter: blur(3px);
  			-webkit-filter: blur(3px);		
		}
			
		</style>
	
		
	</head>
	<body>
		<div id="bg"></div>
	
		<div class="sidenav">
  			<h2>Player 1:</h2>
  			<h2>Player 2:</h2>
  			<h2>Player 3:</h2>
  			<h2>Player 4:</h2>
		</div>
		
		<div class="chatarea">
			<h2>Reserved for chat area</h2>
		</div>
		
		<div class="codeimage">
			<h2>Reserved for code image</h2>
		</div>
		
		<div id="topbar">
			<input type="button" id="return" value="CodeRacer" onclick="location.href = 'homepage.jsp'">
		</div>
		<h2 id="message">Type area</h2>
		
		<input type="button" id="begin" value="Start">
		<textarea class="output"></textarea>
		
		
	</body>
</html>