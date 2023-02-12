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
  margin-top: 3%;
  width: 65%;
  display: flex;
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
</style>
</head>
<body>
  <section id="header"></section>
  <div class="flexbox-container">
    <hr />
    <div class="page-name">Manager Profile</div>
    <div class="body-container">
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
    </div>
  </div>
</body>
</html>