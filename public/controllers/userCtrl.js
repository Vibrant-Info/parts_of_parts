app.controller('userCtrl',['$scope','$http','$timeout',function($scope,$http,$timeout){
	$scope.saveUser=function(){
		if($scope.repwd == $scope.user.usr_pwd){
			$http.post('/addUser',$scope.user).success(function(response){
				$scope.successmsgshow=true;
				$timeout(function(){
					$scope.successmsgshow=false;
				},3000);
				$scope.user=[];
			}).error(function(err){
				$scope.errmsgshow=true;
				$timeout(function(){
					$scope.errmsgshow=false;
				},3000);
			})
		}
		else{
			$('#repwd').addClass('has-error');
			$scope.pwderr=true;
		}
	}
	
}]);
