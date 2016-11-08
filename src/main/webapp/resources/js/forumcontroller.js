'use strict';
 
App.controller('forumcontroller', ['$scope', 'Forum', function($scope, Forum) {
          var self = this;
          self.Forum= new Forum();
           
          self.Forums=[];
               
          self.fetchAllForums = function(){
              self.Forums = Forum.query();
          };
            
          self.createForum = function(){
              self.Forum.$save(function(){
                  self.fetchAllForums();
              });
          };
           
          self.updateForum = function(){
              self.Forum.$update(function(){
                  self.fetchAllForums();
              });
          };
 
         self.deleteForum = function(identity){
             var Forum = Forum.get({id:identity}, function() {
                  Forum.$delete(function(){
                      console.log('Deleting Forum with id ', identity);
                      self.fetchAllForums();
                  });
             });
          };
 
          self.fetchAllForums();
 
          self.submit = function() {
              if(self.Forum.id==null){
                  console.log('Saving New Forum', self.Forum);    
                  self.createForum();
              }else{
                  console.log('Upddating Forum with id ', self.Forum.id);
                  self.updateForum();
                  console.log('Forum updated with id ', self.Forum.id);
              }
              self.reset();
          };
               
          self.edit = function(id){
              console.log('id to be edited', id);
              for(var i = 0; i < self.Forums.length; i++){
                  if(self.Forums[i].id === id) {
                     self.Forum = angular.copy(self.Forums[i]);
                     break;
                  }
              }
          };
               
          self.remove = function(id){
              console.log('id to be deleted', id);
              if(self.Forum.id === id) {//If it is the one shown on screen, reset screen
                 self.reset();
              }
              self.deleteForum(id);
          };
 
           
          self.reset = function(){
              self.Forum= new Forum();
              $scope.myForm.$setPristine(); //reset Form
          };
 
      }]);