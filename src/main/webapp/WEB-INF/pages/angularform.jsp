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
  All Forums
</h2>


<table id="myTable" class="table table-striped table-bordered" align="center">


<thead>
            <tr>
                <th>Forum Id</th>
                <th>Forum Title</th>
                <th>Forum Content</th>
                <th>Forum User Name</th>
                <th>Forum date and time</th>
                <th>Forum Category</th>
                <th>Your Choice</th>
            </tr>
        </thead>
        <tbody>
      <c:if test="${not empty forums}">
	  <c:forEach var="forum" items="${forums}">
            <tr>
                <td>${forum.forumid}</td>
                <td>${forum.forumtitle}</td>
                <td>${forum.forumcontent}</td>
                <td>${forum.forumUserName}</td>
                <td>${forum.creationdatetime}</td>
                <td>${forum.category}</td>
            <td>
                                 
   <c:if test="${(pageContext.request.userPrincipal.name =='admin')|| (pageContext.request.userPrincipal.name ==forum.forumUserName)}">
  <a href="<spring:url value="/deleteforum?forumId=${forum.forumid}" />" 
 class="btn btn-warning"> <span class="glyphicon-info-sign glyphicon"> </span> Delete</a>
 </c:if>
  <c:if test="${pageContext.request.userPrincipal.name ==forum.forumUserName}">
 <a href="<spring:url value="/editforum?forumId=${forum.forumid}" />"
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
