app.controller('userCtrl',['$scope','$http','$timeout',function($scope,$http,$timeout){
	$scope.saveUser=function(){
		if($scope.repwd == $scope.user.usr_pwd){
			$http.post('/addUser',$scope.user).success(function(response){
				console.log(response);
				$scope.successmsgshow=true;
				$timeout(function(){
					$scope.successmsgshow=false;
				},3000);
				$scope.user=[];
			}).error(function(err){
				console.log(err);
			})
		}
		else{
			$('#repwd').addClass('has-error');
			$scope.pwderr=true;
		}
	}
	
}]);
