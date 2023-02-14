<!-- Nafis -->


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.model.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Facilities Applications</title>

<link rel="shortcut icon" href="/img/favicon.png">
<link rel="stylesheet" href="styles/applied.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://kit.fontawesome.com/b0afced649.js"
	crossorigin="anonymous"></script>
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
	/* margin: 2%; */
	text-align: center;
	/* width: 65%; */
	text-align: center;
}

table {
	text-align: center;
	font-size: 100%;
	font-weight: bold;
	margin-top: 70px;
	margin-left: auto;
	margin-right: auto;
}

.table_header th {
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

.table_row .approve {
	color: rgb(20, 192, 20);
	text-decoration: none;
	font-weight: 900;
	font-size: 15px;
	transition: 0.3s;
}

.table_row .approve:hover {
	letter-spacing: 1px;
	background: rgb(20, 192, 20);
	color: white;
	border-radius: 20px;
	width: 50px;
	padding: 2px;
}

.table_row .reject {
	color: red;
	text-decoration: none;
	font-weight: 900;
	font-size: 15px;
	transition: 0.3s;
}

.table_row .reject:hover {
	letter-spacing: 1px;
	background: red;
	color: white;
	border-radius: 20px;
	width: 50px;
	padding: 2px;
}

table .denyBtn {
	cursor: pointer;
	/*  background-color: rgb(198, 26, 26); */
	font-size: 15px;
	font-family: verdana;
	width: 75px;
	padding: 5px;
	background: transparent;
	border: none;
	font-weight: bold;
	color: rgb(198, 26, 26);
	transition: 0.7s;
}

table .approveBtn {
	cursor: pointer;
	/*     background-color: rgb(25, 123, 25); */
	font-size: 15px;
	font-family: verdana;
	width: 75px;
	padding: 5px;
	background: transparent;
	border: none;
	font-weight: bold;
	color: rgb(25, 123, 25);
	transition: 0.7s;
}

table .approveBtn:hover {
	transform: scale(1.3);
}

table .denyBtn:hover {
	transform: scale(1.3);
}

/* Search Bar */
.box {
	position: relative;
	margin: auto;
	align-items: center;
	display: flex;
	width: 80px;
	justify-content: center;
	margin-top: 100px;
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
</style>
</head>
<body>
	<section id="header"></section>
	<div class="page-name">Facilities Applications</div>


	<div class="box">
		<form name="search">
			<input type="text" class="input" name="txt" id="myInput"
				onmouseout="this.value = ''; this.blur();" onkeyup="myFunction()">
		</form>
		<i class="fas fa-search"></i>
	</div>
	<table class="table" id="myTable">
		<tr class="table_header">
			<th>Application Date</th>
			<th>Request Date</th>
			<th>Request Time</th>
			<th>Name</th>
			<th>Room No</th>
			<th>Facility</th>
			<th>Status</th>
			<th>Action</th>
		</tr>

		<c:forEach items="${facilityList}" var="fl">
			<c:forEach items="${userList}" var="ur">

				<c:if test="${fl.userId eq ur.userId}">
					<tr>
						<td class="table_row">${fl.facilityApplicationDate}</td>
						<td class="table_row">${fl.facilityRequestDate}</td>
						<td class="table_row">${fl.facilityRequestTime}</td>
						<td class="table_row">${ur.userFullName}</td>
						<td class="table_row">${fl.userRoomNo}</td>
						<td class="table_row">${fl.facilityType}</td>
						<c:if test="${fl.facilityApplicationStatus == 'Paid'}">
							<td class="table-row" style="color: Yellow; font-weight: bold">${fl.facilityApplicationStatus}</td>
						</c:if>
						<c:if test="${fl.facilityApplicationStatus == 'Booked'}">
							<td class="table-row" style="color: Orange; font-weight: bold">${fl.facilityApplicationStatus}</td>
						</c:if>
						<c:if test="${fl.facilityApplicationStatus == 'Approved'}">
							<td class="table-row"
								style="color: mediumseagreen; font-weight: bold">${fl.facilityApplicationStatus}</td>
						</c:if>
						<c:if test="${fl.facilityApplicationStatus == 'Denied'}">
							<td class="table-row" style="color: red; font-weight: bold">${fl.facilityApplicationStatus}</td>
						</c:if>
						<td class="table_row">
							<form action="approveFacility" method="post">
								<input type="hidden" value="${fl.userId}" name="userId">
								<button class="approveBtn">Approve</button>
								/
							</form>
							<form action="denyFacility" method="post">
								<input type="hidden" value="${fl.userId}" name="userId">
								<button class="denyBtn">Deny</button>
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</c:forEach>



	</table>
	</div>

	<script>
    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[3];
          if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          }
        }
      }
    
</script>
</body>
</html>
