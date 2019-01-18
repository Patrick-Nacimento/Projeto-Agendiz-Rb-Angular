this.app.factory("Recruiter", ['$resource', function ($resource) {
    return $resource('/recruiters/:id.json', {id: '@id'}, {
        get: {method: 'GET'},
        create: {method: 'POST'},
        update: {method: 'PATCH'},
        destroy: {method: "DELETE"},
        recover: {method: 'PATCH', url: '/recruiters/:id/recover.json'}
    });
}]);
