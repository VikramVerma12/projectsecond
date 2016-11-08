var app = angular.module('myApp', ['ngResource']);

app.factory('Contact', ['$resource', function ($resource) {
    return $resource('http://localhost:8089/SocialNetworking/info2/person/:personId', {personId: '@id'},
	{
		updatePerson: {method: 'PUT'}
	}
    );
}]);

app.directive('ngConfirmClick', [
                                 function(){
                                     return {
                                         link: function (scope, element, attr) {
                                             var msg = attr.ngConfirmClick || "Are you sure?";
                                             var clickAction = attr.confirmedClick;
                                             element.bind('click',function (event) {
                                                 if ( window.confirm(msg) ) {
                                                     scope.$eval(clickAction)
                                                 }
                                             });
                                         }
                                     };
                             }])
                             
app.controller('AngularContactController', ['$scope', 'Contact','$filter', function($scope,Contact,$filter,$window)   
{
 
	var ob = this;
   // $scope.format = 'M/d/yy h:mm:ss a';
   // $scope.names = ["Oracle", "Java", "DT","Digital Marketing"]
    $scope.phoneNumbr = /^\+?\d{2}[- ]?\d{3}[- ]?\d{5}$/;
    $scope.NameUser ="/^[a-zA-Z\s]*$/"
    ob.persons=[];
    ob.person = new Contact(); 
    
    ob.fetchAllPersons = function(){
    ob.persons = Contact.query();    
    };
    
    $scope.removeUser = function(index) {
        vm.users.splice(index, 1);
    }
    
    ob.fetchAllPersons();
    
    ob.addPerson = function(){
	console.log('Inside save');
	if($scope.personForm.$valid) {
	  ob.person.$save(function(person){
	     console.log(person); 
	     ob.flag= 'created';	
	     ob.reset();	
	     ob.fetchAllPersons();
	  },
	  function(err){
	     console.log(err.status);
	     ob.flag='failed';
	  }
          );
        }
    }; 
  
    ob.editPerson = function(id){
	    console.log('Inside edit');
        ob.person = Contact.get({ personId: id}, function() {
	    ob.flag = 'edit'; 
	    });
    };    
    
    
    ob.updatePersonDetail = function(){
	console.log('Inside update');
	if($scope.personForm.$valid) {
        ob.person.$updatePerson(function(person){
    	console.log(person); 
		ob.updatedId = person.pid;
		ob.reset();
		ob.flag = 'updated'; 
    	ob.fetchAllPersons();
           });
	}
    };	
   
  
   
    
    ob.deletePerson = function(id){	    
	    	 ob.person = Contact.remove({ personId: id}, function() {
	 			ob.reset();  
	 			ob.flag = 'deleted';
	 			ob.fetchAllPersons();
	 		    })	    	   
    };
    
    ob.reset = function(){
    	ob.person = new Contact();
        $scope.personForm.$setPristine();
    };	
    
    ob.cancelUpdate = function(id){
	    ob.person = new Contact();
	    ob.flag= '';	
   	    ob.fetchAllPersons();
    }; 
   
    
    $scope.currentPage = 0;
    $scope.pageSize = 10;
    $scope.data = [];
    $scope.q = '';

    $scope.getData = function () {
      // needed for the pagination calc
      // https://docs.angularjs.org/api/ng/filter/filter
      return $filter('filter')($scope.data, $scope.q)
  
    }

    $scope.numberOfPages=function(){
        return Math.ceil($scope.getData().length/$scope.pageSize);                
    }

    for (var i=0; i<65; i++) {
        $scope.data.push("Item "+i);
    }
  // A watch to bring us back to the 
  // first pagination after each 
  // filtering
$scope.$watch('q', function(newValue,oldValue){             if(oldValue!=newValue){
      $scope.currentPage = 0;
  }
},true);


//We already have a limitTo filter built-in to angular,
//let's make a startFrom filter
   
}]);    
app.filter('startFrom', function() {
    return function(input, start) {
        start = +start; //parse to int
        return input.slice(start);
    }
});
   