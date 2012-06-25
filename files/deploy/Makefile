default: help

help:
	@echo "install"
	@echo "update"
	@echo "config"

install: create-dir download extract clone 

update: pull

config:

create-dir:
	mkdir /var/www/eher.com.br;

download:
	wget -c -O /var/www/eher.com.br/wordpress.tar.gz http://br.wordpress.org/wordpress-3.4-pt_BR.tar.gz;

extract:
	cd /var/www/eher.com.br; tar vxfz wordpress.tar.gz; mv wordpress web;

clone:
	git clone git://github.com/EHER/voluntarios.git /var/www/queroservoluntario.com;
	git clone git://github.com/EHER/chegamos.git /var/www/chegamos.com;
	git clone git://github.com/EHER/chegamos.git /var/www/chegamos.com.br;
	git clone git://github.com/EHER/encaixote.me.git /var/www/encaixote.me;

pull:
	cd /var/www/queroservoluntario.com; git pull;
	cd /var/www/chegamos.com; git pull;
	cd /var/www/chegamos.com.br; git pull;
	cd /var/www/encaixote.me; git pull;
