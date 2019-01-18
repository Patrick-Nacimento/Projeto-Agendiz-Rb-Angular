this.app.factory("Intern", ['$resource', function ($resource) {
    return $resource('/interns/:id.json', {id: '@id'}, {
        get: {method: 'GET'},
        create: {method: 'POST'},
        update: {method: 'PATCH'},
        destroy: {method: "DELETE"},
        recover: {method: 'PATCH', url: '/interns/:id/recover.json'}
    });
}]);