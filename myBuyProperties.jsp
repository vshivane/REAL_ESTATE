<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*,com.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
================================================== -->
<title>Rental House</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Free property search and posting for latur">
<meta name="keywords" content="Search my home latur,Home,House,Flats,Flatmates,Pg Hostel,Buy,Search,Rent">
<meta name="author" content="Ingenious Technohub And Team">
<!-- CSS ================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors/main.css" id="colors">

</head>

<body>

<!-- Wrapper -->
<div id="wrapper">
<jsp:include page="Header.jsp"></jsp:include>
<script type="text/javascript">
	<%if(session.getAttribute("uid")==null){ %>
		location.href='login-register.jsp';	
	<%}%>
</script>
<!-- Titlebar
================================================== -->
<div id="titlebar">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>My Properties</h2>
				<!-- Breadcrumbs -->
				<nav id="breadcrumbs">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li>My Properties</li>
						<li>Buy</li>
					</ul>
				</nav>

			</div>
		</div>
	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	<div class="row">
		<!-- Widget -->
		
		<jsp:include page="MyProfileSidebar.jsp"></jsp:include>
		
		<div class="col-md-8">
			<table class="manage-table responsive-table">
				<tr>
					<th><i class="fa fa-file-text"></i> Buy Properties</th>
					<th class="expire-date"><i class="fa fa-calendar"></i> Posted Date</th>
					<th><i class="fa fa-anchor"></i> Action</th>
				</tr>
				<%
				System.out.println(session.getAttribute("uid"));
				PreparedStatement ps= DbConnect.getCon().prepareStatement("SELECT * FROM tblbuy_properties WHERE Owner_Id = '"+session.getAttribute("uid")+"'");
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{ %>
					<!-- Item #1 -->
					<tr>
						<td class="title-container">
							<img src="Buy_Property_images/<%= rs.getString(17) %>" alt="">
							<div class="title">
								<h4><a href="Property_page.jsp?PropBuyId=<%=rs.getString(2) %>"><%= rs.getString(3) %></a></h4>
								<span><%= rs.getString(13) %>, <%= rs.getString(15) %>, <%= rs.getString(14) %></span>
								<span class="table-property-price">RS:&nbsp;<%= rs.getString(12) %>/-&nbsp;</span>
							</div>
						</td>
						
						<td class="expire-date"><%= rs.getString(21) %></td>
						
						<td class="action">
							<a href="myproprm.jsp?PropBuyId=<%= rs.getString(2) %>" onclick="return confirm('Are you sure?')" class="delete"><i class="fa fa-remove"></i> Delete</a>
						</td>
					</tr>
				<%} %>
			</table>
		</div>
	</div> 
</div>

<jsp:include page="Footer.jsp"></jsp:include>

	<!-- Scripts ================================================== -->
	<script src="../../cdn-cgi/scripts/78d64697/cloudflare-static/email-decode.min.js"></script><script type="text/javascript" src="scripts/jquery-2.2.0.min.js"></script>
	<script type="text/javascript" src="scripts/chosen.min.js"></script>
	<script type="text/javascript" src="scripts/magnific-popup.min.js"></script>
	<script type="text/javascript" src="scripts/owl.carousel.min.js"></script>
	<script type="text/javascript" src="scripts/rangeSlider.js"></script>
	<script type="text/javascript" src="scripts/sticky-kit.min.js"></script>
	<script type="text/javascript" src="scripts/slick.min.js"></script>
	<script type="text/javascript" src="scripts/masonry.min.js"></script>
	<script type="text/javascript" src="scripts/mmenu.min.js"></script>
	<script type="text/javascript" src="scripts/tooltips.min.js"></script>
	<script type="text/javascript" src="scripts/custom.js"></script>
	
</div>
<!-- Wrapper / End -->
</body>
</html>