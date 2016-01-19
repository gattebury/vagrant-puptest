# vagrant-puptest
### Vagrant puppet testing environment

Creates two machines, one EL6 and one EL7 based.

Does some initial installation/setup of r10k and deploys environment(s) based
on the Puppetfile supplied by whatever repo you set PUPPET_REPO to.

PUPPET_REPO is shared as /puppet inside the guests and is where you would
run 'puppet apply' from for testing control repo changes. In order to not
clutter up this shared area with modules, r10k deploys to the expected
/etc/puppetlabs/code/environments/ path.

hiera is configured to use the pub/priv keys from the shared /vagrant and
are in .gitignore as the following:
    private_key.pkcs7.pem
    public_key.pkcs7.pem
