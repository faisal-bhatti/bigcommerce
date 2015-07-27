bugTrackingAngular.controller("AppCtrl", ['$scope', '$http', '$location', function($scope, $http, $location){

  $scope.hideAlertMessage = function(event){
    $(this).parent().remove();
  }

  $scope.showLogout = function(){
    if (userSignedIn())
      return true
    else
      return false
  }
  $scope.logout = function() {
    $http.delete('/api/v1/sessions', {id: getCurrentUser().id}).success(function (response) {
      if (response.success == true){
        removeCurrentUser();
        $location.path("/");
      }  
      else{
        console.log("Something Going wrong in logout");
      }  
      return
    }).error(function (error) {
      "Error"
      // flash.error = I18n.t('js.messages.sign_out_fail')
      return
    });
    return
  };
}]);
