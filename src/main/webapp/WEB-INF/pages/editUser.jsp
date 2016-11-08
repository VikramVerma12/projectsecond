<%@ include file="header.jsp" %> 
 <div>
  <div class="col-md-2 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="${pageContext.request.contextPath}/resources/images/${pageContext.request.userPrincipal.name}.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Hello Dear : ${pageContext.request.userPrincipal.name}</h6>
      
      </div>
    </div>
    <br>
    <br>
 <div class="col-md-8 col-sm-6 col-xs-12 personal-info" style="padding-left: 300px;">
			<form:form method="POST" action="edituser/${users.userid}" commandName="user" class="form-horizontal" enctype="multipart/form-data" >

				<table>
					<tr>
						<td>User Id:</td>
						<td><form:input path="userid" value="${users.userid}" class="form-control"
							disabled="true" /></td>
					</tr>
					<tr>
						<td>Username:</td>
						<td><form:input path="username" value="${users.username}" disabled="true" class="form-control"/></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><form:input path="password" value="${users.password}" class="form-control"
						 /></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><form:input path="email" value="${users.email}" class="form-control" /></td>
					</tr>
					<tr>
						<td>Mobile:</td>
						<td><form:input path="mobile" value="${users.mobile}" class="form-control"/></td>
					</tr>
					<tr>
						<td>Address:</td>
						<td><form:input path="address" value="${users.address}" class="form-control"
							 /></td>
					</tr>
					<tr>
						<td>Profile Pic:</td>
						<td><form:input type="file" path="image" class="form-control"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Edit Profile"
							class="btn btn-success" /></td>
					</tr>
				</table>

			</form:form>
			</div>
		</div>
