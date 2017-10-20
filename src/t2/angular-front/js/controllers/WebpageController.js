app.controller('WebpageController', ['$scope', 'webpages', '$routeParams', function($scope, webpages, $routeParams) {
  webpages.success(function(data) {
    $scope.detail = data[$routeParams.id];
  });
}]);