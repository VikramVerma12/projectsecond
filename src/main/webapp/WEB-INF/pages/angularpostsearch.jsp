
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blog Information - Converting GSON to JSON</title>

<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
<script>
var app = angular.module('myApp', []);
 
function MyController($scope, $http) {

	 $scope.sortType = 'name'; // set the default sort type
	  $scope.sortReverse = false;  // set the default sort order
	  $scope.searchFtitle = '';
	  
        $scope.getDataFromServer = function() {
                $http({
                        method : 'GET',
                        url : 'GsonCon2'
                }).success(function(data, status, headers, config) {
                        $scope.post = data;  
                }).error(function(data, status, headers, config) {
                        // called asynchronously if an error occurs
                        // or server returns response with an error status.
                });
        };
};



</script>
</head>
<body>

<div class="container" ng-app="myApp" ng-controller="MyController" ng-init="getDataFromServer()">
  
  <form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search forum title" ng-model="searchFtitle">      
       </div>      
    </div>
  </form>
  
  <table class="table table-bordered table-striped">
    
    <thead>
      <tr>
      <td>
          <a href="#" ng-click="sortType = 'id'; sortReverse = !sortReverse">
           Post id 
            <span ng-show="sortType == 'id' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'id' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'title'; sortReverse = !sortReverse">
            Post title
            <span ng-show="sortType == 'title' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'title' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'content'; sortReverse = !sortReverse">
     Post Content
            <span ng-show="sortType == 'content' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'content' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
    
        <td>
          <a href="#" ng-click="sortType = 'postUser'; sortReverse = !sortReverse">
       Post User Name
            <span ng-show="sortType == 'postUser' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'postUser' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>  
        
        <td>
          <a href="#" ng-click="sortType = 'creationdatetime'; sortReverse = !sortReverse">
        Post Date and Time
            <span ng-show="sortType == 'creationdatetime' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'creationdatetime' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
    
    <td>
    Your Choice
    </td>
        
      </tr>
    </thead>
    
    <tbody>

      <tr ng-repeat="roll in post | orderBy:sortType:sortReverse | filter:searchFtitle">
           		<td>{{roll.id}}</td>
           		<td>{{roll.title}}</td>
           		<td>{{roll.content}}</td>
           		<td>{{roll.postUser}}</td>
           		<td>{{roll.creationdatetime}}</td>
           		
           		 <td>
         
  <a href="<spring:url value="/deleteforum?forumId=${{roll.id}}" />" 
 class="btn btn-warning"> <span class="glyphicon-info-sign glyphicon"> </span> Delete</a>
 <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
 <a href="<spring:url value="/editforum?forumId=${{roll.id}}" />"
class="btn btn-warning"> <span class="glyphicon-info-sign glyphicon"> </span> edit	</a>
</c:if>
</td>
      </tr>
    </tbody>
    
  </table>
  
</div>

</body>
</html>s