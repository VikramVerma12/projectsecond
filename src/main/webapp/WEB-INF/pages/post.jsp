<%@ include file="header.jsp"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
  <style>
.center {
    text-align: center;
    border: 3px solid green;
}
</style>
<body align="center" class="center">
<h2 style="color: blue;font-size: 35px;">
  All Posts
</h2>


<table id="myTable" class="table table-striped table-bordered" align="center">
<thead>
            <tr>
                <th>Post Id</th>
                <th>Post Title</th>
                <th>Post Content</th>
                <th>Post User Name</th>
                <th>Post date and time</th>
                <th>Your Choice</th>
            </tr>
        </thead>
        <tbody>
      <c:if test="${not empty posts}">
	<c:forEach var="post" items="${posts}">
            <tr>
                <td>${post.id}</td>
                <td>${post.title}</td>
                <td>${post.content}</td>
                <td>${post.postUser}</td>
                <td>${post.date}</td>   
            <td>
            <c:if test="${(pageContext.request.userPrincipal.name =='admin')|| (pageContext.request.userPrincipal.name ==post.postUser)}">
 <a href="<spring:url value="/delete1?postId=${post.id}" />"
class="btn btn-warning"> <span class="glyphicon-info-sign glyphicon"> </span> Delete</a>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name ==post.postUser}">
 <a href="<spring:url value="/editpost1?postId=${post.id}" />"
class="btn btn-warning"> <span class="glyphicon-info-sign glyphicon"> </span> edit	</a>
</c:if>
</td>
</tr>
</c:forEach>
</c:if>
</tbody>
</table>
<c:if test="${pageContext.request.userPrincipal.name == null}">
	<p>
		Please <a href="<c:url value="/login" />">Sign in</a> to post comment
	</p>
</c:if>
<script>
$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>
</body>
</html>



