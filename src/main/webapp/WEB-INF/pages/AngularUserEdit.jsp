
    <%@ include file="header.jsp" %>

<html>
<head>
<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


</head>


   <div ng-controller="AngularPostController as personCtrl" ng-app="myApp" class="container"  align="center"  > 
   
		<form name="personForm" method="POST">
		<br>
		
	    <table class="table table-bordered table-striped">		
		<tr><td colspan="2">
		  <div ng-if="personCtrl.flag != 'edit'">
		     <h3 align="center"> Add Post </h3> 
		  </div>
		  <div ng-if="personCtrl.flag == 'edit'">
		     <h3> Update Post for ID: {{ personCtrl.person.id }} </h3> 
		  </div> </td>
		</tr>		
	<!-- 	<tr>
		<td> Category</td>
	<td><select ng-model="personCtrl.person.category" ng-options="x for x in names"></select></td>
		</tr> -->
		<tr>
		      <td>Title: </td> <td><input type="text" name="title" ng-model="personCtrl.person.title" required/> 
             <span ng-show="personForm.title.$error.required" class="msg-val">Title is required.</span>    
             </td>
		</tr>
		<tr>
		      <td>Content: </td> <td> <textarea rows="4" cols="50" name="content" ng-model="personCtrl.person.content" required></textarea> 
	          <span ng-show="personForm.content.$error.required" class="msg-val">Content is required.</span> </td>
		</tr>
		<tr>
		     <td colspan="2"> 
		     <span ng-if="personCtrl.flag=='created'" class="msg-success">Post successfully added.</span>
		     <span ng-if="personCtrl.flag=='failed'" class="msg-val">Post already exists.</span>
		       <span ng-if="personCtrl.flag=='updated' && row.pid==personCtrl.updatedId" class="msg-success">Post successfully updated.</span>  
		     </td>		     
		</tr>
	        <tr>
	        
	        <td colspan="2">
	           <div ng-if="personCtrl.flag != 'edit'" align="center">
		       <input  type="submit" ng-click="personCtrl.addPerson()" value="Add Person"/> 
		       <input type="button" ng-click="personCtrl.reset()" value="Reset"/>
		    </div>
		    
		    <div ng-if="personCtrl.flag == 'edit'" align="center">
		       <input  type="submit" ng-click="personCtrl.updatePersonDetail()" value="Update Person"/> 	
			   <input type="button" ng-click="personCtrl.cancelUpdate()" value="Cancel"/>				   
		    </div> </td>
		</tr>
		<tr>
		     <td colspan="2"> <span ng-if="personCtrl.flag=='deleted'" class="msg-success">Post successfully deleted.</span>
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
          <a href="#" ng-click="sortType = 'id'; sortReverse = !sortReverse">
            Post Id 
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
          <a href="#" ng-click="sortType = 'date'; sortReverse = !sortReverse">
          Post CreationDatetime
            <span ng-show="sortType == 'date' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'date' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
    
      <!--  <td>
          <a href="#" ng-click="sortType = 'category'; sortReverse = !sortReverse">
          Forum Category
            <span ng-show="sortType == 'category' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'category' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td> --> 
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
	         <td><span ng-bind="row.id"></span></td>
	         <td><span ng-bind="row.title"></span></td>
	         <td><span ng-bind="row.content"></span></td>
	         <td><span ng-bind="row.postUser"></span></td>
	         <!--<td><span ng-bind="row.creationdatetime"></span></td>  -->
	         <td> {{row.date |  date:"yyyy-MM-dd AT HH:mm:ss"}}</td>
	        <!--   <td><span ng-bind="row.category"></span></td>-->
	         <td>
		    <input type="button" ng-click="personCtrl.deletePerson(row.id)" value="Delete"/>
		    <input type="button" ng-click="personCtrl.editPerson(row.id)" value="Edit"/>
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
	<script src="${pageContext.request.contextPath}/resources/js/postapp.js"></script>



</html>  
  