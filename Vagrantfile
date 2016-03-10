# -*- mode: ruby -*-
# vi: set ft=ruby :


# --- configuration knobs ---
PUPPET_REPO = "<path to control repo>"
BOX_EL6 = "puppetlabs/centos-6.6-64-puppet"
BOX_EL7 = "puppetlabs/centos-7.0-64-puppet"
HOSTNAME_EL6 = "<fqdn>"
HOSTNAME_EL7 = "<fqdn>"


# --- vagrant configuration ---
Vagrant.configure(2) do |config|

    config.vm.define "el6" do |el6|
        el6.vm.box = BOX_EL6
        el6.vm.hostname = HOSTNAME_EL6
        el6.vm.provision :shell, path: "bootstrap-el6.sh"
    end

    config.vm.define "el7" do |el7|
        el7.vm.box = BOX_EL7
        el7.vm.hostname = HOSTNAME_EL7
        el7.vm.provision :shell, path: "bootstrap-el7.sh"
    end

    # shared folder between host and guest
    config.vm.synced_folder PUPPET_REPO, "/puppet"

end
