<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%> 
<%@page import="com.model.parcel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style2.css">
    <link rel="canonical" href="http://fontawesome.com/icons/cart-shopping" />
    <script src="https://kit.fontawesome.com/b0afced649.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<link rel="shortcut icon" href="/img/favicon.png">
	  
    <!-- for including header files -->
    <script>
         $(function() {
            $('#header').load('assets/header.jsp');
         })
        //  call header file and store it in id=header
        </script>
        <style>
        .title
         {
            color: gold;
            font-family: verdana;
            text-align: center;
        }
        .gold{
        color:gold;
        font-weight: bold}
        </style>
    <title>My Parcels</title>
	
</head>
<body>
	<section id="header">
	</section>
	<!-- Header Section -->
  
 <h1 class="title">My Parcels</h1>

  <!-- My Parcels Table -->
  <section id="my-parcels-table">
<div class="body">
<table class="table">
	<thead class="table-header">
		<tr>
			<th class="header__item"><a id="parcelID" class="filter__link filter__link" href="#">Parcel ID</a></th>
			<th class="header__item"><a id="arrival" class="filter__link" href="#">Arrival Date</a></th>
			<th class="header__item"><a id="fees" class="filter__link filter__link" href="#">Fees</a></th>
		</tr>
	</thead>
	<tbody class="table-content">
<c:forEach items="${userParcelList}" var="upl">
	
	<tr class="table-row">
		<td class = "table-data">${upl.parcelId}</td>
		<td class = "table-data">${upl.parcelArrivalDate}</td>
		<td class = "table-data">RM<span class="gold">${upl.parcelHoldingFees }</span></td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>

</section>

<!-- Script for Asc and Desc in the table -->
<script>
   var properties = [
	        'arrival',
	        'parcelID',
	        'fees',
        ];

        $.each( properties, function( i, val ) {
	
	var orderClass = '';

	$("#" + val).click(function(e){
		e.preventDefault();
		$('.filter__link.filter__link--active').not(this).removeClass('filter__link--active');
  		$(this).toggleClass('filter__link--active');
   		$('.filter__link').removeClass('asc desc');

   		if(orderClass == 'desc' || orderClass == '') {
    			$(this).addClass('asc');
    			orderClass = 'asc';
       	} else {
       		$(this).addClass('desc');
       		orderClass = 'desc';
       	}

		var parent = $(this).closest('.header__item');
    		var index = $(".header__item").index(parent);
		var $table = $('.table-content');
		var rows = $table.find('.table-row').get();
		var isSelected = $(this).hasClass('filter__link--active');
		var isNumber = $(this).hasClass('filter__link--number');
			
		rows.sort(function(a, b){

			var x = $(a).find('.table-data').eq(index).text();
    			var y = $(b).find('.table-data').eq(index).text();
				
			if(isNumber == true) {
    					
				if(isSelected) {
					return x - y;
				} else {
					return y - x;
				}

			} else {
			
				if(isSelected) {		
					if(x < y) return -1;
					if(x > y) return 1;
					return 0;
				} else {
					if(x > y) return -1;
					if(x < y) return 1;
					return 0;
				}
			}
    		});

		$.each(rows, function(index,row) {
			$table.append(row);
		});

		return false;
	});

});




</script>
</body>
</html>
