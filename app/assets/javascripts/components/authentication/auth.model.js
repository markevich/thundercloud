(function(angular){
  angular.module('app').
    factory('AuthenticationModel', ['$resource', function($resource){
      return $resource('/api/tokens.json');
    }])
})(angular)

