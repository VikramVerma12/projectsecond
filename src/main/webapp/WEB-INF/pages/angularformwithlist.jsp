
    <%@ include file="header.jsp" %>

<html>
<head>
<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


</head>


   <div ng-controller="PersonController as personCtrl" ng-app="myApp" class="container"  align="center"  > 
   
		<form name="personForm" method="POST">
		<br>
		
	    <table class="table table-bordered table-striped">		
		<tr><td colspan="2">
		  <div ng-if="personCtrl.flag != 'edit'">
		     <h3 align="center"> Add Forum </h3> 
		  </div>
		  <div ng-if="personCtrl.flag == 'edit'">
		     <h3> Update Forum for ID: {{ personCtrl.person.forumid }} </h3> 
		  </div> </td>
		</tr>		
		<tr>
		<td> Category</td>
	<td><select ng-model="personCtrl.person.category" ng-options="x for x in names"></select></td>
		</tr>
		<tr>
		      <td>Title: </td> <td><input type="text" name="forumtitle" ng-model="personCtrl.person.forumtitle" required/> 
             <span ng-show="personForm.forumtitle.$error.required" class="msg-val">Title is required.</span>    
             </td>
		</tr>
		<tr>
		      <td>Content: </td> <td> <textarea rows="4" cols="50" name="forumcontent" ng-model="personCtrl.person.forumcontent" required></textarea> 
	          <span ng-show="personForm.forumcontent.$error.required" class="msg-val">Content is required.</span> </td>
		</tr>
		<tr>
		     <td colspan="2"> 
		     <span ng-if="personCtrl.flag=='created'" class="msg-success">Forum successfully added.</span>
		     <span ng-if="personCtrl.flag=='failed'" class="msg-val">Forum already exists.</span>
		       <span ng-if="personCtrl.flag=='updated' && row.pid==personCtrl.updatedId" class="msg-success">Person successfully updated.</span>  
		     </td>		     
		</tr>
	        <tr>
	        
	        <td colspan="2">
	           <div ng-if="personCtrl.flag != 'edit'" align="center">
		       <input  type="submit" ng-click="personCtrl.addPerson()" value="Add Forum"/> 
		       <input type="button" ng-click="personCtrl.reset()" value="Reset"/>
		    </div>
		    
		    <div ng-if="personCtrl.flag == 'edit'" align="center">
		       <input  type="submit" ng-click="personCtrl.updatePersonDetail()" value="Update Forum"/> 	
			   <input type="button" ng-click="personCtrl.cancelUpdate()" value="Cancel"/>				   
		    </div> </td>
		</tr>
		<tr>
		     <td colspan="2"> <span ng-if="personCtrl.flag=='deleted'" class="msg-success">Forum successfully deleted.</span>
		</tr>
	    </table>
	    </form>     

	
    

   <!--  <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search forum title" ng-model="searchFtitle">      
       </div>      
    </div> -->
    
    <input ng-model="q" id="search" class="form-control" placeholder="Filter text">
  <select ng-model="pageSize" id="pageSize" class="form-control">
        <option value="5">5</option>
        <option value="10">10</option>
        <option value="15">15</option>
        <option value="20">20</option>
     </select>
	      <table class="table table-bordered table-striped" id="myTable" align="center" > 
	         
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
    <td><a href="#" ng-click="sortType = 'choice'; sortReverse = !sortReverse">
          Your Choice
            <span ng-show="sortType == 'choice' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'choice' && sortReverse" class="fa fa-caret-up"></span>
          </a>
 
    </td>  
      </tr>
    </thead>
    <tbody>
	       <tr ng-repeat="row in personCtrl.persons |filter:q|orderBy:sortType:sortReverse | filter:searchFtitle |startFrom:currentPage*pageSize | limitTo:pageSize">
	         <td><span ng-bind="row.forumid"></span></td>
	         <td><span ng-bind="row.forumtitle"></span></td>
	         <td><span ng-bind="row.forumcontent"></span></td>
	         <td><span ng-bind="row.forumUserName"></span></td>
	         <!--<td><span ng-bind="row.creationdatetime"></span></td>  -->
	         <td> {{row.creationdatetime |  date:"yyyy-MM-dd AT HH:mm:ss"}}</td>
	         <td><span ng-bind="row.category"></span></td>
	         <td>
		 <!--  <input type="button" ng-click="personCtrl.deletePerson(row.forumid)" value="Delete"/> -->  
		   				 <input type="button" ng-confirm-click="Are you sure to delete this record ?" confirmed-click="personCtrl.deletePerson(row.forumid)" value="Delete"/>
   
    <c:if test="${row.forumUserName != 'admin'}">
   <input type="button" ng-click="personCtrl.editPerson(row.forumid)" value="Edit"/>
    </c:if>
 
		    </td>
		
		  
	      </tr>
	      <tr>	
	    
	      <button ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1">Previous</button>
   			 {{currentPage+1}}/{{numberOfPages()}}
    		<button ng-disabled="currentPage >= getData().length/pageSize - 1" ng-click="currentPage=currentPage+1">Next</button>
    		
    </tr>
	      </tbody>
	      
	</table>
</div>
	
    <script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/angular-resource.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>



</html>  
  