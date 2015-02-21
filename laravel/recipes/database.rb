## Recipe to set-up the Laravel database config (/app/config/database.php)
node[:deploy].each do |app_name, deploy|
	template "#{deploy[:deploy_to]}/current/app/config/database.php" do
		source "database.php.erb"
		mode 0664
		group deploy[:group]
		owner "www-data"
		
		## Get the environment_variables from the OpsWorks console 
		## and copy them into the variables to be passed to the template in ../templates/default/
		 variables({
			:DB_HOST => deploy[:environment_variables][:RDS_HOST],
			:DB_NAME => deploy[:environment_variables][:RDS_DATABASE],
			:DB_USER => deploy[:environment_variables][:RDS_USERNAME],
			:DB_PASS => deploy[:environment_variables][:RDS_PASS],
			:REDIS_HOST => deploy[:environment_variables][:REDIS_HOST]
		})
	end
end
