this.app.controller('RecruitersBaseCtrl', ['$scope', '$rootScope', '$filter', 'Recruiter', function ($scope, $rootScope, $filter, Recruiter) {

    //Verify if already exists to never override the existent
    if (!$scope.resourceConfig) {
        $scope.resourceConfig = {
            identifier: 'recruiters', //broadcast event name identifier
            translationBase: "recruiters",
            permissionBase: "recruiters",
            routeBase: $filter('translate')('routes.modules.recruiters'),
            model: Recruiter,
            icon: 'people',
            male: true,
            routeParamsList: {},
            routeParams: {},
            permittedActions: {
                show: true,
                create: true,
                update: true
            },
            mainPermittedParam: 'recruiter', // check backend returns
            createUpdateParams: {
                recruiter: {
                    description: 'object.description',
                    cnpj: 'object.cnpj',
                    telephone: 'object.telephone'
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
