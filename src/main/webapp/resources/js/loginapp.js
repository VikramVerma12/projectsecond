'use strict';
 
// declare modules
angular.module('Authentication', []);
angular.module('Home', []);
 
angular.module('BasicHttpAuthExample', [
    'Authentication',
    'Home',
    'ngRoute',
    'ngCookies'
])
  
.config(['$routeProvider', function ($routeProvider) {
 
    $routeProvider
        .when('/AngularLogin', {
            controller: 'LoginController',
            templateUrl: 'WEB-INF/pages/AngularLogin.jsp'
        })
  
        .when('/', {
            controller: 'HomeController',
            templateUrl: 'WEB-INF/pages/home.html'
        })
  
        .otherwise({ redirectTo: '/AngularLogin' });
}])
  
.run(['$rootScope', '$location', '$cookieStore', '$http',
    function ($rootScope, $location, $cookieStore, $http) {
        // keep user logged in after page refresh
        $rootScope.globals = $cookieStore.get('globals') || {};
        if ($rootScope.globals.currentUser) {
            $http.defaults.headers.common['Authorization'] = 'Basic ' + $rootScope.globals.currentUser.authdata; // jshint ignore:line
        }
  
        $rootScope.$on('$locationChangeStart', function (event, next, current) {
            // redirect to login page if not logged in
            if ($location.path() !== '/AngularLogin' && !$rootScope.globals.currentUser) {
                $location.path('/AngularLogin');
            }
        });
    }]);