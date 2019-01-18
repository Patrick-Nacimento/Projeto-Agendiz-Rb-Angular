this.app.controller('MenuCtrl', ['$scope', '$rootScope', '$controller', '$location', '$auth', '$route', '$filter', 'menuConfig', function ($scope, $rootScope, $controller, $location, $auth, $route, $filter, menuConfig) {

    $scope.showMenu = false;
    $scope.menu = {};

    function buildMenu(user) {
        $scope.menu = {};

        //Shared
        var menu = {
            modules: {
                items: {
                    dashboard: {
                        icon: 'dashboard',
                        permissionValidate: true
                    },
                    groups: {
                        icon: 'group_add',
                        permissionValidate: false
                    },
                    interns: {
                        icon: 'school',
                        permissionValidate: false
                    },
                    recruiters: {
                        icon: 'group',
                        permissionValidate: false
                    }
                }
            }
        };

        $scope.menu = menu;
    };

    $auth.validateUser().then(function (user) {
        buildMenu(user);
    });

    // open/close expandable menu (sub-menu)
    $scope.accordion = function (params) {
        if (params.active) {
            params.active = false;
        } else {
            params.active = true;
        }
    };

    $scope.isActive = function (path, parent) {
        if (path == '/' && $location.path() == '/') {
            return true;
        } else if (path != '/' && ($location.path().substr(1).indexOf(path.substr(1)) > -1 || $location.path().substr(1).indexOf(path) > -1)) {
            if (parent) {
                parent.active = true;
            }
            return true;
        } else {
            return false;
        }
    };

    $scope.hrefLocation = function (param, clearSearch, params) {
        if ($location.path() == param || $location.path() == ('/' + param)) {
            $rootScope.clearSearch();

            return $route.reload();
        } else {
            $rootScope.hrefLocation(param, true);
        }
    };

}]);