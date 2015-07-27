bugTrackingAngular.controller("ProductsCtrl", ['userRepository','$scope', '$http', '$location', '$sce', '$routeParams', 'messageCenterService', function(userRepository,$scope, $http, $location, $sce, $routeParams, messageCenterService){

  $scope.find = function(){
    $http.get('/products').success(function(products){
      console.log(products)
      for(var i=0; i< products.length; i++)
      {
        var html = '<tr><td>'+ products[i].productId +'</td><td>'+ products[i].name +'</td><td>'+ products[i].sku +'</td><td>'+ products[i].medium_image +'</td></tr>';
        $("#tbody").append(html);
      }
      $scope.products = products
    }).error(function(products) {
      $scope.error = products.message;
    });
  };

  $scope.import = function(){
    $http.get('/products/import').success(function(response1){
      $location.path('/products')
    }).error(function(response1) {
      $scope.error = response1.message;
    });
  };

  $scope.authBigcommerce = function(){
    window.location.href= "/auth/bigcommerce"
  }
  

}]);


