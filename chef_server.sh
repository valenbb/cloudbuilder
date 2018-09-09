#!/bin/bash

# Run updates and install dependencies
yum install -y wget nc
yum update -y

# Download chef server package
wget https://packages.chef.io/files/stable/chef-server/12.17.33/el/7/chef-server-core-12.17.33-1.el7.x86_64.rpm -P /tmp

# Install chef server
rpm -ivh /tmp/chef-server-core_12.18.13-1_amd64.deb
chef-server-ctl reconfigure

# Setup chef admin user and org
mkdir -p .chef
chef-server-ctl user-create admin Admin User andy.gitc@gmail.com 'Che3f@AWS' --filename /root/.chef/chef.pem
chef-server-ctl org-create esn ‘MyXingfu Net’ –association_user admin --filename /root/.chef/esn-validator.pem

# Install chef web ui
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure –accept-license

# Install chef reporting
chef-server-ctl install opscode-reporting
chef-server-ctl reconfigure
opscode-reporting-ctl reconfigure –accept-license

