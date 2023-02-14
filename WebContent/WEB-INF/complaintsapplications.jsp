<!-- Nafis -->

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.model.storage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Complaints</title>

<link rel="shortcut icon" href="/img/favicon.png">
<link rel="stylesheet" href="styles/applied.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
        $(function () {
            $('#header').load('assets/SAM_header.jsp');
        })
       //  call header file and store it in id=header
    </script>


<style>
body {
	background-color: #333333;
}

.flexbox-container {
	display: flex;
	flex-direction: column;
	height: 100%;
	align-items: center;
}

.navigationBar {
	width: 65%;
	height: 40px;
	margin-top: 2%;
	display: flex;
	flex-direction: row;
	align-items: center;
	font-weight: bold;
	color: gold;
}

.logo-picture {
	height: 100px;
	width: 150px;
	margin-right: 10px;
}

.flex1 {
	flex-grow: 7;
}

.flex2 {
	flex-grow: 1;
	text-align: center;
}

.page-name {
	color: gold;
	font-size: 150%;
	font-weight: bold;
	margin: 2%;
	text-align: center;
	/* width: 65%; */
}

hr {
	width: 60%;
	border: 2px solid gold;
	border-radius: 10px;
}

table {
	text-align: center;
	font-size: 100%;
	font-weight: bold;
	margin-top: 5%;
	margin: auto;
}

.table_header td {
	border: 8px solid #333333;
	border-radius: 25px;
	padding: 0.7rem;
	border-spacing: 0.8rem;
	margin: 25%;
	background-color: gold;
}

.table_row {
	border: 5px solid #333333;
	padding: 0.7rem;
	border-spacing: 0.7rem;
	color: white;
}

/* The container for checkbox */
.container {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 22px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
	height: 0;
	width: 0;
}

/* Create a custom checkbox */
.checkmark {
	position: absolute;
	top: 0;
	left: 15px;
	height: 25px;
	width: 25px;
	background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
	left: 9px;
	top: 5px;
	width: 5px;
	height: 10px;
	border: solid white;
	border-width: 0 3px 3px 0;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
}

.approve {
	color: white;
	background: green;
	padding: 5px;
	border-radius: 20px;
	border: none;
	font-size: 20px;
	cursor: pointer;
	transition: 0.7s;
}

.approve:hover {
	transform: scale(1.2);
}
</style>
</head>
<body>
	<section id="header"></section>
	<div class="page-name">Complaints</div>
	<table class="table">
		<tr class="table_header">
			<td>Date</td>
			<td>Mobile No</td>
			<td>Name</td>
			<td>Room No</td>
			<td>Status</td>
			<td>Complaint</td>
			<td>Action</td>
		</tr>

		<c:forEach items="${complaintList}" var="cl">
			<c:forEach items="${userList}" var="ur">

				<c:if test="${cl.userId eq ur.userId}">
					<c:choose>
						<c:when test="${cl.complaintStatus == 'Waiting'}">
							<tr>
								<td class="table_row">${cl.complaintDate}</td>
								<td class="table_row">${ur.userPhoneNo}</td>
								<td class="table_row">${ur.userFullName}</td>
								<td class="table_row">${cl.complainerRoomNo}</td>
								<td class="table-data" style="color: red; font-weight: bold">${cl.complaintStatus}</td>
								<td class="table_row">${cl.complaintDescription}</td>
								<td class="table_row">
									<form action="solveComplaint" method="post">
										<input type="hidden" value="${cl.userId}" name="userId">
										<button class="approve">Solve</button>
									</form>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
		</c:forEach>



	</table>
	</div>
</body>
</html>
