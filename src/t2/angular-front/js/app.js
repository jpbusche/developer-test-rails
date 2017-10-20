var app = angular.module('Webbing', [ngRoute]);
app.config(function ($routeProvider) {
	$routeProvider
	  .when('/', {
	  	controller: 'HomeController',
	  	templateUrl: 'views/home.html'
	  })
	  .when('/webpages/:id', {
	  	controller: 'WebpageController',
	  	templateUrl: 'views/webpage.html'
	  })
	  .otherwise({
	  	redirectTo: '/'
	  });
});