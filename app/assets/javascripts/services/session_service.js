bugTrackingAngular.factory('userRepository', function ($http) {
  return {
    getInformation: function () {
      var url = 'http://www.samplestore.io/api/v1/products/?pageNumber='+2+'&pageSize='+20;
      return $http.jsonp(url, {
          params: {
            callback: 'JSON_CALLBACK',
            format:'json'
          }
      });
    }
  }
});
