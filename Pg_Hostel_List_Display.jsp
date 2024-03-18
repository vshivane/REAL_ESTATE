<%@page import="java.sql.ResultSet"%>
<%@page import="com.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
================================================== -->
<title>Rental House</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Free property search and posting for latur. Posted properties are visited by number of peoples and they can contact with the currosponding owner of the property or take contact details of the owner for us.">
<meta name="keywords" content="Search my home latur,Searchmyhome latur, Pg latur, Hostel latur, Property details, About Properties">
<meta name="author" content="Ingenious Technohub And Team">
<!-- CSS
================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors/main.css" id="colors">

</head>

<body>

<!-- Wrapper -->
<div id="wrapper">

<jsp:include page="Header.jsp"></jsp:include>
<!-- Titlebar ================================================== -->
<div class="parallax titlebar"
	data-background="images/listings-parallax.jpg"
	data-color="#333333"
	data-color-opacity="0.7"
	data-img-width="800"
	data-img-height="505">

	<div id="titlebar">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<h2>Listings</h2>
					<span>Grid Layout With Sidebar</span>
					
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li>Listings</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	<div class="row sticky-wrapper">

		<div class="col-md-8">
			<!-- Main Search Input -->
			<div class="main-search-input margin-bottom-35">
				<input type="text" class="ico-01" placeholder="Enter address e.g. street, city and state or zip" value=""/>
				<button class="button">Search</button>
			</div>	
			
			<!-- Listings -->
			<div class="listings-container list-layout" id="DisplayPgHostelResults">

			<%
			PreparedStatement ps=null;
			ResultSet rs = null,rs1=null;
			ps = DbConnect.getCon().prepareStatement("SELECT * FROM tblpg_hostel_properties");
			rs = ps.executeQuery();
			String uid = (String)session.getAttribute("uid");
			System.out.print(uid);
			while(rs.next())
			{
			%>
				<!-- Listing Item -->
				<div class="listing-item">

					<a href="Property_page.jsp?PropHostelId=<%=rs.getString(2) %>" class="listing-img-container">

						<div class="listing-badges">
							<span>For Pg_Hostel</span>
						</div>

						<div class="listing-img-content">
							<span class="listing-price">RS. <%=rs.getString(16) %> <i>monthly</i></span>
							<%
							if(uid != null)
							{
							ps = DbConnect.getCon().prepareStatement("select * from tblshortlisted_properties where Property_id=? and User_Id=? and Property_Type='PG' ");
							ps.setString(1, rs.getString(2));
							ps.setString(2, uid);
							rs1=ps.executeQuery();
							if(rs1.next())
							{
							}
							else
							{
								%>
								<span class="like-icon with-tip" data-tip-content="Shortlist Property" id="<%=rs.getString(2) %>" title="PG" onclick="addToShortlist(this.id,this.title);"></span>	
							<%	
							}
							}
							%>
						
						</div>

						<img src="Pg_Hostel_Property_images/<%=rs.getString(23) %>" alt="">
					</a>
					
					<div class="listing-content">

						<div class="listing-title">
							<h4><a href="Property_page.jsp?PropHostelId=<%=rs.getString(2) %>"><%=rs.getString(3) %></a></h4>
							<a >
								<i class="fa fa-map-marker"></i>
								<%=rs.getString(19) %>, <%=rs.getString(21) %>-<%=rs.getString(22) %>, <%=rs.getString(20) %>
							</a>

							<a href="Property_page.jsp?PropHostelId=<%=rs.getString(2) %>" class="details button border">Details</a>
						</div>

						<ul class="listing-details">
							<li><%=rs.getString(7) %> sq ft</li>
							<li><%=rs.getString(5) %></li>
							<li><%=rs.getString(8)%> Bathroom</li>
							<li></li>
						</ul>
<!-- 
						<div class="listing-footer">
							<a href="#"><i class="fa fa-user"></i> Harriette Clark</a>
							<span><i class="fa fa-calendar-o"></i> 2 days ago</span>
						</div>
 -->
					</div>

				</div>
				<!-- Listing Item / End -->
			<%	
			}
			
			%>

			</div>
			<!-- Listings Container / End -->

			
			
		</div>


		<!-- Sidebar -->
		<jsp:include page="Pg_Hostel_Side_Bar.jsp"></jsp:include>
		
		<!-- Sidebar / End -->
	</div>
</div>


<jsp:include page="Footer.jsp"></jsp:include>

<!-- Scripts
================================================== -->
<script src="../../cdn-cgi/scripts/78d64697/cloudflare-static/email-decode.min.js"></script><script type="text/javascript" src="scripts/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="scripts/chosen.min.js"></script>
<script type="text/javascript" src="scripts/magnific-popup.min.js"></script>
<script type="text/javascript" src="scripts/owl.carousel.min.js"></script>
<script type="text/javascript" src="scripts/rangeSlider.js"></script>
<script type="text/javascript" src="scripts/sticky-kit.min.js"></script>
<script type="text/javascript" src="scripts/slick.min.js"></script>
<script type="text/javascript" src="scripts/mmenu.min.js"></script>
<script type="text/javascript" src="scripts/tooltips.min.js"></script>
<script type="text/javascript" src="scripts/masonry.min.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>

</div>
<!-- Wrapper / End -->

<script>
$(document).ready(function(){
	
 $('#area-range input[class="first-slider-value"]').removeAttr("disabled");
 $('#area-range input[class="first-slider-value"]').attr("name","minvaluearea");
 $('#area-range input[class="first-slider-value"]').attr("readonly","readonly");
 
 $('#area-range input[class="second-slider-value"]').removeAttr("disabled");
 $('#area-range input[class="second-slider-value"]').attr("name","maxvaluearea");
 $('#area-range input[class="second-slider-value"]').attr("readonly","readonly");
 
 $('#price-range input[class="first-slider-value"]').removeAttr("disabled");
 $('#price-range input[class="first-slider-value"]').attr("name","minvaluerent");
 $('#price-range input[class="first-slider-value"]').attr("readonly","readonly");
 
 $('#price-range input[class="second-slider-value"]').removeAttr("disabled");
 $('#price-range input[class="second-slider-value"]').attr("name","maxvaluerent");
 $('#price-range input[class="second-slider-value"]').attr("readonly","readonly");
 
 
 $('form').on('submit',function(e){
	 
	 e.preventDefault();
	 
	 $.ajax({
		 
		 type:'POST',
		 url:'Get_Pg_Hostel_Result.jsp',
		 data:$('form').serialize(),
		 success:function(result){
			 $('#DisplayPgHostelResults').html(result);
		 }
	 });
 });
	
});

</script>
<script type="text/javascript" src="scripts/shortlistfunction.js"></script>
</body>
</html>