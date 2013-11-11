package 'nginx' do
  action :install
end

cookbook_file "/etc/nginx/sites-available/default" do
  source "nginx/vhost"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

link "/etc/nginx/sites-enabled/default" do
  to "/etc/nginx/sites-available/default"
  notifies :reload, 'service[nginx]'
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :start
end
