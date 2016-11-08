<%@ include file="header.jsp" %>

  <body>
  this is edit post page
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
  

    
 <div class="col-md-8 col-sm-6 col-xs-12 personal-info" style="padding-left: 300px;">
			<form:form method="POST" action="editpost1/${postId}"  modelAttribute="post" class="form-horizontal" enctype="multipart/form-data"   >
				<table>
					<tr>
						<td>Post Id:</td>
						<td><form:input path="id" value="${post.id}" class="form-control"
							disabled="false" name="readonly" readonly="true"  /></td>
					</tr>
					<tr>
						<td>Post Title:</td>
						<td><form:input path="title" value="${post.title}" disabled="false" class="form-control"/></td>
					</tr>
					<tr>
						<td>Post Contents:</td>
						<td><form:input path="content" value="${post.content}" class="form-control"
						 /></td>
					</tr>
					<tr>
						<td>Post Date</td>
						<td><form:input path="date" value="${post.date}" class="form-control" name="readonly" readonly="true" /></td>
					</tr>
					<tr>
						<td>Post User</td>
						<td><form:input path="postUser" value="${post.postUser}" class="form-control" name="readonly" readonly="true" /></td>
					</tr>					
					<tr>
						<td></td>
						<td><input type= "submit" value="Edit Post" class="btn btn-success" /></td>
					</tr>
				</table>
			</form:form>
			</div>
		</div>
