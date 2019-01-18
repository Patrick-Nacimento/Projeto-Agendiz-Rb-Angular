this.app.factory("Group", ['$resource', function ($resource) {
    return $resource('/groups/:id.json', {id: '@id'}, {
        get: {method: 'GET'},
        create: {method: 'POST'},
        update: {method: 'PATCH'},
        destroy: {method: "DELETE"},
        recover: {method: 'PATCH', url: '/groups/:id/recover.json'}
    });
}]);
