<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="java.util.ArrayList" %>
<%@ page import="myTypes.Ticket" %>
<%@ page import="myTypes.Cart" %>

<% ServletContext ctx = config.getServletContext();
	ArrayList<Ticket> ticketList = (ArrayList<Ticket>)ctx.getAttribute("ticketList");
	Cart cart = (Cart)session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">



<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>myTypes.Ticket Store</title>

    <!-- Bootstrap Core CSS -->
    <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/heroic-features.css" rel="stylesheet">
    
     <!--Pulling Awesome Font -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	

    <!-- Navigation -->
 <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Ticket Store</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="cart.jsp">Checkout<span class="sr-only">(current)</span></a></li>
        <li><a href="login.jsp">Login</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 
          <span class="glyphicon glyphicon-shopping-cart">
          <% if(cart != null){ %>
          </span><span> <%= cart.getNItem() %> Tickets - <%= cart.getTot() %>&euro;</span>
          <%} %>
          
        	 <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-cart" role="menu">
      		<% 
      		if(cart != null){
      		for(Ticket t : cart.getTicketList()){ %>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://lorempixel.com/50/50/" alt="" />
                        <span class="item-info">
                            <span><%= t.getType() %></span>
                            <span><%= t.getPrice() %>&euro;</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-xs btn-danger pull-right"><i class="fa fa-trash-o"></i></button>
                    </span>
                </span>
              </li>
			<% } 
			}%>
              <li class="divider"></li>
              <li><a class="text-center" href="cart.jsp">View Cart</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

    <!-- Page Content -->
    <div class="container" id="content">

        <!-- Page Features -->
        <div class="row text-center">

<% for(Ticket t : ticketList) { %>

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="images/generic-ticket.png" alt="generic-ticket">
                    <div class="caption">
                        <h3><%= t.getType() %></h3>
                        <h4>Price: <%= t.getPrice() %>&euro;</h4>
                        <form action="CartManager" method="post">
                        <input type="hidden" name="action" value="add" />
                        <button class="btn btn-primary" type="submit" name="ticketType" value="<%= t.getType().toString() %>">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
	<% } %>
            
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; YourName 2017</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->
    
    <!-- jquery JavaScript -->
    <script src="webjars/jquery/1.11.1/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>

</html>
