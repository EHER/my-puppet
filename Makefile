default:
	@echo "install"
	@echo "apply"
	@echo "edit"

install:
	git submodule update --init

apply:
	puppet apply --verbose manifests/site.pp

edit:
	vi manifests/site.pp
