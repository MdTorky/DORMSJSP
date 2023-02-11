<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="styles/applied.css" />
<link rel="canonical" href="http://fontawesome.com/icons/cart-shopping" />
<script src="https://kit.fontawesome.com/b0afced649.js"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="shortcut icon" href="/img/favicon.png" />
<!-- for including header files -->
<script>
      $(function () {
        $("#header").load("assets/SAM_header.jsp");
      });
      //  call header file and store it in id=header
    </script>

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

 label{
      color: white;
      font-family: verdana;
      margin-left:10px;
	  margin-right: 10px
}

.radio_buttons{
      margin-left:20px;

}



</style>
</head>
<body>
	<section id="header"></section>

	<div id="main_container">
		<form action="inspect" method="post">
			<h1>Room Inspection Checklist</h1>
			
			
			<h4 style=color:red;>* Yes: Damaged</h4>
			<h4 style=color:green;>* No: Not Damaged</h4>
			
			

			<div id="login">
					<h3>1. Bed Frame</h3>
					<input type="radio" class="radio_buttons" name="bed_frame" value="150">
					<label for="radio_buttons">Yes</label>
					<input type="radio" class="radio_buttons" name="bed_frame" value="0">
					<label for="radio_buttons">No</label>
			</div>
			<div id="login">
					<h3>2. Table</h3>
					<input type="radio" class="radio_buttons" name="table" value="50">
					<label for="radio_buttons">Yes</label>
					<input type="radio" class="radio_buttons" name="table" value="0">
					<label for="radio_buttons">No</label>
			</div>

			<div id="login">
					<h3>3. Chair</h3>
					<input type="radio" class="radio_buttons" name="chair" value="35">
					<label for="radio_buttons">Yes</label>
					<input type="radio" class="radio_buttons" name="chair" value="0">
					<label for="radio_buttons">No</label>
			</div>

			<div id="login">
					<h3>4. Wardrobe</h3>
					<input type="radio" class="radio_buttons" name="wardrobe" value="125">
					<label for="radio_buttons">Yes</label>
					<input type="radio" class="radio_buttons" name="wardrobe" value="0">
					<label for="radio_buttons">No</label>
			</div>

			<div id="login">
					<h3>5. Door</h3>
					<input type="radio" class="radio_buttons" name="door" value="75">
					<label for="radio_buttons">Yes</label>
					<input type="radio" class="radio_buttons" name="door" value="0">
					<label for="radio_buttons">No</label>
			</div>

			<div id="login">
					<h3>6. Windows</h3>
					<input type="radio" class="radio_buttons" name="windows" value="90">
					<label for="radio_buttons">Yes</label>
					<input type="radio" class="radio_buttons" name="windows" value="0">
					<label for="radio_buttons">No</label>
			</div>

			<div id="button">
				<button type="submit">Done</button>
			</div>

		</form>
	</div>


</body>
</html>