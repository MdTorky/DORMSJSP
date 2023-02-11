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
      $(function () {
        $("#header").load("assets/SAM_header.jsp");
      });
      //  call header file and store it in id=header
    </script>

<link rel="shortcut icon" href="/img/favicon.png" />

<title>Review Check-In Applications</title>
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
/* .navigationBar {
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
      
      .dropbtn {
        color: gold;
        padding: 4px;
        font-size: 130%;
        border: none;
        background-color: #333333;
      }

      .dropdown {
        position: relative;
        display: inline-block;
      }

      .dropdown-content {
        display: none;
        position: absolute;
        background-color: transparent;
        min-width: 300px;
        box-shadow: 0px 8px 16px 0px rgba(58, 58, 58, 0.2);
        z-index: 1;
        left: 50%;
        right: auto;
        text-align: center;
        transform: translate(-50%, 0);
        line-height: 40px;
      }

      .dropdown-content a {
        color: black;
        text-decoration: none;
        display: block;
        padding: 2px;
      }

      .dropdown-content a:hover {
        background-color: gold;
        color: black;
        font-weight: bold;
        font-size: 130%;
        border-radius: 5px;
        padding: 2px;
      }

      .dropdown:hover .dropdown-content {
        display: block;
        padding: 2px;
      }

      .dropdown:hover .dropbtn {
        background-color: gold;
        color: black;
        font-weight: bold;
        font-size: 130%;
        border-radius: 5px;
        padding: 2px;
      } */
.approve-reject {
	text-decoration: none;
	color: gold;
	font-weight: bold;
	font-size: 130%;
	padding: 2px;
}

.approve-reject:hover {
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

.body_hr {
	width: 25%;
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
		<div class="page-name">Check-In Applications</div>




		<c:choose>

			<c:when test="${checkInApplications.size() > 0}">
				<table class="table">
					<tr class="table_header">
						<td>Application Date</td>
						<td>Name</td>
						<td>Nationality</td>
						<td>Passport No</td>
						<td>Phone No</td>
						<td>Check-In Date</td>
						<td>Application Status</td>
						<td>Action</td>
					</tr>


					<c:forEach items="${checkInApplications}" var="application">

						<c:if
							test="${!application.checkInApplicationStatus.equalsIgnoreCase('approved')}">
							<tr>
								<td class="table_row">${application.checkInApplicationDate}</td>

								<c:forEach items="${applicants}" var="applicant">

									<c:if test="${application.userId == applicant.userId}">
										<td class="table_row">${applicant.userFullName}</td>
										<td class="table_row">${applicant.userNationality}</td>
										<td class="table_row">${applicant.userPassportNo}</td>
										<td class="table_row">${applicant.userPhoneNo}</td>
									</c:if>

								</c:forEach>

								<td class="table_row">${application.userCheckInDate}</td>
								<td class="table_row">${application.checkInApplicationStatus}</td>
								<td class="table_row"><a class="approve-reject" href="">Approve</a>
									/ <a class="approve-reject" href="">Reject</a></td>
							</tr>
						</c:if>

					</c:forEach>

				</table>
			</c:when>

			<c:otherwise>
				<h1>There is No Applications</h1>
			</c:otherwise>

		</c:choose>

    <br/><br/>
    <hr class="body_hr"/>

    <div class="page-name">Check-In Applications History</div>

		<c:if test="${applicationsHistory != 0}">
			<c:choose>

				<c:when test="${checkInApplications.size() > 0}">
					<table class="table">
						<tr class="table_header">
							<td>Application Date</td>
							<td>Name</td>
							<td>Nationality</td>
							<td>Passport No</td>
							<td>Phone No</td>
							<td>Check-In Date</td>
							<td>Application Status</td>
						</tr>


						<c:forEach items="${checkInApplications}" var="application">

							<c:if
								test="${application.checkInApplicationStatus.equalsIgnoreCase('approved')}">
								<tr>
									<td class="table_row">${application.checkInApplicationDate}</td>

									<c:forEach items="${applicants}" var="applicant">

										<c:if test="${application.userId == applicant.userId}">
											<td class="table_row">${applicant.userFullName}</td>
											<td class="table_row">${applicant.userNationality}</td>
											<td class="table_row">${applicant.userPassportNo}</td>
											<td class="table_row">${applicant.userPhoneNo}</td>
										</c:if>

									</c:forEach>

									<td class="table_row">${application.userCheckInDate}</td>
									<td class="table_row">${application.checkInApplicationStatus}</td>
								</tr>
							</c:if>

						</c:forEach>

					</table>
				</c:when>

        <c:otherwise>
				  <h1>There is No history</h1>
			  </c:otherwise>

			</c:choose>
		</c:if>

	</div>
</body>
</html>
