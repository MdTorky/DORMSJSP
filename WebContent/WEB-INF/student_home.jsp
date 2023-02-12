<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- If user is not logged in, do not allow entry to home page -->

<%
    if (session.getAttribute("email") == null){
        response.sendRedirect("login");
    }
%> 

<!DOCTYPE html>
<html>

<head>
    <title>Student Home</title>
    <link rel="shortcut icon" href="/img/favicon.png">
    <link rel="stylesheet" href="styles/style2.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <link rel="canonical" href="http://fontawesome.com/icons/cart-shopping" />
    <script src="https://kit.fontawesome.com/b0afced649.js" crossorigin="anonymous"></script>


    <style>
        h1,
        h2 {
            color: gold;
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

        .checkIn {
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
            margin:auto;
        }

        .checkIn:before,
        .checkIn:after {
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

        .checkIn:before {
            opacity: .5;
        }

        .checkIn:after {
            transition-delay: .2s;
        }

         .checkIn:hover {
            color: #333333;
        }

         .checkIn:hover:before,
         .checkIn:hover:after {
            top: 0;
        }
        
	/* 	.checkIn i{
		position: relative;
        color: gold;
        font-size: 30px;
        margin-left: 40px;
        } */


        input[type="text"]:hover,
        input[type="password"]:hover {
            border: 1px solid black;
        }

        #button:hover {
            border: 3px solid #333333;
        }

        #top_side,
        #bottom_side {
            display: flex;
            justify-content: center;
            margin: 100px;
        }
        
            h1{
        justify-content:center;
        align-items: center;
        margin: auto;
        text-align:center;
        padding: 100px 0;
  vertical-align: middle;
        }
        .title
         {
            color: gold;
            font-family: verdana;
            text-align: center;
        }
        
        .file{
        	background: gold;
        	padding: 5px;
        	color: #333333;
        }
        
        .BoxCenter{
        margin: auto;
        width: 1200px;
        height: 200px;
/*         border: 2px solid gold; */
        border-radius: 30px;
        }

        .BoxCenter .row{
            display: flex;
            justify-content: center;
            align-items: center;
            margin: auto;
            gap: 20px;
            padding: 10px;
            
        }

        .BoxCenter .row .col{
            display: inline-block;
            justify-content: center;
            align-items: center;
            margin: auto;
            text-align: center;
            
        }
        
        
    </style>
     <script>
         $(function() {
            $('#header').load('assets/header.jsp');
         })
        //  call header file and store it in id=header
        </script>
</head>

<body>

  <input type = "hidden" id="status" value = "<%= request.getAttribute("status") %>">
<jsp:useBean id="userObj" scope="session" class="com.model.user"></jsp:useBean>

    <!-- <a href="home.jsp"><img src="img/logo2.png"
            style="width:300px; display: block; margin-left: auto; margin-right:auto"></a> -->
            <section id="header"></section>

    <div id="main_container">
        <h1>Welcome <span class="file"><jsp:getProperty property="userFullName" name="userObj"/></span> </h1>

        <div class="BoxCenter">
        	
        	<div class="row">
        		<div class="col">
        			<button onclick="window.location.href='checkIn'" type="submit" class="checkIn">Check-In &nbsp <i class="fa-solid fa-building-circle-check"></i></button>
        		</div>
        		<div class="col">
        			<button onclick="window.location.href='checkOut'" class="checkOut">Check-Out &nbsp <i class="fa-regular fa-building"></i></button>
        		</div>
        		<div class="col">
        			<button onclick="window.location.href='home.jsp'" class="checkIn">Log-Out &nbsp <i class="fa-solid fa-right-from-bracket"></i></button>
        		</div>
        	</div>
        </div>
    </div>
    
    
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#ffd700" fill-opacity="1" d="M0,32L60,74.7C120,117,240,203,360,213.3C480,224,600,160,720,149.3C840,139,960,181,1080,202.7C1200,224,1320,224,1380,224L1440,224L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"></path></svg>

</body>

</html>