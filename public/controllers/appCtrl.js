var app=angular.module('baby_parts',['ngResource', 'ngRoute']);

app.config(function($routeProvider) {
	 $routeProvider
     .when('/', {
       redirectTo:'/login'
     })
	 .when('/login', {
       templateUrl: 'login.html',
      }) ;
      /*    .when('/profile', {
       templateUrl: 'profile.html',
      })
      .when('/home', {
       templateUrl: 'home.html',
      })
      .when('/orders', {
       templateUrl: 'orders.html',
      })
      .when('/add-parts', {
       templateUrl: 'add-parts.html',
      })
      .when('/parts-list', {
       templateUrl: 'parts-list.html',
      })
      .when('/add-users', {
       templateUrl: 'add-users.html',
      })
      .when('/add-collection', {
       templateUrl: 'add-collection.html',
      })
      .when('/users-list', {
       templateUrl: 'users-list.html',
      })
      .when('/collection-list', {
       templateUrl: 'collection-list.html',
      });*/
      
}); 

	   
