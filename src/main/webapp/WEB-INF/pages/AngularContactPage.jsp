<%@ include file="header.jsp" %>

<html>
<head>
<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/prettyPhoto.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/responsive.css" rel="stylesheet">
<link href="resources/css/Freebar.min.css" rel="stylesheet">
<script>
<script type="text/javascript">
</script>
</head>

<br>
<br>
<div class="container">
 <c:if test="${pageContext.request.userPrincipal.name == null}"> 
<div align="justify" >
<p align="left">ACT US 
<p>Get In Touch</p>
<p>
As a student of NIIT, for any kind of assistance, you can contact the Student Services Advisor (SSA) /Faculty /GL /Centre Head at your NIIT Education centre.
For sharing your Complaint, login to <a href="www.niitstudent.com">www.niitstudent.com/india</a>. Use Complaints link, select applicable category and submit your Complaint.
If you are not able to login to <a href="www.niitstudent.com">www.niitstudent.com/india</a>, write to <a href="wecare@niitstudent.com">wecare@niitstudent.com</a></p>
       
       <p> - Please note any other query will not be responded by this mail ID</p>
 
<p align="justify">If you are not a student of NIIT and wish to have information about our IT courses and Centres, you may write to careercourses@niit.com or call at our tollfree numbers :</p> 
<p>1800 180 6448 (BSNL/ MTNL) or 1800 102 6448 (Airtel)</p>

 </div>
 <br>
 <br>
<p>NIIT Head Office:</p>
<p>NIIT Ltd,</p>
<p>Plot No. 85, Sector-32,	</p>
<p>Gurgaon, Haryana - 122001,</p>
<p>India</p>
<p>Tel: 91-124-429 3000</p>
 <p><a href="www.niit.com">www.niit.com</a></p>
</c:if>
</div>

<div ng-controller="AngularContactController as personCtrl" ng-app="myApp" class="container"  align="center" >  
		<form name="personForm" method="POST">
		<br>
		 <c:if test="${pageContext.request.userPrincipal.name == null}"> 
	    <table class="table table-bordered table-striped">		
		<tr><td colspan="2">
		  <div ng-if="personCtrl.flag != 'edit'">
		     <h2 align="center"> <p align="center">Please Add your Contact</p>	 </h2> 
		  </div>
		  <div ng-if="personCtrl.flag == 'edit'">
		     <h3> Update Contact for ID: {{ personCtrl.person.id }} </h3> 
		  </div> </td>
		</tr>	
					
	<!-- 	<tr>
		<td> Category</td>
	<td><select ng-model="personCtrl.person.category" ng-options="x for x in names"></select></td>
		</tr> -->		

		<tr>
		      <td>Name: </td> <td><input placeholder="ABC abc" type="text" name="contactname" ng-model="personCtrl.person.contactname"  required ng-pattern="/^[a-zA-Z\s]*$/"/> 
             <span ng-show="personForm.contactname.$error.required" class="msg-val">name is required.</span>   
             <span ng-show="personForm.contactname.$error.pattern" class="error">Text only please</span>  
             </td>
		</tr>
		
		<tr>
		   <td>Email: </td>
		    <td> 
		   <input type="email" placeholder="abc@xyz.com" name="email" ng-model="personCtrl.person.email" required></textarea> 
	       <!--<span ng-show="personForm.email.$error.required" class="msg-val">email is required.</span>--> 
	       <span ng-show="personForm.email.$error.required" class="msg-val">email is required.</span>	     
   		   <span class="error" data-ng-show="personForm.email.$error.email">Not valid email!</span>
   		   </td>
		</tr>		
		
		<tr>
		      <td>Address: </td> <td> <textarea rows="4" cols="50" name="address"  ng-model="personCtrl.person.address" required></textarea> 
	          <span ng-show="personForm.address.$error.required" class="msg-val">address is required.</span> </td>
		</tr>
				
		<tr>
		    <!--<td>Telephone: </td> <td> <input type="text" name="telephone" ng-model="personCtrl.person.telephone"   ng-minlength = "10"
                ng-maxlength = "10" ng-pattern="regEx" required></textarea> 
	          <span ng-show="personForm.telephone.$error.required ||personForm.telephone.$error.number" class="msg-val">valid telephone is required.</span>	          
	          </td>-->
	<td>Phone No.:</td>
    <td>    
      <input type="text" placeholder="+91-636-78658" name="telephone" ng-pattern="phoneNumbr" ng-model="personCtrl.person.telephone" required />
      <span ng-show="personForm.telephone.$error.required" class="msg-val">phone is required.</span>
      <!-- <span class="error" data-ng-show="personForm.telephone.$error.required" >Required!</span> --> 
      <span class="error" data-ng-show="personForm.telephone.$error.minlength">Phone no not less that 10 char.</span>
      <span class="error" ng-show="personForm.telephone.$error.maxlength">Phone no not more than 11 char.</span>
      <br><span class="error" ng-show="personForm.telephone.$error.pattern">Please match pattern [+91-036-78658 || 91-036-78658]</span>
   </td>
		</tr>
		<tr>
		     <td colspan="2"> 
		     <span ng-if="personCtrl.flag=='created'" class="msg-success">Contact successfully added.</span>
		   <!--   <span ng-if="personCtrl.flag=='failed'" class="msg-val">some issue</span> -->
		       <span ng-if="personCtrl.flag=='updated' && row.pid==personCtrl.updatedId" class="msg-success">Contact successfully updated.</span>  
		     </td>		     
		</tr>
	        <tr>
	        
	        <td colspan="2">
	           <div ng-if="personCtrl.flag != 'edit'" align="center">
		       <input  type="submit" ng-click="personCtrl.addPerson()" value="Add Contact"/> 
		       <input type="button" ng-click="personCtrl.reset()" value="Reset"/>
		    </div>
		    
		    <div ng-if="personCtrl.flag == 'edit'" align="center">
		       <input  type="submit" ng-click="personCtrl.updatePersonDetail()" value="Update Contact"/> 	
			   <input type="button" ng-click="personCtrl.cancelUpdate()" value="Cancel"/>				   
		    </div> </td>
		    
		</tr>
		
	    </table>
	    </c:if>
	
	    </form>     

   <c:if test="${pageContext.request.userPrincipal.name =='admin'}"> 
    <input  ng-model="q" id="search" class="form-control" placeholder="Filter text">
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
            Contact Id 
            <span ng-show="sortType == 'id' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'id' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'contactname'; sortReverse = !sortReverse">
           Contact Name
            <span ng-show="sortType == 'contactname' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'contactname' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'email'; sortReverse = !sortReverse">
          Email
            <span ng-show="sortType == 'email' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'email' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'address'; sortReverse = !sortReverse">
          Address
            <span ng-show="sortType == 'address' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'address' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'telephone'; sortReverse = !sortReverse">
          telephone
            <span ng-show="sortType == 'telephone' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'telephone' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'date'; sortReverse = !sortReverse">
           creationdatetime
            <span ng-show="sortType == 'date' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'date' && sortReverse" class="fa fa-caret-up"></span>
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
	         <td><span ng-bind="row.id"></span></td>
	         <td><span ng-bind="row.contactname"></span></td>
	         <td><span ng-bind="row.email"></span></td>
	         <td><span ng-bind="row.address"></span></td>
	         <td><span ng-bind="row.telephone"></span></td>
	         <!--<td><span ng-bind="row.creationdatetime"></span></td>  -->
	         <td> {{row.date |  date:"yyyy-MM-dd AT HH:mm:ss"}}</td>
	        <!--   <td><span ng-bind="row.category"></span></td>-->
	         <td>

				 <input type="button" ng-confirm-click="Are you sure to delete this record ?" confirmed-click="personCtrl.deletePerson(row.id)" value="Delete"/>

        <br />
        <br />
        <span ng-bind = "Message"></span>
		    </td>
		    <tr>
		     <td colspan="2"> <span ng-if="personCtrl.flag=='deleted'" class="msg-success">Contact successfully deleted.</span>
		</tr>   
		  	 
	      <tr>	
	    
      <button ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1">Previous</button>
	 {{currentPage+1}}/{{numberOfPages()}}
 		<button ng-disabled="currentPage >= getData().length/pageSize - 1" ng-click="currentPage=currentPage+1">Next</button>
    		
    </tr>
    </tbody>
	      
	</table>
	</c:if>

</div>
	
    <script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/angular-resource.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/contactapp.js"></script>

</html>  
  