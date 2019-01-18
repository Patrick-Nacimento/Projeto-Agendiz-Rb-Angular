this.app.controller('RecruitersIndexCtrl', ['$scope', '$rootScope', '$controller', '$location', '$filter', 'Update', 'Flash', function ($scope, $rootScope, $controller, $location, $filter, Update, Flash) {
    //Extend base controller
    angular.extend(this, $controller('RecruitersBaseCtrl', {$scope: $scope}));

    var config = {
        index: {
            returnName: 'recruiters',
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
                    name: 'description',
                    value: 'object.description',
                    orderBy: 'description'
                },
                {
                    name: 'cnpj',
                    value: 'object.cnpj',
                    orderBy: 'cnpj'
                },
                {
                    name: 'telephone',
                    value: 'object.telephone',
                    orderBy: 'telephone'
                },
            ],
            new: {
                view: 'static/recruiters/_new',
                ctrl: 'RecruitersNewCtrl',
                actions: []
            },
            show: {
                click: "hrefLocation(('routes.modules.recruiter' | translate) + object.id)",
                ctrl: 'RecruitersShowCtrl'
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