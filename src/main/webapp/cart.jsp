<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="myTypes.Cart" %>
<%@ page import="myTypes.Ticket" %>

<%
	Cart cart = (Cart)session.getAttribute("cart");
	%>    
    
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cart</title>

    <!-- Bootstrap Core CSS -->
    <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/cart-page.css" rel="stylesheet">
    
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
      <a class="navbar-brand" href="index.jsp">myTypes.Ticket Store</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Checkout<span class="sr-only">(current)</span></a></li>
        <li><a href="login.jsp">Login</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:72%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%"></th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
					<% 
					if(cart != null){
					for(Ticket t : cart.getTicketList()){ %>
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin"><%= t.getType().toString() %></h4>
										<p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
									</div>
								</div>
							</td>
							<td data-th="Price"><%= t.getPrice() %></td>
							<td>
							</td>
							<td class="actions" data-th="">	
								<form action="CartManager" method="post">
								<input type="hidden" name="action" value="remove" />						
								<button type="submit" name="ticketId" value="<%= t.getId() %>" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>	
								</form>							
							</td>
						</tr>
						<% } 
						}%>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 1.99</strong></td>
						</tr>
						<tr>
							
						<td><a href="index.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td class="hidden-xs"><strong>Total $1.99</strong></td>
							<td colspan="1" class="hidden-xs"></td>
							<td>
							<form action="/private/TransactionManager" method="post">
                        	<input class="btn btn-success btn-block" type="submit" value="Buy!"/>
                        	</form>
							</td>
						</tr>
					</tfoot>
				</table>
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

<!-- jquery JavaScript -->
    <script src="webjars/jquery/1.11.1/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>