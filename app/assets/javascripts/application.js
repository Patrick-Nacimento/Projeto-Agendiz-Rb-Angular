// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require angular_base_material/application
//= require api_auth/route_resolvers
//= require api_auth/angular_base_material

//= require_self
//= require_tree .

this.app.constant('appConfig',
    {
        title: 'Project Base',
        primaryColor: '#454545',
        slogan: '',
        defaultLanguage: 'pt-BR',
        layout: {
            toolbar: true
        },
        //Used in back
        appId: 1,
        authkey: '94d97dfc8ea9b032cb88'
    }
);

this.app.constant('UserProfile',
    {
        admin: 1
    }
);

this.app.constant('panelPartials',
    {}
);

this.app.run(['$rootScope', '$location', 'appConfig', 'panelPartials', 'UserProfile', function ($rootScope, $location, appConfig, panelPartials, UserProfile) {
    $rootScope.panelPartials = panelPartials;

    $rootScope.authkey = '94d97dfc8ea9b032cb88';

    //Permission control,
    $rootScope.hasPermission = function (permission, user) {
        return true;
    };

    function is(usr, profile) {
        var user = usr || $rootScope.user;
        return (user && (user.profile == profile));
    };

    $rootScope.isAdmin = function (user) {
        return is(user, UserProfile.admin);
    };
}]);

this.app.config(['$httpProvider', 'appConfig', function ($httpProvider, appConfig) {
    $httpProvider.defaults.headers.common['authkey'] = appConfig.authkey;
}]);

this.app.config(['$provide', '$mdThemingProvider', function ($provide, $mdThemingProvider) {
    $mdThemingProvider.theme('default')
        .primaryPalette('panelPalette', {
            'default': '500',
            'hue-1': '100',
            'hue-2': '800',
            'hue-3': "900"
        })
        .accentPalette('panelPalette', {
            'default': 'A200',
            'hue-1': 'A100',
            'hue-2': 'A400',
            'hue-3': "A700"
        })
        .backgroundPalette('grey', {
            'hue-1': '100',
            'hue-2': '200',
            'hue-3': '300'
        });
    $mdThemingProvider.definePalette('panelPalette', { // blue
        '50': '#FBE9E7',
        '100': '#FFCCBC',
        '200': '#FFAB91',
        '300': '#FF8A65',
        '400': '#FF7043',
        '500': '#454545',
        '600': '#F4511E',
        '700': '#E64A19',
        '800': '#D84315',
        '900': '#BF360C',
        'A100': '#ffffff',
        'A200': '#00695C',
        'A400': '#004D40',
        'A700': '#00373F',
        'contrastDefaultColor': 'light' // texto
    });
}]);