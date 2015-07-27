etcRouterConfig =  ['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/', {templateUrl:'home/index.html'})
    .otherwise({redirectTo: "/" });

  // use the HTML5 History API
  $locationProvider.html5Mode(true);   
}];
bugTrackingAngular.config(etcRouterConfig);


bugTrackingAngular.run([
  '$rootScope', function($rootScope) {
    $rootScope.addMinutes = function(date, minutes) {
      return new Date(date + minutes * 60000);
    };
    $rootScope.getTime = function(timestamp, duration_hours) {
      var end_time, start_time, time;
      start_time = moment(timestamp).format(I18n.t('format.dates.seminar_start_time'));
      end_time = moment($rootScope.addMinutes(timestamp, duration_hours * 60)).format(I18n.t('format.dates.seminar_end_time'));
      time = start_time + " to " + end_time;
      return time;
    };
    return $rootScope.equals = function(a, b) {
      return angular.equals(a, b);
    };
  }
]);