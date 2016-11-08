

angular.module('sortApp', [])

.controller('mainController', function($scope) {
  
  $scope.searchFish   = '';     
  
  // create the list of sushi rolls 
  $scope.sushi = [
                  {"productId" : 1001,"groupName" :"Classic","Name" : "Piyano","Price" : 3000,"Quantity": 4,"Desc" : "This is an instrument"},
                  {"productId" : 1001,"groupName" :"Classic","Name" : "Piyano","Price" : 3000,"Quantity": 4,"Desc" : "This is an instrument"},
                  {"productId" : 1001,"groupName" :"Classic","Name" : "Piyano","Price" : 3000,"Quantity": 4,"Desc" : "This is an instrument"},
                  {"productId" : 1001,"groupName" :"Classic","Name" : "Piyano","Price" : 3000,"Quantity": 4,"Desc" : "This is an instrument"},
                	
                ]
  
});