## Recipe to set recursive permissions for the Laravel storage folder /app/storage/*
node[:deploy].each do |app_name, deploy|
	if platform_family?('debian')
		execute "set permissions for #{deploy[:deploy_to]}/current/app/storage/" do
		command "sudo chmod 0777 -Rf #{deploy[:deploy_to]}/current/app/storage/"
	  end
	end
end