#!/bin/bash

apt update -y
wget https://packages.chef.io/files/current/chef-server/12.18.13/ubuntu/18.04/chef-server-core_12.18.13-1_amd64.deb -P /tmp
dpkg -i /tmp/chef-server-core_12.18.13-1_amd64.deb
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
apt upgrade -y

