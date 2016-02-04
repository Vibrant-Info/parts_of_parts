module.exports=function(app,connection){
	app.post('/addUser',function(req,res){
		var users=req.body;
		var usr_sql=connection.query("INSERT INTO `tbl_users` SET ?",[users],function(err,results){
			console.log(usr_sql.sql);
			if(err){
				console.log(err);
				res.send(err);
			}
			else{
				console.log(results);
				res.send("success");
			}
		})
	})
}