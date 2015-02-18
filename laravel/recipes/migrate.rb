## Recipe to run the database migrations (php artisan migrate)
node[:deploy].each do |app_name, deploy|
		execute "run the database migration commands" do
		command "sudo php #{deploy[:deploy_to]}/current/artisan migrate --force"
	  end
end