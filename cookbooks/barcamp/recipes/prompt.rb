file '/etc/hostname' do
  content "barcamp\n"
end

service 'hostname' do
  action :restart
end

file '/home/vagrant/.bash_profile' do
  owner 'vagrant'
  group 'vagrant'
  mode 0644
  content 'export PS1="\[\e[0;36m\]\u@\h \[\e[0;33m\]\w\[\e[00m\]: "'
end
