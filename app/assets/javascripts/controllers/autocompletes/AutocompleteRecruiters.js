this.app.controller('AutocompleteRecruitersCtrl', ['$scope', '$rootScope', 'Recruiter', 'Index', function ($scope, $rootScope, Recruiter, Index) {

    $scope.get = function (loadingPromise) {
        var IndexConfig = {
            identifier: "recruiters",
            model: Recruiter,
            list: $scope.items,
            returnName: 'recruiters',
            attributes: ['id', 'description'],
            per_page: 20,
            params: {
                sort_property: 'description,id',
                search: $scope.search
            },
            loadingPromise: loadingPromise
        };

        $scope.items = Index.do(IndexConfig);

        $scope.items.then(function (data) {
            $scope.itemsLength = data.length;
        });

        return $scope.items;
    };


    $scope.onChange = function () {
    };

}]);
