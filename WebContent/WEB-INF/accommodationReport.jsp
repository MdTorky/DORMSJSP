<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>Accommodation Report</title>
<style>
body {
	background-color: #333333;
}

.body-container {
	display: flex;
	flex-direction: column;
	height: 100%;
	align-items: center;
}
/* .navigation-bar-container {
          width: 65%;
          height: 40px;
          margin-top: 2%;
          display: flex;
          flex-direction: row;
          align-items: center;
          font-weight: bold;
          color: gold;
        }
        .navigation-bar-logo {
          flex-grow: 7;
        }
        .logo-picture {
          height: 100px;
          width: 150px;
          margin-right: 10px;
        }
        .navigation-bar-link {
          flex-grow: 1;
          text-align: center;
        }
        .dropdown {
          position: relative;
          display: inline-block;
        }
        .dropbtn {
          color: gold;
          padding: 4px;
          font-size: 130%;
          border: none;
          background-color: #333333;
        }
        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #333333;
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
          border-radius: 10px;
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
          padding: 5px;
        } */
/* a {
          text-decoration: none;
          color: gold;
          font-weight: bold;
          font-size: 130%;
          padding: 5px;
        }
        a:hover {
          background-color: gold;
          color: black;
          font-weight: bold;
          font-size: 130%;
          border-radius: 5px;
          padding: 5px;
        } */
hr {
	width: 60%;
	border: 2px solid gold;
	border-radius: 10px;
}

.body-hr {
	width: 25%;
	border: 2px solid gold;
	border-radius: 10px;
}

.page-name-container {
	color: gold;
	font-size: 150%;
	font-weight: bold;
	margin: 2%;
	text-align: center;
	width: 65%;
}

.building-summary-container {
	display: flex;
	flex-direction: column;
	text-align: center;
	width: 65%;
	margin: 2%;
	align-items: center;
}

.all-building-summary {
	display: flex;
	flex-direction: column;
	width: 65%;
	margin: 3%;
	align-items: center;
	font-size: 150%;
	font-weight: bold;
	color: black;
}

.all-building-summary-header {
	color: gold;
	font-size: 130%;
}

.one-building-summary-header {
	color: gold;
	font-size: 130%;
}

.full-available-room-container {
	display: flex;
	flex-direction: row;
	width: 65%;
	justify-content: center;
	margin: 2%;
}

.buildings-details-container {
	width: 65%;
	margin: 2%;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	font-size: 130%;
	font-weight: bold;
	color: black;
}

.one-building-summary {
	margin: 2%;
}

.building-full-available-container {
	display: flex;
	justify-content: center;
}

.building-full-available {
	margin: 5%;
	padding: 10px;
	color: white;
}

.building-container {
	display: flex;
	flex-direction: column;
	width: 40%;
	margin: 2%;
	justify-content: center;
	text-align: center;
}

.building-rooms-name {
	margin: 1%;
	font-size: 150%;
	font-weight: bold;
	color: gold;
}

.building-rooms-status {
	margin: 1%;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.full-available {
	margin: 3%;
	padding: 10px;
	color: white;
}

table {
	text-align: center;
	font-size: 100%;
	font-weight: bold;
}

.table_header td {
	border: 5px solid #333333;
	border-radius: 25px;
	padding: 0.3rem;
	border-spacing: 0.5rem;
	margin: 2%;
	background-color: gold;
}

.table_row {
	border: 5px solid #333333;
	padding: 0.3rem;
	border-spacing: 0.5rem;
	color: white;
}

.table_row_full {
	border: 5px solid #333333;
	padding: 0.3rem;
	border-spacing: 0.5rem;
	color: black;
	background-color: rgb(168, 35, 35);
	border-radius: 25px;
}

.table_row_available {
	border: 5px solid #333333;
	border-radius: 25px;
	padding: 0.3rem;
	border-spacing: 0.5rem;
	color: black;
	background-color: rgb(0, 107, 0);
}

.available_box {
  width: 80px;
  height: 25px;
  padding: 15px;
  border-radius: 25px;
  background-color: rgb(0, 107, 0);
  text-align: center;
}
.full_box {
  width: 80px;
  height: 25px;
  padding: 15px;
  border-radius: 25px;
  background-color: rgb(168, 35, 35);
  text-align: center;
}
/* width */
::-webkit-scrollbar {
	width: 4px;
}

/* Track */
::-webkit-scrollbar-track {
	background: #333333;
	border-radius: 20px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	background: gold;
	border-radius: 20px;
}
</style>
</head>
<body>
	<!-- Header Section -->
	<section id="header"></section>
	<div class="body-container">


		<hr />
		<div class="page-name-container">Accommodation Report</div>

		<div class="building-summary-container">
			<div class="all-building-summary">
				<div class="all-building-summary-header">
					${totalRooms} <br /> Total Rooms<br />
				</div>
				<div class="full-available-room-container">
					<div class="full-available">
						${totalFull}<br />Full
					</div>
					<br />
					<div class="full-available">
						${totalAvailable}<br />Available
					</div>
				</div>
			</div>
			<div class="buildings-details-container">
				<div class="one-building-summary">
					<div class="one-building-summary-header">ALPHA</div>
					<div class="building-full-available-container">
						<div class="building-full-available">
							${alphaFull}<br />Full
						</div>
						<br />
						<div class="building-full-available">
							${alphaAvailable}<br />Available
						</div>
					</div>
				</div>
				<div class="one-building-summary">
					<div class="one-building-summary-header">BETA</div>
					<div class="building-full-available-container">
						<div class="building-full-available">
							${betaFull}<br />Full
						</div>
						<br />
						<div class="building-full-available">
							${betaAvailable}<br />Available
						</div>
					</div>
				</div>
				<div class="one-building-summary">
					<div class="one-building-summary-header">DELTA</div>
					<div class="building-full-available-container">
						<div class="building-full-available">
							${deltaFull}<br />Full
						</div>
						<br />
						<div class="building-full-available">
							${deltaAvailable}<br />Available
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="body-hr" />
		<div class="building-container">
			<div class="building-rooms-name">ALPHA</div>

			<div class="building-rooms-status">
				<table class="table">
					<tr class="table_header">
						<td colspan="2">LEVEL 1</td>
						<td colspan="2">LEVEL 2</td>
						<td colspan="2">LEVEL 3</td>
						<td colspan="2">LEVEL 4</td>
						<td colspan="2">LEVEL 5</td>
					</tr>

					<c:set var="counter" value="0" />

					<c:forEach var="outrCounter" begin="0" end="9" step="2">
						<c:set var="counter" value="${outrCounter}" />
						<tr>
							<c:if
								test="${rooms.get(counter).roomBlockName.equalsIgnoreCase('alpha') && (counter < 50) }">
								<c:forEach var="innerCounter" begin="1" end="5" step="1">
									<td class="${rooms.get(counter).roomStatus.equalsIgnoreCase("empty") ? "table_row_available": "table_row_full"}">Room
										${rooms.get(counter).roomNo}</td>
									<td class="${rooms.get(counter+1).roomStatus.equalsIgnoreCase("empty") ? "table_row_available": "table_row_full"}">Room
										${rooms.get(counter+1).roomNo}</td>
									<c:set var="counter" value="${counter+10}" />
								</c:forEach>
							</c:if>
						</tr>
					</c:forEach>



				</table>
			</div>
		</div>
		<hr class="body-hr" />
		<div class="building-container">
			<div class="building-rooms-name">BETA</div>
			<div class="building-rooms-status">
				<div class="building-rooms-status">
					<table class="table">
						<tr class="table_header">
							<td colspan="2">LEVEL 1</td>
							<td colspan="2">LEVEL 2</td>
							<td colspan="2">LEVEL 3</td>
							<td colspan="2">LEVEL 4</td>
							<td colspan="2">LEVEL 5</td>
						</tr>
						<c:set var="counter" value="50" />

						<c:forEach var="outrCounter" begin="50" end="59" step="2">
							<c:set var="counter" value="${outrCounter}" />
							<tr>
								<c:if
									test="${rooms.get(counter).roomBlockName.equalsIgnoreCase('beta') && (counter < 100) }">
									<c:forEach var="innerCounter" begin="1" end="5" step="1">
										<td class="${rooms.get(counter).roomStatus.equalsIgnoreCase("empty") ? "table_row_available": "table_row_full"}">Room
											${rooms.get(counter).roomNo}</td>
										<td
											class="${rooms.get(counter+1).roomStatus.equalsIgnoreCase("empty") ? "table_row_available": "table_row_full"}">Room
											${rooms.get(counter+1).roomNo}</td>
										<c:set var="counter" value="${counter+10}" />
									</c:forEach>
								</c:if>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>
		<hr class="body-hr" />
		<div class="building-container">
			<div class="building-rooms-name">DELTA</div>
			<div class="building-rooms-status">
				<div class="building-rooms-status">
					<table class="table">
						<tr class="table_header">
							<td colspan="2">LEVEL 1</td>
							<td colspan="2">LEVEL 2</td>
							<td colspan="2">LEVEL 3</td>
							<td colspan="2">LEVEL 4</td>
							<td colspan="2">LEVEL 5</td>
						</tr>
						<c:set var="counter" value="100" />

						<c:forEach var="outrCounter" begin="100" end="109" step="2">
							<c:set var="counter" value="${outrCounter}" />
							<tr>
								<c:if
									test="${rooms.get(counter).roomBlockName.equalsIgnoreCase('delta') && (counter < 150) }">
									<c:forEach var="innerCounter" begin="1" end="5" step="1">
										<td class="${rooms.get(counter).roomStatus.equalsIgnoreCase("empty") ? "table_row_available": "table_row_full"}">Room
											${rooms.get(counter).roomNo}</td>
										<td
											class="${rooms.get(counter+1).roomStatus.equalsIgnoreCase("empty") ? "table_row_available": "table_row_full"}">Room
											${rooms.get(counter+1).roomNo}</td>
										<c:set var="counter" value="${counter+10}" />
									</c:forEach>
								</c:if>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>
		<hr class="body-hr" />
		<h3 class="available_box">Available</h3>
		<h3 class="full_box">Full</h3>
	</div>
</body>
</html>
