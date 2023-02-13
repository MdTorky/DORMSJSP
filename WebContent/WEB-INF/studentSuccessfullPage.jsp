<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style2.css">
    <link rel="shortcut icon" href="/img/favicon.png">
    <link rel="canonical" href="http://fontawesome.com/icons/cart-shopping" />
    <script src="https://kit.fontawesome.com/b0afced649.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>  
    
    <!-- for including header files -->
    <script>
         $(function() {
            $('#header').load('assets/header.jsp');
         })
        </script>
        
        <style>
        
        .title
         {
            color: green;
            font-family: verdana;
            text-align: center;
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
        
        </style>
    <title>Successful</title>
</head>
<body>

	<!-- Header Section -->
  <section id="header"></section>

  <h1 class="title">Successful</h1>

        
<form>
<button formaction="studentHome" class="coolBeans">BACK</button>  
          </form>  
            


  </body>
  </html>