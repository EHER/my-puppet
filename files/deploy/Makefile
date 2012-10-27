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
	mkdir /var/www/neuroeducacaosorocaba.com.br;

download:
	wget -c -O /var/www/eher.com.br/wordpress.tar.gz http://br.wordpress.org/latest-pt_BR.tar.gz;
	wget -c -O /var/www/neuroeducacaosorocaba.com.br/wordpress.tar.gz http://br.wordpress.org/latest-pt_BR.tar.gz;

extract:
	cd /var/www/eher.com.br; tar vxfz wordpress.tar.gz;
	cd /var/www/neuroeducacaosorocaba.com.br; tar vxfz wordpress.tar.gz;

clone:
	git clone git://github.com/EHER/voluntarios.git /var/www/queroservoluntario.com;
	git clone git://github.com/EHER/chegamos.git /var/www/chegamos.com;
	git clone git://github.com/EHER/chegamos.git /var/www/chegamos.com.br;
	git clone git://github.com/EHER/encaixote.me.git /var/www/encaixote.me;

pull:
	cd /var/www/queroservoluntario.com; git pull;
	cd /var/www/chegamos.com; git pull; make update
	cd /var/www/chegamos.com.br; git pull; make update
	cd /var/www/encaixote.me; git pull;
