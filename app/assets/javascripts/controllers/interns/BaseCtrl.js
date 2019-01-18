this.app.controller('InternsBaseCtrl', ['$scope', '$rootScope', '$filter', 'Intern', function ($scope, $rootScope, $filter, Intern) {

    //Verify if already exists to never override the existent
    if (!$scope.resourceConfig) {
        $scope.resourceConfig = {
            identifier: 'interns', //broadcast event name identifier
            translationBase: "interns",
            permissionBase: "interns",
            routeBase: $filter('translate')('routes.modules.interns'),
            model: Intern,
            icon: 'people',
            male: true,
            routeParamsList: {},
            routeParams: {},
            permittedActions: {
                show: true,
                create: true,
                update: true
            },
            mainPermittedParam: 'intern', // check backend returns
            createUpdateParams: {
                intern: {
                    description: 'object.description',
                    age: 'object.age',
                    telephone: 'object.telephone',
                    quality: 'object.quality',
                    defect: 'object.defect',
                    group_id: 'object.group.id'
                }
            },
            createParams: {},
            updateParams: {},
            watchFields: [],
            enumerations: [],
            destroyRecoverAttribute: 'deleted_at',
            destroyedValue: true,
            recoveredValue: false
        };
    }

}]);
