// Check user.js for server sript

app.controller('userCtrl',['$scope','$http','$timeout','md5',function($scope,$http,$timeout,md5){
	$scope.number="/^\+?\d{2}[- ]?\d{3}[- ]?\d{5}$/";
	
	//Add new user
	$scope.saveUser=function(){
		if($scope.repwd == $scope.user.usr_pwd){
			$scope.user.usr_pwd=md5.createHash($scope.user.usr_pwd || '');
			$scope.repwd=md5.createHash($scope.repwd || '');
			$http.post('/addUser',$scope.user).success(function(response){
				if(response == "no_user"){
					$scope.msgshow=true;
					$scope.classShow="alert-success";
					$scope.msg="User added successfully";
					$timeout(function(){
						$scope.msgshow=false;
					},3000);
					$scope.user={};
					$scope.repwd="";
				}
				if(response == "has_user"){
					$scope.msgshow=true;
					$scope.classShow="alert-danger";
					$scope.msg="User name already exist";
					$timeout(function(){
						$scope.msgshow=false;
					},3000);
				}
				if(response == "has_mail"){
					$scope.msgshow=true;
					$scope.classShow="alert-danger";
					$scope.msg="Mail id already exist";
					$timeout(function(){
						$scope.msgshow=false;
					},3000);
				}
			}).error(function(err){
				$scope.errmsgshow=true;
				$timeout(function(){
					$scope.errmsgshow=false;
				},3000);
			})
		}
		else{
			$scope.errClass="error";
			$scope.pwderr=true;
			$timeout(function(){
				$scope.pwderr=false;
			},3000);
		}
	}
	
	// Getting user lists
	$scope.users_list=function(){
		$http.get('/user_list').success(function(response){
			if(response.length>0){
				$scope.valuesnull=false;
				$scope.valuesshow=true;
				$scope.usr_list=response;
			}
			else{
				$scope.valuesnull=true;
				$scope.valuesshow=false;
			}
		})
	}
	
	$scope.chkStatus=function(status){
		$http.post('/change_sts',{status:status}).success(function(response){
			$scope.users_list();
		})
	}
	
	$scope.users_list();
	
}]);
