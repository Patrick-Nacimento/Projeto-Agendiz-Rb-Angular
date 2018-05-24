this.app.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'static/dashboard/index',
            controller: 'DashboardCtrl',
            resolve: authRouteResolverLogged(null, ['dashboard']),
            reloadOnSearch: false
        })
        .when('/dashboard', {
            templateUrl: 'static/dashboard/index',
            controller: 'DashboardCtrl',
            resolve: authRouteResolverLogged(null, ['dashboard']),
            reloadOnSearch: false
        })
        .when('/acesso/administradores', {
            templateUrl: routeIndexView,
            controller: 'AdministratorsIndexCtrl',
            resolve: authRouteResolverLogged(null, ['administrators']),
            reloadOnSearch: false
        })
        .when('/acesso/administradores/:id', {
            templateUrl: routeShowView,
            controller: 'AdministratorsShowCtrl',
            resolve: authRouteResolverLogged(null, ['administrators']),
            reloadOnSearch: false
        })
        // .when('/configuracoes', {
        //     templateUrl: 'static/settings/show',
        //     controller: 'SettingsShowCtrl',
        //     resolve: authRouteResolverLogged(null, ['settings']),
        //     reloadOnSearch: false
        // })
}]);