<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- <link rel="stylesheet" href="styles/applied.css" /> -->
<link rel="canonical" href="http://fontawesome.com/icons/cart-shopping" />
<script src="https://kit.fontawesome.com/b0afced649.js"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="shortcut icon" href="/img/favicon.png" />
<!-- for including header files -->


<link rel="shortcut icon" href="/img/favicon.png" />

<title>Room Inspection Form</title>
<style>
h1, h2 {
	color: gold;
	font-family: verdana;
	text-align: center;
}

h1 {
	font-weight: 800;
	font-size: 50px;
}

h3, h4 {
	color: white;
	font-family: verdana;
	text-align: center;
}

#main_container {
	padding: 20px;
}

button {
	display: block;
	width: 300px;
	height: 50px;
	line-height: 46px;
	text-decoration: none;
	text-align: center;
	border-radius: 50px;
	border: 2px solid gold;
	color: gold;
	font-size: 20px;
	font-family: verdana;
	position: relative;
	overflow: hidden;
	background: transparent;
	text-transform: uppercase;
	transition: all 0.35s;
	cursor: pointer;
	margin-top: 20px;
	margin: auto;
}

button:before, button:after {
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	top: -100%;
	left: 0;
	background: gold;
	z-index: -1;
	transition: all 0.35s;
}

button:before {
	opacity: 0.5;
}

button:after {
	transition-delay: 0.2s;
}

button:hover {
	color: #333333;
}

button:hover:before, button:hover:after {
	top: 0;
}

#login {
	padding: 15px;
	display: block;
	justify-content: center;
	text-align: center
}

#button:hover {
	border: 3px solid #333333;
}

/* input[type="radio"] {
	margin-right: 10px;

} */
label {
	color: white;
	font-family: verdana;
	margin-left: 10px;
	margin-right: 10px
}

.radio_buttons {
	margin-left: 20px;
}

//
from

 

//applied




@font-face {
	font-family: AscDesc;
	src: url(sansation_light.woff);
}

body {
	margin-top: 1%;
	padding: 0;
	min-height: 7vh;
	font-family: 'Jost', sans-serif;
	background: #333333;
}

/* ScrollBar */
*::-webkit-scrollbar {
	width: 10px;
	border-radius: 20px
}

*::-webkit-scrollbar-track {
	background-color: transparent;
	border-radius: 20px
}

*::-webkit-scrollbar-thumb {
	background: #ffd700;
	border-radius: 20px
}

/* Navigation Bar */
#header nav {
	padding: 5px 300px;
	display: flex;
	align-items: center;
	font-family: verdana;
	position: sticky;
	z-index: 1;
}

#header nav .effect1 {
	position: relative;
	padding: 0;
	overflow: hidden;
	transition: transform 0.5s;
	display: block;
	color: gold;
}

#header nav .effect2 {
	position: relative;
	padding: 0;
	overflow: hidden;
	transition: transform 0.5s;
	display: block;
	width: 90px;
	color: rgb(255, 255, 255);
}

#header nav .effect1::after {
	content: attr(data-after);
	display: inline-block;
	transform: translateY(100%);
	position: absolute;
	left: 0;
	transition: inherit;
}

#header nav .effect1>span {
	display: inline-block;
	transform: translateY(0%);
	transition: inherit;
}

#header nav .effect1:hover>span {
	transform: translateY(-100%);
}

#header nav .effect1:hover::after {
	transform: translateY(0%);
}

#header .logo {
	flex: 1;
	white-space: nowrap;
	overflow-x: auto;
}

#header .logo a {
	display: flex;
	align-items: center;
	font-size: 20px;
}

#header .logo a:hover {
	color: gold;
}

#header .logo img {
	width: 150px;
	margin-right: 10px;
	/* filter: invert(73%) sepia(88%) saturate(524%) hue-rotate(358deg) brightness(101%) contrast(107%);    */
}

#header .menu {
	display: flex;
	align-items: center;
	list-style: none;
	gap: 50px;
}

#header .menu li {
	padding: 15px 10px;
	font-size: 20px;
}

#header .menu .dropdown {
	position: relative;
	display: inline-block;
	transition: 0.2s;
	z-index: 1;
}

#header .menu .dropdown-content {
	display: none;
	position: absolute;
	background-color: gold;
	min-width: 160px;
	border-radius: 20px;
	top: 50px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	transition: 0.2s;
	text-align: center;
}

#header .menu .dropdown-content a {
	color: #333333;
	padding: 12px 16px;
	text-decoration: none;
	border-radius: 10px;
	display: block;
	transition: 0.5s;
	z-index: 1;
	/* border: 1px solid #333333; */
}

#header .menu .dropdown-content a:hover {
	background-color: #333333;
	border-radius: 10px;
	color: gold;
	z-index: 1;
}

#header .menu .dropdown:hover .dropdown-content {
	display: block;
	border-radius: 10px;
	z-index: 1;
}

#header .menu .dropdown:hover .dropbtn {
	background-color: #3e8e41;
	border-radius: 10px;
	z-index: 1;
}

.box {
	position: relative;
	margin: auto;
	align-items: center;
	display: flex;
	width: 80px;
	justify-content: center;
	margin-top: 20px;
	margin-bottom: 50px;
}

.input {
	padding: 10px;
	width: 80px;
	height: 80px;
	background: none;
	border: 4px solid gold;
	border-radius: 50px;
	box-sizing: border-box;
	font-family: verdana;
	font-size: 26px;
	color: gold;
	outline: none;
	transition: .5s;
	margin: auto;
}

.box:hover input {
	width: 350px;
	background: #333333;
	border-radius: 10px;
}

.box i {
	position: absolute;
	top: 50%;
	right: 15px;
	transform: translate(-50%, -50%);
	font-size: 26px;
	color: gold;
	transition: .2s;
	left: 40px;
	align-items: center;
	text-align: center;
}

.box:hover i {
	opacity: 0;
	z-index: -1;
}
//
</style>
</head>
<body>

	<%-- section from sam header --%>
	<section id="header">
		<nav>
			<div class="logo">
				<a href="managerHome"><img src="img/logo2.png"></a>

			</div>
			<ul class="menu">
				<div class="dropdown">
					<li><a href="#manage" class="effect1" data-after="Manage"><span>Manage</span></a>
						<div class="dropdown-content">
							<a href="managerCheckInApplications">Accommodation
								Applications</a> <a href="managerCheckOutApplications">Check-out
								Applications</a> <a href="getFacilities">Facilities</a> <a
								href="getParcelUser">Parcels</a> <a href="getStorage">Storage</a>
							<a href="getComplaints">Complaints</a>
						</div></li>
				</div>
				<div class="dropdown">
					<li><a href="#view" class="effect1" data-after="View"><span>View</span></a>
						<div class="dropdown-content">
							<a href="accommodationReport">Reports</a> <a
								href="managerProfile">Profile</a>
						</div></li>
				</div>
				<li><a href="home.jsp" class="effect1 effect2"
					data-after="Log-out"><span>Log-out</span></a></li>
				<!-- <li><a href="#contact" style="color:gold; margin-right: 30px;"><span><i class="fa-solid fa-user"></i></span></a></li> -->
			</ul>
		</nav>
	</section>
	<%-- // --%>

	<div id="main_container">
		<form action="inspect" method="post">
			<h1>Room Inspection Checklist</h1>


			<h4 style="color: red;">* Yes: Damaged</h4>
			<h4 style="color: green;">* No: Not Damaged</h4>



			<div id="login">
				<h3>1. Bed Frame</h3>
				<input type="radio" class="radio_buttons" name="bed_frame"
					value="150"> <label for="radio_buttons">Yes</label> <input
					type="radio" class="radio_buttons" name="bed_frame" value="0">
				<label for="radio_buttons">No</label>
			</div>
			<div id="login">
				<h3>2. Table</h3>
				<input type="radio" class="radio_buttons" name="table" value="50">
				<label for="radio_buttons">Yes</label> <input type="radio"
					class="radio_buttons" name="table" value="0"> <label
					for="radio_buttons">No</label>
			</div>

			<div id="login">
				<h3>3. Chair</h3>
				<input type="radio" class="radio_buttons" name="chair" value="35">
				<label for="radio_buttons">Yes</label> <input type="radio"
					class="radio_buttons" name="chair" value="0"> <label
					for="radio_buttons">No</label>
			</div>

			<div id="login">
				<h3>4. Wardrobe</h3>
				<input type="radio" class="radio_buttons" name="wardrobe"
					value="125"> <label for="radio_buttons">Yes</label> <input
					type="radio" class="radio_buttons" name="wardrobe" value="0">
				<label for="radio_buttons">No</label>
			</div>

			<div id="login">
				<h3>5. Door</h3>
				<input type="radio" class="radio_buttons" name="door" value="75">
				<label for="radio_buttons">Yes</label> <input type="radio"
					class="radio_buttons" name="door" value="0"> <label
					for="radio_buttons">No</label>
			</div>

			<div id="login">
				<h3>6. Windows</h3>
				<input type="radio" class="radio_buttons" name="windows" value="90">
				<label for="radio_buttons">Yes</label> <input type="radio"
					class="radio_buttons" name="windows" value="0"> <label
					for="radio_buttons">No</label>
			</div>



			<div id="button">
				<button type="submit">Done</button>
			</div>

			<div id="login">
				<input type="hidden" name="checkOutApplicationId"
					value="${checkOutApplicationId}" />
			</div>

		</form>
	</div>


</body>
</html>