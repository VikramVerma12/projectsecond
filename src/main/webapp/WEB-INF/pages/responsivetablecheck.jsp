
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

</head>


<script>
	$(document).ready(function() {
		$('#myTable').dataTable();
	});
</script>


<div id="forum" class="table-responsive">
	<h2 style="color: blue; font-size: 35px;">All Forums</h2>

	
			<table id="myTable" class="display table">
				<thead>
					<tr>
						<th>Forum Id</th>
						<th>Forum Title</th>
						<th>Forum Content</th>
						<th>Forum User Name</th>
						<th>Forum date and time</th>
						<th>Forum Category</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${forum.forumid}</td>
						<td>${forum.forumtitle}</td>
						<td>${forum.forumcontent}</td>
						<td>${forum.forumUserName}</td>
						<td>${forum.creationdatetime}</td>
						<td>${forum.category}</td>
						<td><a
							href="<spring:url value="/deleteforum?forumId=${forum.forumid}" />"
							class="btn btn-warning"> <span
								class="glyphicon-info-sign glyphicon"> </span> Delete
						</a> <a
							href="<spring:url value="/editforum?forumId=${forum.forumid}" />"
							class="btn btn-warning"> <span
								class="glyphicon-info-sign glyphicon"> </span> edit
						</a></td>
					</tr>
				</tbody>

			</table>
	
		<p>
			Please <a href="<c:url value="/login" />">Sign in</a> to post comment
		</p>

</div>

