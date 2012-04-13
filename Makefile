default:
	@echo "download"
	@echo "install"
	@echo "apply"
	@echo "edit"

download:
	git clone git://github.com/EHER/my-puppet.git /etc/puppet
	cd /etc/puppet

install:
	git submodule update --init

apply:
	puppet apply --verbose manifests/site.pp

edit:
	vi manifests/site.pp
