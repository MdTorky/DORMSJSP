
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
    	<link rel="stylesheet" href="styles/style2.css" />
    <link rel="canonical" href="http://fontawesome.com/icons/cart-shopping" />
    <script
      src="https://kit.fontawesome.com/b0afced649.js"
      crossorigin="anonymous"
    ></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="shortcut icon" href="/img/favicon.png" />
    <!-- for including header files -->
    <script>
      $(function () {
        $("#header").load("assets/SAM_header.jsp");
      });
      //  call header file and store it in id=header
    </script>
    <style>
    

    .column .add{
      cursor: pointer;
      background-color: transparent;
      border: none;
      font-size: 20px;
      font-family: verdana;
      width: 100px;
      padding: 5px;
      border-radius: 30px;
      color: gold;
      transition: 0.7s;
  	}

	.column .add:hover{
    	transform:scale(1.3);
	}

	.containerParcel {
      position: fixed;
      top: 150px;
      left: 0;
      right: 0;
      background: #333333;
      visibility: hidden;
      max-width: 600px;
      margin: 0 auto;
      border-radius: 30px;
      z-index: 1;
      height: 300px;
      border: 2px solid gold;
      
  	}
  	.containerParcel:target {
      visibility: visible;
 	}
  	.close {
      font-size: 60px;
      color: red;
      position: absolute;
      top: 10px;
      left: 20px;
      cursor: pointer;
      text-decoration: none;
  	}
  	.close:hover {
      cursor: pointer;
 	}
 	 .title{
            color: gold;
            font-family: verdana;
            text-align: center;
     }
     input[type=date]{
     width: 200px;
     }
::-webkit-calendar-picker-indicator {
    filter: invert(74%) sepia(93%) saturate(773%) hue-rotate(357deg) brightness(102%) contrast(107%);
    
}



.containerParcel button {
    position: relative;
    margin-top: 50px;
    display: inline-block;
    cursor: pointer;
    outline: none;
    border: 0;
    vertical-align: middle;
    text-decoration: none;
    background: transparent;
    padding: 0;
    font-size: inherit;
    font-family: inherit;
        display: flex;
    margin: auto;
    margin-top: 50px;
    /* margin-bottom: 0px; */
    flex-direction: column;
}
.containerParcel button.learn-more {
    width: 13rem;
    height: auto;
}
.containerParcel button.learn-more .circle {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: relative;
    display: block;
    margin: 0;
    width: 3rem;
    height: 3rem;
    background: gold;
    border-radius: 2.625rem;
}
 .containerParcel button.learn-more .circle .icon {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
    background: #333333;
}
.containerParcel button.learn-more .circle .icon.arrow {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    left: 0.8rem;
    width: 1.1rem;
    height: 0.125rem;
    background: none;
}
.containerParcel button.learn-more .circle .icon.arrow::before {
    position: absolute;
    content: "";
    top: -0.3rem;
    right: 0.0625rem;
    width: 0.625rem;
    height: 0.625rem;
    border-top: 0.125rem solid #333333;
    border-right: 0.125rem solid #333333;
    transform: rotate(45deg);
}
 .containerParcel button.learn-more .button-text {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: -0.1rem;
    left: -0.1rem;
    right: 0;
    bottom: 0;
    padding: 0.75rem 0;
    margin: 0 0 0 1.85rem;
    color: gold;
    font-weight: 700;
    line-height: 1.6;
    text-align: center;
    text-transform: uppercase;
    font-family: "Mukta", sans-serif;
    font-size: 20px;
    text-shadow: 2px 3px 0px rgba(255, 255, 255, 0.15);
}
.containerParcel button:hover .circle {
    width: 100%;
}
 .containerParcel button:hover .circle .icon.arrow {
    background: #333333;
    transform: translate(1rem, 0);
}
 .containerParcel button:hover .button-text {
    color: #333333;
}



  
    </style>
    <title>Add Parcels</title>
  </head>
  <body>
    <!-- Header Section -->
    <section id="header"></section>
     
	 <h1 class="title">Manage Parcels</h1>

 <div class="box">
    <form name="search">
        <input type="text" class="input" name="txt" id="myInput" onmouseout="this.value = ''; this.blur();" onkeyup="myFunction()">
    </form>
<i class="fas fa-search"></i>
</div>
					
    <table class="table" id="myTable">
      <thead class="table-header">
        <tr>
          <!-- <th class="header__item">
            <a id="arrival" class="filter__link" href="#">Arrival Date</a>
          </th>
          <th class="header__item">
            <a id="roomNo" class="filter__link filter__link" href="#">Room Number</a>
          </th>
          <th class="header__item">
            <a id="fees" class="filter__link filter__link" href="#">Fees</a>
          </th> -->
           <th class="header__item">
            <a id="fullName" class="filter__link" href="#">FullName</a>
          </th>
          <th class="header__item">
            <a id="phoneNo" class="filter__link filter__link" href="#">Phone No</a>
          </th>
          <th class="header__item">
            <a id="roomNo" class="filter__link filter__link" href="#">Room Number</a>
          </th> 
          <th class="header__item">
            <a  class="filter__link filter__link" href="#">Action</a>
          </th> 
        </tr>
      </thead>
      <tbody class="table-content">
      
      
      <c:forEach items="${userParcelList}" var="upl" varStatus="loop">
      
        <tr class="table-row">
          <td class="table-data">${upl.userFullName}</td>
          <td class="table-data">${upl.userPhoneNo}</td>
          <td class="table-data">${upl.userRoomNo}</td>
          <td class = "table-data">
            <div class="column">
            
            <div onclick="location.href='#divOne'">
                <button class="add">Add</button>
                
                
                </div>
            </div>
        </td>
          
        </tr>
        
        
        
        
        
        

        
   <div class="containerParcel" id="divOne">
     <section class="checkout-form">
      <a href="#" class="close">&times;</a>	
      <h1 class="title">Add Parcels</h1>
    <form class="addForm" method="post" action="addParcelInfo">
      <div class="additems">
        <label for="inp" class="inp">
          <input type="date" id="inp1" name="arrivalDate"placeholder="&nbsp;" required />
          <span class="label" style="color:gold">Add Arrival Date</span>
          <span class="focus-bg"></span>
        </label>

        <label for="inp" class="inp">
          <input type="number" id="inp2" name="holdingFees" placeholder="&nbsp;" required />
          <span class="label">Add Fees</span>
          <span class="focus-bg"></span>
        </label>
      </div>
    	
      <input type="hidden" value="${upl.userId}" name="userId">
      <a><button class="learn-more">
          <span class="circle" aria-hidden="true">
            <span class="icon arrow"></span>
          </span>
          <span class="button-text">Submit</span>
        </button></a>

      
    </form>
    </section>
    </div>
   
        
        </c:forEach>
        
      </tbody>
    </table>
     
    <script>



    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[0];
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
    
      var properties = ["fullName", "roomNo", "phoneNo"];

      $.each(properties, function (i, val) {
        var orderClass = "";

        $("#" + val).click(function (e) {
          e.preventDefault();
          $(".filter__link.filter__link--active")
            .not(this)
            .removeClass("filter__link--active");
          $(this).toggleClass("filter__link--active");
          $(".filter__link").removeClass("asc desc");

          if (orderClass == "desc" || orderClass == "") {
            $(this).addClass("asc");
            orderClass = "asc";
          } else {
            $(this).addClass("desc");
            orderClass = "desc";
          }

          var parent = $(this).closest(".header__item");
          var index = $(".header__item").index(parent);
          var $table = $(".table-content");
          var rows = $table.find(".table-row").get();
          var isSelected = $(this).hasClass("filter__link--active");
          var isNumber = $(this).hasClass("filter__link--number");

          rows.sort(function (a, b) {
            var x = $(a).find(".table-data").eq(index).text();
            var y = $(b).find(".table-data").eq(index).text();

            if (isNumber == true) {
              if (isSelected) {
                return x - y;
              } else {
                return y - x;
              }
            } else {
              if (isSelected) {
                if (x < y) return -1;
                if (x > y) return 1;
                return 0;
              } else {
                if (x > y) return -1;
                if (x < y) return 1;
                return 0;
              }
            }
          });

          $.each(rows, function (index, row) {
            $table.append(row);
          });

          return false;
        });
      });
    </script>
  </body>
</html>
