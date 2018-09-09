#!/bin/bash

yum update -y
wget https://packages.chef.io/files/stable/chef-server/12.17.33/el/7/chef-server-core-12.17.33-1.el7.x86_64.rpm -P /tmp
rpm -ivh /tmp/chef-server-core_12.18.13-1_amd64.deb
chef-server-ctl reconfigure
mkdir -p .chef
chef-server-ctl user-create admin Admin User andy.gitc@gmail.com 'Che3f@AWS' --filename /root/.chef/chef.pem
chef-server-ctl org-create esn ‘MyXingfu Net’ –association_user admin --filename /root/.chef/esn-validator.pem
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure –accept-license
chef-server-ctl install opscode-reporting
chef-server-ctl reconfigure
opscode-reporting-ctl reconfigure –accept-license

