<!-- Nafis -->

<!DOCTYPE html>
<html>

<head>
    <title>Facility Booking</title>

    <link rel="stylesheet" href="styles/style2.css">
    <link rel="shortcut icon" href="/img/favicon.png">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            $('#header').load('assets/header.jsp');
        })
       //  call header file and store it in id=header
    </script>

    <style>
 h1,
        h2 {
            color: gold;
            font-family: verdana;
            text-align: center;
        }
        label{
            color: white;
            font-family: verdana;
            text-align: center;
        }

        h1 {
            font-weight: 800;
            font-size: 50px;
        }

        h3 {
            color: white;
            font-family: verdana;
            text-align: center;
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


        #first_name,
        #last_name,
        #email,
        #password {
            margin: 20px;
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
            margin-top: 20px;
            margin:auto;
        }

        button:before,
        button:after {
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

         button:hover:before,
         button:hover:after {
            top: 0;
        }

        #top_side,
        #bottom_side {
            display: flex;
            justify-content: center;
            padding: 30px;
            margin:20px;
            gap: 20px;
        }

        input[type="text"]:hover,
        input[type="password"]:hover {
            border: 1px solid black;
        }
        input[type="radio"]{
            margin-left: 20px;
            margin-right: 20px;
        }

        #button:hover {
            border: 3px solid #333333;
        }
    </style>
</head>

<body>
<jsp:useBean id="userObj" scope="session" class="com.model.user"></jsp:useBean>

    <div id="header"></div>


    <div id="main_container">

<form action="addFacility" method="post"> 

        <h1>Facility Booking</h1>

        <fieldset style="display:flex; justify-content: center; border:0;">
            <input type="radio" id="booking" name="booking" value="Futsal">
            <label for="Booking">Futsal</label>
            <input type="radio" id="booking" name="booking" value="Ping-pong">
            <label for="Booking">Ping-pong</label>
            <input type="radio" id="booking" name="booking" value="BasketBall">
            <label for="Booking">Basketball</label>
            <input type="radio" id="booking" name="booking" value="BBQ Area">
            <label for="Booking">BBQ Area</label>
            <input type="radio" id="booking" name="booking" value="Gym">
            <label for="Booking">Gym</label>
        </fieldset>



        <div id="top_side">

                <div id="date">
                    <h3>Date</h3>
                    <input type="date" name = "date" class="input_field">
                </div>

                <div id="time_slot">
                    <h3>Time Slot</h3>
                    <input type="time" name = "time_slot" class="input_field">
                </div>

            </div>

            <div id="bottom_side">

                <div id="name">
                    <h3>Name</h3>
                    <input type="text" class="input_field" name="name" value="<jsp:getProperty property="userFullName" name="userObj"/>" readonly >
                </div>

                <div id="room_no">
                    <h3>Room Number</h3>
                    <input type="text" name="room_no" class="input_field">
                </div>

            </div>

            <div id="button">
                <button type="submit" id="sign_up_button">SUBMIT</button>
            </div>

</form>
       

    </div>

</body>

</html>