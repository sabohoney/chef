#cookbook_file "10gen.repo" do
#  source "/etc/yum.repos.d/10gen.repo"
#end
template "/etc/yum.repos.d/10gen.repo" do  # (2)
   owner "root"
   group "root"
   mode "0644"
end

package 'mongo-10gen-server'
#%w{mongo-10gen-server}.each do |pkg|
#  package pkg do
#    action :install
#  end
#end
 
service "mongod" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end