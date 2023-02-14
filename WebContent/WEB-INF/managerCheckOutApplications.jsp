<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	$(function() {
		$("#header").load("assets/SAM_header.jsp");
	});
	//  call header file and store it in id=header
</script>
<title>Review Check-Out Applications</title>
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

.inspect-approve-link {
	text-decoration: none;
	color: gold;
	font-weight: bold;
	font-size: 130%;
	padding: 2px;
	background-color: transparent;
	border: 0;
}

.inspect-approve-link:hover {
	background-color: gold;
	color: black;
	font-weight: bold;
	font-size: 130%;
	border-radius: 5px;
	padding: 2px;
}

.page-name {
	color: gold;
	font-size: 150%;
	font-weight: bold;
	margin: 2%;
	text-align: center;
	width: 65%;
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
</style>
</head>
<body>
	<section id="header"></section>
	<div class="flexbox-container">

		<hr />
		<div class="page-name">Check-Out Applications</div>

		<c:choose>

			<c:when test="${checkOutApplications.size() > 0}">
				<table class="table">
					<tr class="table_header">
						<td>Application Date</td>
						<td>Name</td>
						<td>Passport No</td>
						<td>Phone No</td>
						<td>Check-Out Date</td>
						<td>Check-Out Time</td>
						<td>Application Status</td>
						<td>Action</td>
					</tr>


					<c:forEach items="${checkOutApplications}" var="application">

						<c:if
							test="${!application.checkOutApplicationStatus.equalsIgnoreCase('approved')}">
							<tr>
								<td class="table_row">${application.checkOutApplicationDate}</td>

								<c:forEach items="${applicants}" var="applicant">

									<c:if test="${application.userId == applicant.userId}">
										<td class="table_row">${applicant.userFullName}</td>
										<td class="table_row">${applicant.userPassportNo}</td>
										<td class="table_row">${applicant.userPhoneNo}</td>
									</c:if>

								</c:forEach>

								<td class="table_row">${application.userCheckOutDate}</td>
								<td class="table_row">${application.userCheckOutTime}</td>
								<td class="table_row">${application.checkOutApplicationStatus}</td>
								<td class="table_row">
								<form action="roomInspect" method="post">
									<input type="hidden" name="checkOutApplicationId" value="${application.checkOutApplicationId}" />
									<button type="submit" class="inspect-approve-link">Inspect</button>
								</form>
								/ 
								<form action="roomApproveCheckOut" method="post">
									<input type="hidden" name="checkOutApplicationId" value="${application.checkOutApplicationId}" />
									<button type="submit" class="inspect-approve-link">Approve Check-out</button>
								</form>
								
							</tr>
						</c:if>

					</c:forEach>

				</table>
			</c:when>

			<c:otherwise>
				<h1>There is No Applications</h1>
			</c:otherwise>

		</c:choose>


	</div>
</body>
</html>
