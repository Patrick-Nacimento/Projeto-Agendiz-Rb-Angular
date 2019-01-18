this.app.controller('GroupsIndexCtrl', ['$scope', '$rootScope', '$controller', '$location', '$filter', 'Update', 'Flash', function ($scope, $rootScope, $controller, $location, $filter, Update, Flash) {
    //Extend base controller
    angular.extend(this, $controller('GroupsBaseCtrl', {$scope: $scope}));

    var config = {
        index: {
            returnName: 'groups',
            dataTablePartial: $rootScope.appPartials.resources.index.dataTable,
            type: 'dataTable',
            fluid: true,
            attributes: ['id', 'name'],
            params: {
                sort_property: 'id',
                sort_direction: 'asc'
            },
            per_page: 25,
            dataTableStartConfig: {
                rowLimits: [25, 50, 75]
            },
            inactiveCondition: 'object.deleted_at',
            columns: [
                {
                    name: 'area',
                    value: 'object.area',
                    orderBy: 'area'
                },
                {
                    name: 'recruiter_id',
                    value: 'object.recruiter_id',
                },
            ],
            new: {
                view: 'static/groups/_new',
                ctrl: 'GroupsNewCtrl',
                actions: []
            },
            show: {
                click: "hrefLocation(('routes.modules.group' | translate) + object.id)",
                ctrl: 'GroupsShowCtrl'
            },
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
    angular.extend(this, $controller('IndexConcern', {$scope: $scope}));

    //Start list
    $scope.start();

}]);