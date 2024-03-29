<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html>

<head>
<title>Check out Application</title>
<link rel="shortcut icon" href="/img/favicon.png">
<link rel="stylesheet" href="styles/style2.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
        $(function () {
            $('#header').load('assets/header.jsp');
        })
    </script>

<style>
h1, h2 {
	color: gold;
	font-family: verdana;
	text-align: center;
}

h3 {
	color: white;
	font-family: verdana;
	text-align: center;
}

h1 {
	font-weight: 800;
	font-size: 50px;
}

#main_container {
	padding: 20px;
}

.input_field {
	display: flex;
	padding: 10px;
	width: 300px;
	border-radius: 15px;
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
	margin-top: 10px;
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

#button {
	display: flex;
	justify-content: center;
}

#top_side, #bottom_side {
	padding: 20px;
	display: flex;
	justify-content: center;
}

input[type="text"]:hover, input[type="text"], input[type="date"], input[type="time"]
	{
	border: 1px solid black;
	margin: 25px;
}

#button:hover {
	border: 3px solid #333333;
}
</style>
</head>

<body>

	<%
	LocalDate currentDate = LocalDate.now();
	LocalDate minDate = currentDate.plusMonths(1);
	LocalDate maxDate = currentDate.plusMonths(12);
	session.setAttribute("minDate", minDate);
	session.setAttribute("maxDate", maxDate);
	%>

	<jsp:useBean id="userObj" scope="session" class="com.model.user"></jsp:useBean>
	    <jsp:useBean id="userObj2" scope="session" class="com.model.user"></jsp:useBean>


	<div id="header"></div>

	<form action="checkOutApp" method="post">
		<div id="main_container">
			<h1>Check out Application</h1>

			<div id="top_side">

				<div id="full_name">
					<h3>Full Name</h3>
					<input type="text" class="input_field"
						value="<jsp:getProperty property="userFullName" name="userObj"/>"
						readonly>
				</div>


				<div id="passport_number">
					<h3>Passport Number</h3>
					<input type="text" class="input_field"
						value="<jsp:getProperty property="userPassportNo" name="userObj2"/>"
						readonly>
				</div>

			</div>

			<div id="bottom_side">


				<div id="check_out_date">
					<h3>Check out Date</h3>
					<input type="date" class="input_field" name="check_out_date"
						min="<c:out value = "${minDate}"> </c:out>"
						max="<c:out value = "${maxDate}"> </c:out>">
				</div>

				<div id="check_out_time">
					<h3>Check out Time</h3>
					<input type="time" class="input_field" name="check_out_time"
						min="09:30" max="16:30">
				</div>

			</div>

			<div id="button">
				<button id="submit">Submit</button>
			</div>

			<div id="checkbox"
				style="color: aliceblue; margin-left: 100px; padding-top: 40px;">
				<input type="checkbox" id="terms_conditions" required> I
				agree to the terms and conditions of Dorms Hostel Sdn Bhd
			</div>



		</div>
	</form>

</body>

</html>