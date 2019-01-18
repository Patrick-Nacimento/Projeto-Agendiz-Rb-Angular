this.app.controller('AutocompleteGroupsCtrl', ['$scope', '$rootScope', 'Group', 'Index', function ($scope, $rootScope, Group, Index) {

    $scope.get = function (loadingPromise) {
        var IndexConfig = {
            identifier: "groups",
            model: Group,
            list: $scope.items,
            returnName: 'groups',
            attributes: ['id', 'area'],
            per_page: 20,
            params: {
                sort_property: 'area,id',
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
