<!--  JSTL tag to make our life easier to connect our controller to the view. This will give us a nice html syntax to work with -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
function confirm_alert(node) {
    return confirm("Are you sure you want to delete?");
}
</script>
	
	<!-- reference our style sheet -->
	<link type=""text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css"/>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>List Customers</title>
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>

		<div id="container">

			<div id="content">
			
				<!-- put new button: Add Customer -->
				<!-- when this button is clicked, it will call a controller called "showFormForAdd" -->
				<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="add-button"/>
			
				<!-- add out html table here -->
				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>

					<!-- loop over and print our customers... | when we see this notation ${customers}, that means that we are receiving data from the controller while the page loads -->
					<c:forEach var="tempCustomer" items="${customers}">
					
						<!--  create an update link with the customers ID -->
						<c:url var="updateLink" value="/customer/showFormForUpdate">
							<c:param name="customerId" value="${tempCustomer.id}" />
						</c:url>
					
						<!--  create a delete link with the customers ID -->
						<c:url var="deleteLink" value="/customer/delete">
							<c:param name="customerId" value="${tempCustomer.id}" />
						</c:url>
						
					<!-- construct an "update" link with customer id -->
					
						<tr>
							<td>${tempCustomer.firstName}</td>
							<td>${tempCustomer.lastName}</td>
							<td>${tempCustomer.email}</td>
							<td><a href="${updateLink}">Update</a> | <a href="${deleteLink}" onclick="return confirm_alert(this);">Delete</a> </td>
						</tr>

					</c:forEach>

				</table>

			</div>

		</div>

	</div>


</body>
</html>