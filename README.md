# vagrant-puptest
### Vagrant puppet testing environment

Creates two machines, one EL6 and one EL7 based.

Does some initial installation/setup of r10k and deploys environment(s) based on the Puppetfile supplied by whatever repo you set PUPPET_REPO to.

PUPPET_REPO is shared as /puppet inside the guests and is where you would
run 'puppet apply' from for testing changes. In order to not
clutter up this shared area with modules, r10k deploys to the expected
/etc/puppetlabs/code/environments/ path.

### Path considerations

`modulepath` is likely set in environment.conf already but probably not what you want. The easy button solution is to call `puppet apply` with the --modulepath option and set accordingly. The included sample script `/vagrant/papply` does just this.

`environmentpath` is set in /etc/puppetlabs/puppet/puppet.conf to a sort

### Hiera
hiera is configured via `/vagrant/hiera.yaml` to use the pub/priv keys from the shared /vagrant directory and the keys are in .gitignore as the following:
- private_key.pkcs7.pem
- public_key.pkcs7.pem
