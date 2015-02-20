## Recipe to install the required and commonly used packages for Laravel
node[:deploy].each do |app_name, deploy|
	# Required
	package 'php5'
	package 'php5-mcrypt'
	package 'php5-curl'
	package 'php5-json'
	package 'php5-redis'
	package 'php5-memcached'
	# Common
	package 'imagemagick'
	package 'php5-imagick'
	package 'libmagickcore5-extra'
	package 'libxrender1'
	package 'libxrender-dev'
	# Enable Mcrypt module because Ubuntu 14.04 needs this to be done manually
	execute 'Enable php mcrypt' do
		cwd "/tmp"
		command 'sudo php5enmod mcrypt'
	end
	# Restart apache2 after package installation
	service 'apache2' do
		action :restart
	end
end
