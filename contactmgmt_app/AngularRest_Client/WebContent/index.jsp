<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> --%>


<!DOCTYPE html>

<html data-ng-app="myApp">
<head>
<link rel="stylesheet" type="text/css" href="demo.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Angular JS and Restful</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
</head>
<body data-ng-controller="productController">
	<form name="myForm">
		<div class="container">
			<div class="jumbotron">
				<h1 style="text-align: center;">Contact Management</h1>
				<p style="text-align: center;">It is used to add and search a
					contact</p>
			</div>
			<div class="col-lg-5">
				<div class="row">
					Search Contact: <input type="text" class="form-control"
						data-ng-model="searchText"
						placeholder="Search- Fname, Lname, Address, Contact no." /> <span
						class="glyphicon glyphicon-search form-control-feedback"
						style="margin-top: 20px;"></span>
				</div>
			</div>
			<div class="row">
				<button type="button" style="float: right;"
					class="btn btn-success btn-lg" data-toggle="modal"
					data-target="#myModal1">Add Contact</button>
			</div>
			
			<!-- updated modal -->
			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h2 class="modal-title">update a Contact</h2>
						</div>
						<div class="modal-body">
							<div>
								<div class="row">
									<div class="col-lg-12">
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">First Name</h5>
											</div>
											<div class="col-lg-6">
												<input type="text" name="fname" ng-model="updateContact.fname"
													class="form-control" data-ng-minlength="3"
													data-ng-maxlength="10" data-ng-pattern="/[a-zA-Z]/"
													required /> <span style="color: red"
													ng-show="myForm.fname.$dirty && myForm.fname.$invalid">
													<span data-ng-show="myForm.fname.$error.required">First
														Name is required</span> <span
													data-ng-show="myForm.fname.$error.minlength">First
														Name is too short</span>
												</span>
											</div>
										</div>
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">Last Name</h5>
											</div>
											<div class="col-lg-6">
												<input type="text" name="lname" ng-model="updateContact.lname"
													ng-minlength="3" data-ng-maxlength="10"
													data-ng-pattern="/[a-zA-Z]/" class="form-control" required />
												<span style="color: red"
													ng-show="myForm.lname.$dirty && myForm.lname.$invalid">
													<span style="color: red"
													ng-show="myForm.lname.$error.minlength">Last Name is
														too short</span> <span style="color: red"
													ng-show="myForm.lname.$error.required">Last Name is
														Required</span>
												</span>
											</div>
										</div>
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">ID</h5>
											</div>
											<div class="col-lg-6">
												<input type="text" name="id" data-ng-model="updateContact.id"
													data-ng-pattern="/[0-9]/" class="form-control" required ng-disabled="true" />
											</div>
										</div>
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">Contact</h5>
											</div>
											<div class="col-lg-6">
												<input type="text" name="phn" data-ng-model="updateContact.phn"
													class="form-control" required /> <span style="color: red"
													data-ng-show="myForm.phn.$dirty && myForm.phn.$invalid">
													<span style="color: red"
													data-ng-show="myForm.phn.$error.minlength">Contact
														no. not valid(should be 10 digits)</span> <span
													style="color: red"
													data-ng-show="myForm.phn.$error.required">Contact
														no. is Required</span>
												</span>
											</div>
										</div>

									</div>
								</div>

								<div class="modal-footer spacing">
									<button type="button" value="submit" class="btn btn-default"
										ng-click="update(updateContact)"
										data-ng-disabled="(myForm.fname.$dirty && myForm.fname.$invalid)
      || (myForm.lname.$dirty && )myForm.lname.$invalid)  || (myForm.phn.$dirty && myForm.phn.$invalid)">update</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>




<!-- add modal --> 
<div id="myModal1" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h2 class="modal-title">Add a Contact</h2>
						</div>
						<div class="modal-body">
							<div>
								<div class="row">
									<div class="col-lg-12">
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">First Name</h5>
											</div>
											<div class="col-lg-6">
												<input type="text" name="fname" ng-model="contact.fname"
													class="form-control" data-ng-minlength="3"
													data-ng-maxlength="10" data-ng-pattern="/[a-zA-Z]/"
													required  /><span style="color: red"
													ng-show="myForm.fname.$dirty && myForm.fname.$invalid">
													<span data-ng-show="myForm.fname.$error.required">First
														Name is required</span> <span
													data-ng-show="myForm.fname.$error.minlength">First
														Name is too short</span>
												</span>
											</div>
										</div>
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">Last Name</h5>
											</div>
											<div class="col-lg-6">
												<input type="text" name="lname" ng-model="contact.lname"
													ng-minlength="3" data-ng-maxlength="10"
													data-ng-pattern="/[a-zA-Z]/" class="form-control" required />
												<span style="color: red"
													ng-show="myForm.lname.$dirty && myForm.lname.$invalid">
													<span style="color: red"
													ng-show="myForm.lname.$error.minlength">Last Name is
														too short</span> <span style="color: red"
													ng-show="myForm.lname.$error.required">Last Name is
														Required</span>
												</span>
											</div>
										</div>
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">ID</h5>
											</div>
											<div class="col-lg-6">
												<input type="text" name="id" data-ng-model="contact.id"
													data-ng-pattern="/[0-9]/" class="form-control" />
											</div>
										</div>
										<div class="row spacing">
											<div class="col-lg-4">
												<h5 class="body-label">Contact</h5>
											</div>
											<div class="col-lg-6">
												<input type="number" name="phn" data-ng-model="contact.phn"
													class="form-control" required /> <span style="color: red"
													data-ng-show="myForm.phn.$dirty && myForm.phn.$invalid">
													<span style="color: red"
													data-ng-show="myForm.phn.$error.minlength">Contact
														no. not valid(should be 10 digits)</span> <span
													style="color: red"
													data-ng-show="myForm.phn.$error.required">Contact
														no. is Required</span>
												</span>
											</div>
										</div>

									</div>
								</div>

								<div class="modal-footer spacing">
									<button type="button" value="submit" class="btn btn-default"
										ng-click="submit(contact)"
										data-ng-disabled="(myForm.fname.$dirty && myForm.fname.$invalid)
      || myForm.lname.$invalid ||  myForm.phn.$invalid || myForm.id.$invalid">Add</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

















		</div>
		<div class="container">


			<div id="theDiv"
				data-ng-repeat="contacts in data | filter:searchText">
				<a class="deleteDiv" href="#" data-ng-click="del(contacts.id)">Remove</a>
				<a class="deleteDiv" href="#" data-ng-click="updateContacts(contacts)" data-target="#myModal" data-toggle="modal">Update</a>
				<div>
					<img />
				</div>

				<p class="name">
					<font size="4px" color="red"><b>{{contacts.fname}}</b></font> <br />
					<font size="2px">{{contacts.lname}}</font> <br> <br />
					{{contacts.id}}<br /> {{contacts.phn}}
				</p>
			</div>

		</div>

	</form>
	<script>
		var model = angular.module('myApp', []);
		var hostRestURL = 'http://localhost:8080/AngularRest/';
		model
				.controller(
						'productController',
						[
								"$scope",
								"$http",
								function($scope, $http) {
									$scope.data ={};
									
								

									$http
											.get(
													hostRestURL+ 'getContact/get')
											.success(function(response) {			
												debugger;
												$scope.data = $.makeArray(response.product);
											})
											.error(
													function(error) {
														console
																.log('error in rest call...');
														alert("error in rest call...");
													}); 

									$scope.del = function(contactID) {
										debugger;
										if (confirm('Are u sure!You want to delete this contact..')) {											
											$http
													.get(hostRestURL+ 'deleteContact/delete/'+ contactID)
													.success(
															function(response) {
																$scope.data ={};
																$scope.data = $.makeArray(response.product);
															})
													.error(
															function(error) {
																alert('error from server.....'
																		+ error.text)
															});
										}
									};
									
									$scope.updateContacts=function(contact){
										debugger;
										$scope.updateContact=contact;
									};
									
									$scope.update=function(contact){
										debugger;
										if(contact)
											{
										$http({
											url:hostRestURL+'updateContact/update',
											method:"POST",
											data:contact
										}).
									    success(function(response){											    
									    	$scope.data ={};
											$scope.data = $.makeArray(response.product);
									    })
									    .error(function(error){
									    	alert('error frin server..'+error);
									    });
									}
									};

									$scope.submit = function(contact) {
										if (contact != null) {											
											$http({
											    url: hostRestURL+ 'createContact/create',
											    method: "POST",
											    data: contact
											    }).
											    success(function(response){											    
											    	$scope.data ={};
													$scope.data = $.makeArray(response.product);
											    })
											     .error(function(error){
									    	     alert('error frin server..'+error);
									              });
											alert('Contact added Successfully');
											
										}
									};

								} ]);
	</script>
</body>
</html>