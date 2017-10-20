app.factory('webpages', ['$http',  function($http) {
	return
	$http.get('http://localhost:3000/webpages.json')
		.sucess(function(data) {
			return data;
		})
		.error(function(data) {
			return data;
		});
}]);