if ["redhat", "centos", "fedora"].include?(node["platform"])
  package "xorg-x11-server-Xvfb"
else
  package "xvfb"
end

template "/etc/init.d/xvfb" do
  source "xvfb.init.erb"
  mode "0755"
end

service "xvfb" do
  action [:start, :enable]
end
