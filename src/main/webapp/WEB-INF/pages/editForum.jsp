<%@ include file="header.jsp" %>

<style type="text/css">


</style>
  <body>
  </br>
  <p align="center" style="font-size:200% ;color:blue;">You are going to edit your forum</p>
  </body>
 
 <div>
  <div class="col-md-2 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="${pageContext.request.contextPath}/resources/images/${pageContext.request.userPrincipal.name}.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Hello Dear : ${pageContext.request.userPrincipal.name}</h6>
      
      </div>
    </div>
    <br>
    <br>

 <div class="col-md-8 col-sm-8 col-xs-15 personal-info" style="padding-left: 100px;">
			<form:form method="POST" action="editforum/${forumId}" modelAttribute="forum" class="form-horizontal" enctype="multipart/form-data" >

				<table width="500" style="margin-left:auto;margin-right:auto">
					<tr>
						<td>Forum Id:</td>
						<td><form:input path="forumid" value="${forum.forumid}" class="form-control" name="readonly" readonly="true" /></td>
					</tr>
					<tr>
						<td>Forum Title:</td>
						<td><form:input path="forumtitle" value="${forum.forumtitle}" disabled="false" class="form-control"/></td>
					</tr>
					<tr>
						<td>Forum Content:</td>
						<td><form:input path="forumcontent" value="${forum.forumcontent}" class="form-control" /></td>
					</tr>
					<tr>
						<td>Forum UserName:</td>
						<td><form:input path="forumUserName" value="${forum.forumUserName}" class="form-control" name="readonly" readonly="true" /></td>
					</tr>
					<tr>
						<td>Forum Creation date time:</td>
						<td><form:input path="creationdatetime" value="${forum.creationdatetime}" class="form-control" name="readonly" readonly="true" /></td>
					</tr>
						<tr>
		<td> Category</td>
		<td>
            <form:select path="category">
            <form:option value="Java" />
            <form:option value="Oracle"/>
            <form:option value="DTJava"/>
            </form:select>
        </td>
		</tr>
				</table>
				</br>
				</br>
				
				<table width="200" style="margin-left:auto;margin-right:auto">
				<tr>
					    <td ><input type="submit" value="Edit" class="btn btn-success" name="action" /></td>
						<td><input type="submit" value="Cancel" class="btn btn-success" name="action" /></td>						
			    </tr>
				</table>
		</form:form>
			</div>
		</div>
</body>
</html>