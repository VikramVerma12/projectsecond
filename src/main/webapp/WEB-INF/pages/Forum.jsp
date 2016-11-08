
<%@ include file="header.jsp" %>
<%@ page language="java"  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<CENTER>DGINIXT FORUM PAGE</CENTER>
	<form:form method="POST" action="postF" commandName="forum">
		<table>
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
			<tr>
				<td>Title :</td>
				</tr>
				<td><form:input path="forumtitle"  width="50"/></td>
			</tr>
			<tr>
				<td>Content :</td>
				</tr>
				<tr>
				<td><form:textarea path="forumcontent" rows="20" cols="150"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Post"></td>
			</tr>		
		</table>
	</form:form>

<script	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>