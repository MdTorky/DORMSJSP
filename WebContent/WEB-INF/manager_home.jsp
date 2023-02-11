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
    <title>Manager Home</title>
    <link rel="shortcut icon" href="/img/favicon.png" />
    <link rel="stylesheet" href="styles/style2.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script>
      $(function () {
        $("#header").load("assets/SAM_header.jsp");
      });
      //  call header file and store it in id=header
    </script>

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
        transition: all 0.35s;
        cursor: pointer;
        margin-top: 10px;
        margin: auto;
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
        transition: all 0.35s;
      }

      button:before {
        opacity: 0.5;
      }

      button:after {
        transition-delay: 0.2s;
      }

      button:hover {
        color: #333333;
      }

      button:hover:before,
      button:hover:after {
        top: 0;
      }

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
    </style>
  </head>

  <body>
    <div id="header"></div>


    <div id="main_container">
      <h1>Welcome Manager</h1>

      <form>
        <div id="top_side">
          <div id="button">
            <button
              type="submit"
              formaction="check_in_application.jsp"
              id="sign_in_button"
            >
              Check In Application
            </button>
          </div>

          <br /><br />

          <div id="button">
            <button
              type="submit"
              formaction="addParcel.jsp"
              id="sign_in_button"
            >
              Add Parcel
            </button>
          </div>

          <br /><br />

          <div id="button">
            <button
              type="submit"
              formaction="manageStorage.jsp"
              id="sign_in_button"
            >
              Personal Storage Requests
            </button>
          </div>

          <br /><br />

          <div id="button">
            <button
              type="submit"
              formaction="facilityapplications.jsp"
              id="sign_in_button"
            >
              Facilities Applications
            </button>
          </div>

          <br /><br />

          <div id="button">
            <button
              type="submit"
              formaction="complaintsapplications.jsp"
              id="sign_in_button"
            >
              Manage Complaints
            </button>
          </div>
        </div>

        <div id="bottom_side">
          <div id="button">
            <button
              type="submit"
              formaction="facilityapplications.jsp"
              id="sign_in_button"
            >
              Facilities Applications
            </button>
          </div>

          <br /><br />

          <div id="button">
            <button
              type="submit"
              formaction="managerCheckInApplications.jsp"
              id="sign_in_button"
            >
              Check In Applications
            </button>
          </div>

          <div id="button">
            <button
              type="submit"
              formaction="managerCheckOutApplications.jsp"
              id="sign_in_button"
            >
              Check Out Applications
            </button>
          </div>

          <br /><br />

          <div id="button">
            <button
              type="submit"
              formaction="roomInspection.jsp"
              id="sign_in_button"
            >
              Room Inspection Form
            </button>
          </div>

          <br /><br />

          <div id="button">
            <button
              type="submit"
              formaction="managerProfile.jsp"
              id="sign_in_button"
            >
              Profile Page
            </button>
          </div>

          <br /><br />
        </div>
      </form>
    </div>
    
  </body>
</html>
