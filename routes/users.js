//check userCtrl.js for client script
module.exports=function(app,connection){
	
	// Adding new user
	app.post('/addUser',function(req,res){
		var users=req.body;
		var usr_sql=connection.query("INSERT INTO `tbl_users` SET ?",[users],function(err,results){
			if(err){
				res.send(err);
			}
			else{
				res.send("success");
			}
		})
	});
	
	//getting all user list
	app.get('/user_list',function(req,res){
		var usr_listsql=connection.query('SELECT * FROM `tbl_users`',function(err,rows){
			console.log(usr_listsql.sql);
			if(err){
				res.send(err);
			}
			else{
				res.send(rows);
			}
		})
	})
	// Change user status
	app.post('/change_sts',function(req,res){
		var status=req.body.status;
		
		var change_status
		
	})
	
}