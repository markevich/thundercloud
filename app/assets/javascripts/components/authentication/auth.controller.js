(function(angular){

  function AuthenticationsController($scope, AuthenticationModel){
    var vm = this;
    vm.auth = auth;

    function auth(){
      AuthenticationModel.save({login: vm.login, password: vm.password}).$promise.
        then(function(user){
          vm.user = user
        }, function(error){
          vm.user = error.data
        })
    }
  }

  AuthenticationsController.$inject = ['$scope', 'AuthenticationModel'];

  angular.module('app').
    component('authenticationsController', {
      template: 'ODJF {{vm.user}} OISDJLFSKDFJ<input ng-model="vm.login" type="text" placeholder="login"></input><input ng-model="vm.password" type="text" placeholder="password"></input><button ng-click="vm.auth()"></button>',
      controller: AuthenticationsController,
      controllerAs: 'vm'
    })
})(angular)
