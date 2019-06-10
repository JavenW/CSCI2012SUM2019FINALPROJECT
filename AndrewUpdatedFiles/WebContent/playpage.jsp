<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Random" %>
<%@ page import="typeracer.readfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Play Page</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script>
		function myFunction() {
			$(document).ready(function(){
   				$('#codeimage').load("typinggame2.html");

			});
			
		}
		</script>
		<style>
			@font-face {
				font-family: Savoye;
				src: url(Images/Savoye.woff);
			}
			
			@font-face {
				font-family: Ferarri;
				src: url(Images/FerroRosso.ttf);
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
			#codeimage {
  				height: 20%;
 				width: 640px;
  				position: fixed;
  				z-index: 1;
  				top: 20%;
  				left:30%;
  				background-color: rgba(125,125,125,0.3);
  				overflow-x: hidden;
  				padding-top: 20px;
  				text-align: center;
			}
			
			#codeimage img{
			padding-top:20px;
			
			}
			body {
				width:1510px;
				height:687px;
				background-color:black;
			}
			#bg{
		    width:100%;
			height:120%;
			background-image:url(Images/register_background.png);
			background-size: 1500px 780px;	
			filter: blur(3px);
  			-webkit-filter: blur(3px);		
		}
			
		</style>
	</head>
	<%
		String playerName = "";
		String username = request.getParameter("username");
		String usernameRegistered = request.getParameter("namenew");
		
		//Player continued as guest
		if(username == null && usernameRegistered == null)
		{
			playerName = "Tommy_Trojan";
		}
		
		//Player Registered
		else if(username ==  null)
		{
			playerName = usernameRegistered;
		}
		
		//Player Logged in
		else
		{
			playerName = username;
		}
	%>
	<script>
		var socket;
		function connectToServer() {
			socket = new WebSocket("ws://localhost:8080/GroupProject/Server");
			socket.onopen = function(event) {
			
			}
			socket.onclose = function(event) {
				
			}
		}
		
		function onTestChange() {
		    var key = window.event.keyCode;

		    // If the user has pressed enter
		    if (key === 13) {
		    	 document.getElementById("codeimage").style.backgroundColor = "black";
		        return false;
		    }
		    else {
		        return true;
		    }
		}
	</script>
	<body onload="connectToServer()">
	
	<%
		Vector<String> fileBank = new Vector<String>();
		fileBank.add("bubblesort.txt"); fileBank.add("insertionsort.txt");
		fileBank.add("selectionsort.txt");
		Random rand = new Random();
		int myPick = rand.nextInt(100)%(fileBank.size());
		readfile myReader = new readfile();
		String filename = fileBank.get(myPick);
		myReader.read(request.getServletContext().getRealPath(filename));
		int numOfWord = myReader.num;
		out.println(numOfWord);
		Vector<String> myContent = myReader.contents;
		for(int i = 0; i < myContent.size();i++){
			out.println(myContent.get(i));
		}
					
	%>
	
		<div id="bg"></div>
	
		<div class="sidenav">
  			<h2>Player 1: <%=playerName%></h2>
  			<h2>Player 2:</h2>
  			<h2>Player 3:</h2>
  			<h2>Player 4:</h2>
		</div>
		
		<div class="chatarea">
			<h2>Reserved for chat area</h2>
		</div>
		
		<div id="codeimage">
			 <IMG SRC="Images/cr.gif">
		</div>
		
		<div id="topbar">
			<input type="button" id="return" value="CodeRacer" onclick="location.href = 'homepage.jsp'">
		</div>
		<h2 id="message">Type area</h2>
		
		<input type="button" id="begin" value="Start" onclick="myFunction()">
		<textarea class="output" onkeypress="onTestChange();"></textarea>
		
	</body>
</html>