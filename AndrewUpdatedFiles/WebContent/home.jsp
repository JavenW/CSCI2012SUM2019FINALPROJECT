<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home</title>
	</head>
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
	#username {
		position: absolute;
		font-size: 20px;
		color: black;
		top: 5px;
		left: 900px;
	}
	#name {
		position: absolute;
		font-size: 20px;
		color: black;
		height: 25px; 
		width: 150px;
		top: 18px;
		left: 1000px;
		padding-left: 5px;
	}
	#password {
		position: absolute;
		font-size: 20px;
		color: black;
		top: 50px;
		left: 900px;
	}
	#word {
		position: absolute;
		font-size: 20px;
		color: black;
		height: 25px; 
		width: 150px;
		top: 63px;
		left: 1000px;
		padding-left: 5px;
	}
	#guest {
		position: absolute;
		font-size: 25px;
		text-align: center;
		width: 300px;
		height: 40px;
		border-radius: 5px;
		border: none;
		top: 580px;
		left: 871px;
		cursor:pointer;
	}
	#submit {
		position: absolute;
		font-size: 20px;
		text-align: center;
		width: 80px;
		height: 30px;
		border-radius: 5px;
		border: none;
		top: 63px;
		left: 1180px;
		cursor:pointer;
	}
	#error {
		position: absolute;
		font-size: 15px;
		color: red;
		top: 25px;
		left: 1180px;
	}
	#form {
		position: absolute;
		width: 35%;
		height: 65%;
		top: 20%;
		left: 850px;
		border: 1px solid black;
		border-radius: 10px;
	}
	#slogan {
		position: absolute;
		top: -20px;
		left: 20px;
		font-size: 40px;
	}
	#account {
		position: absolute;
		font-size: 25px;
		top: 80px;
		left: 20px;
	}
	#newname {
		position: absolute;
		color: black;
		font-size: 20px;
		height: 25px;
		width: 300px;
		top: 140px;
		left: 20px;
		padding-left: 5px;
	}
	#code {
		position: absolute;
		font-size: 25px;
		top: 160px;
		left: 20px;
	}
	#newword {
		position: absolute;
		color: black;
		font-size: 20px;
		height: 25px;
		width: 300px;
		top: 220px;
		left: 20px;
		padding-left: 5px;
	}
	#confirm {
		position: absolute;
		font-size: 25px;
		top: 240px;
		left: 20px;
	}
	#again {
		position: absolute;
		color: black;
		font-size: 20px;
		height: 25px;
		width: 300px;
		top: 300px;
		left: 20px;
		padding-left: 5px;
	}
	#create {
		position: absolute;
		font-size: 25px;
		text-align: center;
		width: 300px;
		height: 40px;
		border-radius: 5px;
		border: none;
		top: 370px;
		left: 20px;
	}
	#fault {
		position: absolute;
		font-size: 15px;
		color: red;
		top: 340px;
		left: 20px;
	}
	#intro {
		position: absolute;
		font-size: 40px;
		top: 200px;
		left: 220px;
	}
	#subtitle {
		position: absolute;
		font-size: 20px;
		top: 540px;
		left: 260px;
	}
	#main {
		position: absolute;
		font-size: 60px;
		top: 330px;
		left: 380px;
	}
	</style>
	<script>
		/*var socket;
		function connectToServer() {
			socket = new WebSocket("ws://localhost:8080/GroupProject/Server");
			socket.onopen = function(event) {
				
			}
			socket.onclose = function(event) {
				
			}
		}*/
		var xhttp;
		function validate() {
			xhttp = new XMLHttpRequest();
			xhttp.open("GET","Validate?username=" + document.login.username.value + "&" +
					                  "password=" + document.login.password.value, false);
			xhttp.send();
			if(xhttp.responseText.trim().length > 0) {
				document.getElementById("error").innerHTML = xhttp.responseText;
				return false;
			}
			else {
				return true;
			}
		}
		function createnew() {
			xhttp = new XMLHttpRequest();
			xhttp.open("GET","Register?username=" + document.register.namenew.value + "&" +
					                  "password=" + document.register.wordnew.value + "&" +
					                  "confirm=" + document.register.confirm.value, false);
			xhttp.send();
			if(xhttp.responseText.trim().length > 0) {
				document.getElementById("fault").innerHTML = xhttp.responseText;
				return false;
			}
			else {
				return true;
			}
		}
	</script>
	<body>
		<img src="Images/register_background.png" style="position: absolute; height: 100%; width: 100%; top: 0; left: 0; filter: blur(3px);-webkit-filter: blur(3px);	">
		<img src="Images/Black Vignette.png" style="position:absolute; top: 0; left: 0; width: 100%; height: 100%; opacity: 0.6;">
		<div id="topbar">
			<input type="button" id="return" value="CodeRacer" onclick="location.href = 'home.jsp?'">
		</div>
		
		<form name="login" action="playpage.jsp" method="GET" onsubmit="return validate()">
				<p id="username">Username</p>
					<input type="text" id="name" name="username">
				<p id="password">Password</p>
					<input type="text" id="word" name="password">
				<input type="submit" id="submit" value="Login">
				<div id="error"></div>
		</form>
		
	
		
		<div>
			<p id ="intro">
				Try Some Unique Typing Game. <br/>
				For Example, <br/> 
			</p>
			<p id="main">Coding !</p>
			<p id="subtitle">Made By Andrew, Jiawei, Zhonghang, and Mingxuan</p>
		</div>
		
		<div id="form">
			<form name="register" action="playpage.jsp" method="GET" onsubmit="return createnew()">
				<p id="slogan">One Step To Start</p>
				<p id="account">Username</p>
					<input type="text" id="newname" name="namenew">
				<p id="code">Password</p>
					<input type="text" id="newword" name="wordnew">
				<p id="confirm">Confirm</p>
					<input type="text" id="again" name="confirm">
				<input type="submit" id="create" value="Sign Up">
				<div id="fault"></div>
			</form>
		</div>
			<form action = "playpage.jsp">
		<input type="button" style="cursor:pointer"id="guest" value="Continue As Guest" onclick="location.href = 'playpage.jsp?'">
		</form>
		
	</body>
</html>