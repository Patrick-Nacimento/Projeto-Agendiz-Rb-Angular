this.app.controller('GroupsBaseCtrl', ['$scope', '$rootScope', '$filter', 'Group', function ($scope, $rootScope, $filter, Group) {

    //Verify if already exists to never override the existent
    if (!$scope.resourceConfig) {
        $scope.resourceConfig = {
            identifier: 'groups', //broadcast event name identifier
            translationBase: "groups",
            permissionBase: "groups",
            routeBase: $filter('translate')('routes.modules.groups'),
            model: Group,
            icon: 'people',
            male: true,
            routeParamsList: {},
            routeParams: {},
            permittedActions: {
                show: true,
                create: true,
                update: true
            },
            mainPermittedParam: 'group', // check backend returns
            createUpdateParams: {
                group: {
                    area: 'object.area',
                    recruiter_id: 'object.recruiter.id'
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
