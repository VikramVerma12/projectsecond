
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
        $scope.getDataFromServer = function() 
        {
                $http({
                        method : 'GET',
                        url : 'GsonCon1'
                }).success(function(data, status, headers, config) {
                        $scope.forum = data;  
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
          <a href="#" ng-click="sortType = 'forumid'; sortReverse = !sortReverse">
            Forum id 
            <span ng-show="sortType == 'forumid' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'forumid' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'forumtitle'; sortReverse = !sortReverse">
            Forum title
            <span ng-show="sortType == 'forumtitle' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'forumtitle' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'forumcontent'; sortReverse = !sortReverse">
          ForumContent
            <span ng-show="sortType == 'forumcontent' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'forumcontent' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'forumUserName'; sortReverse = !sortReverse">
          Forum User Name
            <span ng-show="sortType == 'forumUserName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'forumUserName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'creationdatetime'; sortReverse = !sortReverse">
          Forum CreationDatetime
            <span ng-show="sortType == 'creationdatetime' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'creationdatetime' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
    
        <td>
          <a href="#" ng-click="sortType = 'category'; sortReverse = !sortReverse">
          Forum Category
            <span ng-show="sortType == 'category' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'category' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
    <td>
    Your Choice
    </td>  
      </tr>
    </thead>
    
    <tbody>
      <tr ng-repeat="roll in forum | orderBy:sortType:sortReverse | filter:searchFtitle">
           		<td>{{roll.forumid}}</td>
           		<td>{{roll.forumtitle}}</td>
           		<td>{{roll.forumcontent}}</td>
           		<td>{{roll.forumUserName}}</td>
           		<td>{{roll.creationdatetime}}</td>
           		<td>{{roll.category}}</td>
           		 <td>     
           		
<p ng-if ="$pageContext.request.userPrincipal.name ==admin || $pageContext.request.userPrincipal.name ==$roll.forumUserName  ">
<a href="<spring:url value="/deleteforum?forumId=${roll.forumid}" />" 
class="btn btn-warning" > 
<span class="glyphicon-info-sign glyphicon"> </span> Delete </a>
</p>

<p ng-if =" $pageContext.request.userPrincipal.name ==$roll.forumUserName">
<a href="<spring:url value="/editforum?forumId=${roll.forumid}" />"
class="btn btn-warning" ng-if= "pageContext.request.userPrincipal.name ==forum.forumUserName"> 
<span class="glyphicon-info-sign glyphicon"> </span> edit	</a>  
</p>

</td>
</tr>
</tbody>    
</table>  
</div>
</body>
</html>