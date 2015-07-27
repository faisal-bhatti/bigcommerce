'use strict';
window.bugTrackingAngular = angular.module('bugTrackingAngular', ['ngRoute', 'ngResource', 'ngSanitize', 'templates', 'mgcrea.ngStrap', 'ngCookies', 'MessageCenterModule']);

bugTrackingAngular.run([
  '$rootScope', function($rootScope) {
    $rootScope.Configuration = {
      baseUrl: "app/v1"
    };
    $rootScope.search_by = "";
  }
]);