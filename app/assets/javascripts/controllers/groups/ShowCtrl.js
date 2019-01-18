this.app.controller('GroupsShowCtrl', ['$scope', 'Dialog', '$rootScope', '$filter', '$window', '$controller', 'Dialog', '$timeout', '$location', function ($scope, Dialog, $rootScope, $filter, $window, $controller, Dialog, $timeout, $location) {

    //Extend base controller
    angular.extend(this, $controller('GroupsBaseCtrl', {$scope: $scope}));

    var config = {
        show: {
            returnName: 'group',
            attributes: ["id"],
            alwaysDoRequest: true,
            breadcrumb: 'area',
            tabs: [
                {
                    label: 'general',
                    view: 'static/groups/_show'
                }
            ],
            actions: [
                {
                    name: 'remove',
                    icon: 'delete',
                    class: '\'red-btn\'',
                    condition: '!object.deleted_at',
                    function: 'destroy(loadingPromise, object)'
                }
            ]
        }
    };

    //Merge base config with controller config
    $scope.resourceConfig = angular.merge($scope.resourceConfig, config);

    //Extend concerns
    angular.extend(this, $controller('ShowConcern', {$scope: $scope}));

    if (!$scope.dialogMode && !$scope.onList) {
        $scope.get().then(function () {
        });
    }

}]);