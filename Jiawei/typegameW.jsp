<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Vector" %>
<html>
	<%
		//Vector<String> paper = (Vector<String>)session.getAttribute("paper");	
		Vector<String> paper = new Vector<String>();
		paper.add("I<> COdE1 CODE13{};");
		paper.add("JAva2 COdE2 last");
		int totalNum = 6;
		int totalLine = paper.size();
		int currentLine = 0;
	%>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Typing game</title>
		<link href='https://fonts.googleapis.com/css?family=Raleway:400,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="typinggame2.css">
		<link rel="stylesheet" href="main.css">
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
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
		var socket;
		function connectToServer() {
			socket = new WebSocket("ws://localhost:8080/GroupProject/Server");
			socket.onopen = function(event) {	
			}
			socket.onmessage = function(event){
				
			}
			socket.onclose = function(event) {
			}
		}
	</script>
	<%
		String username = request.getParameter("username");
		if(username == null) {
			username = "guest";
		}
		Vector<String> list = (Vector<String>)session.getAttribute("names");
		if(list == null) list = new Vector<String>();
		list.add(username);
		int num = list.size()-1;
		session.setAttribute("names",list);
	%>
	<body onload="connectToServer()">
		<div id="bg"></div>

		<div class="sidenav">
  			<h2 id="0">Player 1:</h2>
  			<h2 id="1">Player 2:</h2>
  			<h2 id="2">Player 3:</h2>
  			<h2 id="3">Player 4:</h2>
		</div>
		
		<div id="codeimage">
			 <img src="Images/cr.gif" onclick="location.href = 'home.jsp'">
		</div>
		
		<%
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			System.out.println("<script>document.getElementById(\""+i+"\").innerHTML = \"Player " + (i+1) + ":" + list.get(i) + "\""+"</script>");
			out.println("<script>document.getElementById(\""+i+"\").innerHTML = \"Player " + (i+1) + ":" + list.get(i) + "\"</script>");
		}
		%>
		
		<div id="leftRec"></div>
		
		<div id="rightRec"></div>
		
		
		

		<button>START</button>

		<span class="score">0</span>
		<span class="time">600</span>
		
		<p class="words"></p>

		<div id="racecar"></div>	

		<div id="destination"><img src="Images/usc.jpg"></div>

		<div id="timerid" >0 Second</div>
		    
		<script>
			var seco = 0;
			var stopRet;
			
			function timerStart(){
				stopRet = setInterval("timer()", 1000);
			}
			
			function timer(){
				seco += 1;
				document.getElementById('timerid').innerHTML= seco+' Second';
			}
			function timerStop(){
				window.clearInterval(stopRet);
			}
		</script>
		
		
		
		<script>
			var temp = document.querySelector('.time');
			var button = document.querySelector("button");
			var words = document.querySelector(".words");
			var timerDiv = document.querySelector(".time");
			var scoreDiv = document.querySelector(".score");
			var points = 0;
			var spans;
			var typed;
			var seconds = 600;
			var spark = new Audio("http://k003.kiwi6.com/hotlink/qdpr7bioht/spark.mp3");
			var list = ['hi'];
			var totalWords = <%=totalNum%>;
			
			function initiateList() {
				<%
					String[] words ;
					Vector<String> vecTemp = new Vector<String>();
					for (int i=0;i<paper.size();i++)
					{
						String line = paper.get(i);
						words = line.split(" ");
						for(int j=0; j<words.length;j++)
						{
							if(words[j].trim()=="")
							{
								System.out.println("qq");
							}else{
								vecTemp.add(words[j]);
							}
						}
					}
					for(int i=0;i<vecTemp.size();i++)
					{
				%>
					list.push('<%=vecTemp.get(i)%>');
				<%
					}
				%>
				list.shift();
			}
			
			function countdown() {
				points = 0;
				var timer = setInterval(function(){
					button.disabled = true;
				seconds--;
				temp.innerHTML = seconds;
				if (seconds === 0 || points==totalWords) {
					alert("Game over! Your score is " + points + "\nAnd you took " + seco + " seconds");
					timerStop();
					scoreDiv.innerHTML = "0";
					words.innerHTML = "";
					button.disabled = false;
					clearInterval(timer);
					seconds = 60;
					timerDiv.innerHTML = "60";
					button.disabled = false;	
				}
				}, 1000);
			}
			
			function setup(index) {
				words.innerHTML = "";
				var wordArray = list[index].split("");
				for (var i = 0; i < wordArray.length; i++) { //building the words with spans around the letters
					var span = document.createElement("span");
					span.classList.add("span");
					span.innerHTML = wordArray[i];
					words.appendChild(span);
				}
				spans = document.querySelectorAll(".span");
			}
		
			button.addEventListener("click", function(e){
				initiateList();
				timerStart();
				countdown();
				setup(0);
				button.disabled = true;	
			});
		
		
			function typing(e) {
				var index = 0;
				if        (e.keyCode == 187 && e.shiftKey){ 
					typed = "+";
				} else if (e.keyCode == 190 && e.shiftKey){ 
					typed = "&gt;";
				} else if (e.keyCode == 219 && e.shiftKey){ 
					typed = "{";
				} else if (e.keyCode == 221 && e.shiftKey){ 
					typed = "}";
				} else if (e.keyCode == 186 && e.shiftKey){ 
					typed = ":";
				} else if (e.keyCode == 188 && e.shiftKey){ 
					typed = "&lt;";
				} else if (e.keyCode == 222 && e.shiftKey){ 
					typed = '"';
				} else if (e.keyCode == 189 && e.shiftKey){ 
					typed = "-";
				} else if (e.keyCode == 56 && e.shiftKey){ 
					typed = "*";
				} else if (e.keyCode == 49 && e.shiftKey){ 
					typed = "!";
				} else if (e.keyCode == 57 && e.shiftKey){ 
					typed = "(";
				} else if (e.keyCode == 48 && e.shiftKey){ 
					typed = ")";
				} else if (e.keyCode == 53 && e.shiftKey){ 
					typed = "%";
				} else if (e.keyCode == 65 && e.shiftKey){ 
					typed = "A";
				} else if (e.keyCode == 66 && e.shiftKey){ 
					typed = "B";
				} else if (e.keyCode == 67 && e.shiftKey){ 
					typed = "C";
				} else if (e.keyCode == 68 && e.shiftKey){ 
					typed = "D";
				} else if (e.keyCode == 69 && e.shiftKey){ 
					typed = "E";
				} else if (e.keyCode == 70 && e.shiftKey){ 
					typed = "F";
				} else if (e.keyCode == 71 && e.shiftKey){ 
					typed = "G";
				} else if (e.keyCode == 72 && e.shiftKey){ 
					typed = "H";
				} else if (e.keyCode == 73 && e.shiftKey){ 
					typed = "I";
				} else if (e.keyCode == 74 && e.shiftKey){ 
					typed = "J";
				} else if (e.keyCode == 75 && e.shiftKey){ 
					typed = "K";
				} else if (e.keyCode == 76 && e.shiftKey){ 
					typed = "L";
				} else if (e.keyCode == 77 && e.shiftKey){ 
					typed = "M";
				} else if (e.keyCode == 78 && e.shiftKey){ 
					typed = "N";
				} else if (e.keyCode == 79 && e.shiftKey){ 
					typed = "O";
				} else if (e.keyCode == 80 && e.shiftKey){ 
					typed = "P";
				} else if (e.keyCode == 81 && e.shiftKey){ 
					typed = "Q";
				} else if (e.keyCode == 82 && e.shiftKey){ 
					typed = "R";
				} else if (e.keyCode == 83 && e.shiftKey){ 
					typed = "S";
				} else if (e.keyCode == 84 && e.shiftKey){ 
					typed = "T";
				} else if (e.keyCode == 85 && e.shiftKey){ 
					typed = "U";
				} else if (e.keyCode == 86 && e.shiftKey){ 
					typed = "V";
				} else if (e.keyCode == 87 && e.shiftKey){ 
					typed = "W";
				} else if (e.keyCode == 88 && e.shiftKey){ 
					typed = "X";
				} else if (e.keyCode == 89 && e.shiftKey){ 
					typed = "Y";
				} else if (e.keyCode == 90 && e.shiftKey){ 
					typed = "Z";
				} else if (e.keyCode == 65){ 
					typed = "a";
				} else if (e.keyCode == 66){ 
					typed = "b";
				} else if (e.keyCode == 67){ 
					typed = "c";
				} else if (e.keyCode == 68){ 
					typed = "d";
				} else if (e.keyCode == 69){ 
					typed = "e";
				} else if (e.keyCode == 70){ 
					typed = "f";
				} else if (e.keyCode == 71){ 
					typed = "g";
				} else if (e.keyCode == 72){ 
					typed = "h";
				} else if (e.keyCode == 73){ 
					typed = "i";
				} else if (e.keyCode == 74){ 
					typed = "j";
				} else if (e.keyCode == 75){ 
					typed = "k";
				} else if (e.keyCode == 76){ 
					typed = "l";
				} else if (e.keyCode == 77){ 
					typed = "m";
				} else if (e.keyCode == 78){ 
					typed = "n";
				} else if (e.keyCode == 79){ 
					typed = "o";
				} else if (e.keyCode == 80){ 
					typed = "p";
				} else if (e.keyCode == 81){ 
					typed = "q";
				} else if (e.keyCode == 82){ 
					typed = "r";
				} else if (e.keyCode == 83){ 
					typed = "s";
				} else if (e.keyCode == 84){ 
					typed = "t";
				} else if (e.keyCode == 85){ 
					typed = "u";
				} else if (e.keyCode == 86){ 
					typed = "v";
				} else if (e.keyCode == 87){ 
					typed = "w";
				} else if (e.keyCode == 88){ 
					typed = "x";
				} else if (e.keyCode == 89){ 
					typed = "y";
				} else if (e.keyCode == 90){ 
					typed = "z";
				} else if (e.keyCode == 187){ 
					typed = "=";
				} else if (e.keyCode == 186){ 
					typed = ";";
				} else if (e.keyCode == 190){ 
					typed = ".";
				} else if (e.keyCode == 188){ 
					typed = ",";
				} else {
					typed = String.fromCharCode(e.which);
				}
				
				for (var i = 0; i < spans.length; i++) {
					if (spans[i].innerHTML == typed) { // if typed letter is the one from the word
						if (spans[i].classList.contains("bg")) { // if it already has class with the bacground color then check the next one
							
							continue;
						} else if (spans[i].classList.contains("bg") == false && spans[i-1] == undefined || spans[i-1].classList.contains("bg") != false ) { // if it dont have class, if it is not first letter or if the letter before it dont have class (this is done to avoid marking the letters who are not in order for being checked, for example if you have two "A"s so to avoid marking both of them if the first one is at the index 0 and second at index 5 for example)
							spans[i].classList.add("bg");
							break;
						}
					}
				}
				var checker = 0;
				for (var j = 0; j < spans.length; j++)
				{ //checking if all the letters are typed
					if (spans[j].className == "span bg") {
						checker++;
					}
					if (checker == spans.length) { // if so, animate the words with animate.css class
	        			spark.pause();
					    spark.currentTime = 0;
	      				spark.play();
						words.classList.add("animated");
						words.classList.add("fadeOut");
						points++; // increment the points
						scoreDiv.innerHTML = points; //add points to the points div
						document.removeEventListener("keyup", typing, false);
						setTimeout(function(){
							words.className = "words"; // restart the classes
							myMove(); //MOVE CAR FORWARD
							setup(points); // give another word
							document.addEventListener("keyup", typing, false);
						}, 400);
					}
	
				}
			}
		
			document.addEventListener("keyup", typing, false);
			
			var move = 1/totalWords*600;
			var currentPos=400;
			function myMove() {
				  var elem = document.getElementById("racecar"); 
				  currentPos += move;
				  elem.style.left = currentPos + 'px'; 
			}
		</script>
	</body>
</html>