<!-- Nafis -->

<!DOCTYPE html>
<html>

<head>
<title>Complaint Applications</title>

<link rel="stylesheet" href="styles/style2.css">
<link rel="shortcut icon" href="/img/favicon.png">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(function() {
		$('#header').load('assets/header.jsp');
	})
	//  call header file and store it in id=header
</script>

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

#main_container {
	padding: 5px;
}

.input_field {
	display: flex;
	padding: 10px;
	width: 300px;
	border-radius: 15px;
}

#button{
	margin-top:30px;
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
	transition: all .35s;
	cursor: pointer;
	margin-top: 30px;
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
	transition: all .35s;
}

button:before {
	opacity: .5;
}

button:after {
	transition-delay: .2s;
}

button:hover {
	color: #333333;
}

button:hover:before, button:hover:after {
	top: 0;
}


#top_side, #middle_side, #bottom_side {
margin-left: 40px;
	padding: 20px;
	display: flex;
	justify-content: center;
}

input[type="text"]:hover, input[type="number"], input[type="text"],
	input[type="date"] {
	border: 1px solid black;
	margin: 25px;
}



label, h3 {
	color: gold;
	font-family: verdana;
	/* text-align: center; */
}

.arrange {
	display: flex;
}

.arrange #left {
	margin-left: 50px;
	text-align: center;
}

.arrange #tarea {
	margin-left: 200px;
	justify-content: center;
	text-align: center;
	
}

textarea {
	padding: 10px;
	border-radius: 20px;
}

::placeholder {
	padding: 20px;
	font-weight: bold;
	text-align: center;
	color: #333333;
}

input:read-only {
  background-color: #E1D9D1;
}
</style>
</head>

<body>
	
	<jsp:useBean id="userObj" scope="session" class="com.model.user"></jsp:useBean>
	
	<div id="header"></div>

	<div id="main_container">
		<h1>Complaint Form</h1>
		<form action="addComplaint" method="post">

			<div class="arrange"
				style="align-items: center; margin: auto; justify-content: center; display: flex;">
				<div id="left">

					<div id="fname">
						<h3>Name</h3>
						<input type="text" name="fname"
							value="<jsp:getProperty property="userFullName" name="userObj"/>"
							readonly class="input_field">
					</div>

					<div id="room_no">
						<h3>Room Number</h3>
						<input type="text" name="roomNo" class="input_field">
					</div>

					<div id="mnumber">
						<h3>Mobile</h3>
						<input type="text" name="mnumber"
							value="<jsp:getProperty property="userPhoneNo" name="userObj"/>"
							readonly class="input_field">
					</div>

				</div>

				<div id="tarea">
					<h3>Complaint</h3>
					<textarea cols="60" rows="20" name="complaint"
						placeholder="Write your complaint here"></textarea>
				</div>

			</div>

			<div id="button">
				<button id="submit">Submit</button>
			</div>

		</form>

	</div>

</body>

</html>