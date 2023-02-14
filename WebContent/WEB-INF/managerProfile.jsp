<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="styles/style2.css" />
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
<title>Manager Profile</title>
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

hr {
  width: 60%;
  border: 2px solid gold;
  border-radius: 10px;
}

.page-name {
  color: gold;
  font-size: 150%;
  font-weight: bold;
  margin: 2%;
  text-align: center;
  width: 65%;
}

.body-container {
	width: 65%;
	display: flex;
  flex-direction: column;
}

.profile-picture-container {
  flex-direction: row;
  align-items: center;
  margin: 2%;
  flex-grow: 1;
}

.profile-details-container {
  margin: 2%;
  display: flex;
  flex-direction: row;
  flex-grow: 2;
  color: white;
  font-weight: bold;
  align-items: center;
  font-size: 130%;
}

.profile-details-data {
  margin-left: 10%;
  color: gold;
  font-size: 110%;
}

.profile-picture {
  vertical-align: middle;
  width: 400px;
  height: 400px;
  border-radius: 50%;
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

#button:hover {
	border: 3px solid #333333;
}
.name-container {
	color: gold;
	font-size: 100%;
	font-weight: bold;
	margin: 2%;
	text-align: center;
}
table {
  border: 0;
  width: 35%;
}
</style>
</head>
<body>
	<section id="header"></section>
	<div class="flexbox-container">
		<hr />
		<div class="page-name">Manager Profile</div>
		<%-- <div class="body-container">
      <div class="profile-picture-container">
        <img class="profile-picture" src="img/managerProfilePic.png"
          alt="Profile Picture" />
      </div>
      <div class="profile-details-container">
        <div class="profile-details-lable">
          <div class="name-container">Name</div>
          <div class="nationality-container">Nationality</div>
          <div class="nationality-container">Email</div>
          <div class="nationality-container">Phone Number</div>
        </div>
        <div class="profile-details-data">
          <div >${currentUser.userFullName}</div>
          <div >${currentUser.userNationality}</div>
          <div >${currentUser.userEmail}</div>
          <div >${currentUser.userPhoneNo}</div>
        </div>
      </div>
    </div> --%>
		<table>
			<tr>
				<th><div>Name</div></th>
				<td><div class="name-container">${currentUser.userFullName}</div></td>
			</tr>
			<tr>
				<th><div>Nationality</div></th>
				<td><div class="name-container">${currentUser.userNationality}</div></td>
			</tr>
			<tr>
				<th><div>Email</div></th>
				<td><div class="name-container">${currentUser.userEmail}</div></td>
			</tr>
			<tr>
				<th><div>Phone Number</div></th>
				<td><div class="name-container">${currentUser.userPhoneNo}</div></td>
			</tr>
		</table>

		<br /> <br />
		<%-- <div id="button">
            <a href="editStudentProfile"><button id="submit">Edit Profile</button></a>
			    </div> --%>

		<form action="editManagerProfile" method="post">
			<input type="hidden" name="userId" value="${currentUser.userId}" />
			<input type="hidden" name="userFullName"
				value="${currentUser.userFullName}" /> <input type="hidden"
				name="userNationality" value="${currentUser.userNationality}" /> <input
				type="hidden" name="userPhoneNo" value="${currentUser.userPhoneNo}" />
			<button id="submit">Edit Profile</button>
		</form>
	</div>
</body>
</html>