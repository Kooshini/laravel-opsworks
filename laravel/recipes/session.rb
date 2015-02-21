## Recipe to set-up the Laravel session config (/app/config/session.php)
node[:deploy].each do |app_name, deploy|
	template "#{deploy[:deploy_to]}/current/app/config/session.php" do
		source "session.php.erb"
		mode 0664
		group deploy[:group]
		owner "www-data"
		
		## Get the environment_variables from the OpsWorks console 
		## and copy them into the variables to be passed to the template in ../templates/default/
		 variables({
			:SESSION_DRIVER => deploy[:environment_variables][:SESSION_DRIVER]
		})
	end
end