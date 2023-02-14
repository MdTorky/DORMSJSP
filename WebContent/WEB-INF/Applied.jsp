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

<title>Applied Applications</title>

<link rel="shortcut icon" href="/img/favicon.png">
<link rel="stylesheet" href="styles/applied.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(function() {
		$('#header').load('assets/header.jsp');
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
	font-size: 140%;
	font-weight: bold;
	margin: 1%;
	/* text-align: center; */
	width: 55%;
	margin-left: 280px;
}

table {
	text-align: center;
	font-size: 100%;
	font-weight: bold;
	border: 1px solid white;
	margin: auto;
	width: 850px;
}

.table_header td {
	border: 1px solid white;
	padding: 0.7rem;
	border-spacing: 0.8rem;
	margin: 25%;
	background-color: white;
}

.table_row {
	border: 1px solid white;
	padding: 0.7rem;
	border-spacing: 0.7rem;
	color: white;
}
</style>
</head>
<body>
	<section id="header"></section>


	</table>
	</div>

	<div class="page-name">Facility Applications</div>
	<table class="table2">
		<tr class="table_header">
			<td>Application Date</td>
			<td>Facility</td>
			<td>Requested Date</td>
			<td>Time Slot</td>
			<td>Room No.</td>
			<td>Status</td>
			<td>Remark</td>
		</tr>

		<c:forEach items="${facilityList}" var="fl">
			<c:forEach items="${userList}" var="ur">
				<tr>
					<td class="table_row">${fl.facilityApplicationDate}</td>
					<td class="table_row">${fl.facilityType}</td>
					<td class="table_row">${fl.facilityRequestDate }</td>
					<td class="table_row">${fl.facilityRequestTime }</td>
					<%-- <td class="table_row">${ur.userRoomNo }</td> --%>
					<td class="table_row">${fl.userRoomNo}</td>
					<c:if test="${fl.facilityApplicationStatus == 'Paid'}">
						<td class="table_row" style="color: Yellow; font-weight: bold">${fl.facilityApplicationStatus}</td>
					</c:if>
					<c:if test="${fl.facilityApplicationStatus == 'Booked'}">
						<td class="table_row" style="color: Orange; font-weight: bold">${fl.facilityApplicationStatus}</td>
					</c:if>
					<c:if test="${fl.facilityApplicationStatus == 'Approved'}">
						<td class="table_row"
							style="color: mediumspringgreen; font-weight: bold">${fl.facilityApplicationStatus}</td>
					</c:if>
					<c:if test="${fl.facilityApplicationStatus == 'Denied'}">
						<td class="table_row" style="color: red; font-weight: bold">${fl.facilityApplicationStatus}</td>
					</c:if>
					<td class="table_row">${fl.facilityApproveRejectRemark}</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
	</div>

	<div class="page-name">Complaints</div>
	<table class="table2">
		<tr class="table_header">
			<td>Application Date</td>
			<td>Room Number</td>
			<td>Complaint Status</td>
			<td>Complaint Description</td>
		</tr>

		<c:forEach items="${complaintList}" var="cl">
			<c:forEach items="${userList}" var="ur">
				<tr>
					<td class="table_row">${cl.complaintDate}</td>
					<%-- <td class="table_row">${ur.userRoomId}</td> --%>
					<td class="table_row">${cl.complainerRoomNo}</td>
					<c:if test="${cl.complaintStatus == 'Waiting'}">
						<td class="table_row" style="color: Yellow; font-weight: bold">${cl.complaintStatus}</td>
					</c:if>
					<c:if test="${cl.complaintStatus == 'Solved'}">
						<td class="table_row"
							style="color: mediumspringgreen; font-weight: bold">${cl.complaintStatus}</td>
					</c:if>
					<td class="table_row">${cl.complaintDescription}</td>

					</td>
				</tr>
			</c:forEach>
		</c:forEach>

	</table>
	</div>
	<div class="page-name">Storage Applications</div>
	<table class="table2">
		<tr class="table_header">
			<td>Box Numbers</td>
			<td>Start Date</td>
			<td>End Date</td>
			<td>Status</td>
			<td>Remark</td>
		</tr>

		<c:forEach items="${storageList}" var="sl">
			<tr>
				<td class="table_row">${sl.storageBoxesNo }</td>
				<td class="table_row">${sl.storageStartDate }</td>
				<td class="table_row">${sl.storageStartEnd }</td>
				<c:if test="${sl.storageStatus== 'Booked'}">
					<td class="table_row" style="color: orange; font-weight: bold">${sl.storageStatus}</td>
				</c:if>
				<c:if test="${sl.storageStatus == 'Approved'}">
					<td class="table_row"
						style="color: mediumspringgreen; font-weight: bold">${sl.storageStatus}</td>
				</c:if>
				<c:if test="${sl.storageStatus == 'Paid'}">
					<td class="table_row" style="color: Yellow; font-weight: bold">${sl.storageStatus}</td>
				</c:if>
				<c:if test="${sl.storageStatus == 'Denied'}">
					<td class="table_row" style="color: red; font-weight: bold">${sl.storageStatus}</td>
				</c:if>
				<td class="table_row">${sl.storageApproveRejectRemark }</td>
			</tr>
		</c:forEach>

	</table>
	</div>

	<div class="page-name">Check-in Applications</div>
		<table class="table2">
		
			<tr class="table_header">
				<td>Application Date</td>
				<td>Check-In Date</td>
				<td>Passport No.</td>
				<td>Status</td>
			</tr>

			<c:forEach items="${checkInList}" var="cil">
				<c:forEach items="${userList}" var="ur">
					<tr>
						<td class="table_row">${cil.checkInApplicationDate}</td>
						<td class="table_row">${cil.userCheckInDate}</td>
						<td class="table_row">${ur.userPassportNo}</td>
						<td class="table_row">${cil.checkInApplicationStatus}</td>
					</tr>
				</c:forEach>
			</c:forEach>

		</table>
	</div>

	<div class="page-name">Check-out Applications</div>

		<table class="table2">
			<tr class="table_header">
				<td>Application Date</td>
				<td>Check-Out Date</td>
				<td>Check-Out Time</td>
				<td>Room No.</td>
				<td>Status</td>
			</tr>
			<c:forEach items="${checkOutList}" var="col">
				<%-- <c:forEach items="${userList}" var="ur"> --%>

					<tr>
						<td class="table_row">${col.checkOutApplicationDate}</td>
						<td class="table_row">${col.userCheckOutDate}</td>
						<td class="table_row">${col.userCheckOutTime}</td>
						<%-- <td class="table_row">${ur.userRoomId}</td> --%>
						<c:forEach items="${rooms}" var="room">
							<c:if test="${col.userId == room.userId}">
								<td class="table_row">${room.roomBlockName}-${room.roomLevel}-${room.roomNo}</td>
							</c:if>
						</c:forEach>
						<td class="table_row">${col.checkOutApplicationStatus}</td>
					</tr>

				<%-- </c:forEach> --%>
			</c:forEach>

		</table>

	</div>

</body>
</html>
