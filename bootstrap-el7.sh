#!/usr/bin/env bash


# puppet 4.x contains its own modern-ish ruby, so we can use that
echo "--- installing r10k"
/opt/puppetlabs/puppet/bin/gem install r10k

# install hiera-eyaml
echo "--- installing hiera-eyaml"
/opt/puppetlabs/puppet/bin/gem install hiera-eyaml

# setup PATH to include the new magic
echo "--- adding /opt/puppetlabs/puppet/bin to PATH"
echo -e "\nexport PATH=/opt/puppetlabs/puppet/bin:\$PATH" >> /root/.bashrc

# install git
echo "--- installing git"
yum -y install git

# initial r10k deploy
echo "--- doing initial r10k deploy"
source /root/.bashrc
r10k deploy environment -c /vagrant/r10k.yaml

# set a useful basemodulepath in puppet.conf to limit puppet apply typing
echo "--- setting a marginally useful basemodulepath"
echo "basemodulepath = sitemodules:oldmodules:/etc/puppetlabs/code/environments/production/modules" >> /etc/puppetlabs/puppet/puppet.conf

# link /etc/puppetlabs/code/environments/production to /puppet
echo "--- linking /etc/puppetlabs/code/environments/production to /puppet"
ln -s /puppet /etc/puppetlabs/code/environments/production


cat << EOF
---
---
--- it's dangerous to go alone! take this
---   puppet apply --hiera_config /vagrant/hiera.yaml /puppet/manifests/
---
EOF
