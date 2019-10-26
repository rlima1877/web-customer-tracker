<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<title>Save Customer</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save Customer</h3>


		<!--  when we add modelAttribute="customer" || this means we are making a two way bind with the controller and view -->
		<!--  if the controller is sending data to the view to bind, it will send through "customer" Model model parameter -->
		<!--  if the view is sending data to the controller, the controller can grab it via the @ModelAttribute("customer") parameter -->
		<%-- <form:input path="firstName"/> || the object is Customer, and the path=firstName is an attribute of this object we'll be sending. --%>
		<!--  when this form loads Spring MVC calls GETTERS, when form is submitted Spring MVC will call SETTERS on the object -->
		<form:form action="saveCustomer" modelAttribute="customer"
			method="POST">

			<!-- need to associate the customer object ID -->
			<!-- It's hidden because we don't want the users to see the ID -->
			<!-- Hibernate needs the ID in order to see if we're adding a customer or updating. -->
			<!-- The code will hit the CustomerDAOImpl, in there we'll do a  currentSession.saveOrUpdate(theCustomer) -->
			<!--  saveOrUpdate(theCustomer) means, if primary key is empty, then do an INSERT, else, do an UPDATE -->
			<!--  So... when we want to do an add, we'll be sending no ID, because we'll bind to an empty Customer object -->
			<!--  When we want to do an update, the form will be pre-populated, and when we submit, we'll be passing the ID which means UPDATE  -->
			<form:hidden path="id" />

			<table>
				<tbody>
					<tr>
						<td><label>First name:</label></td>
						<td><form:input path="firstName" /></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><form:input path="lastName" /></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><form:input path="email" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>


				</tbody>
			</table>


		</form:form>

		<div style=""></div>

		<p>
			<a href="${pageContext.request.contextPath}/customer/list">Back
				to List</a>
		</p>

	</div>

</body>

</html>










