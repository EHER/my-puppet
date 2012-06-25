default: help

help:
	@echo "install"
	@echo "update"
	@echo "config"

install: download clone 

update: pull

download:
	wget -c -O /var/www/eher.com.br/wordpress.tar.gz http://br.wordpress.org/wordpress-3.4-pt_BR.tar.gz;

clone:
	git clone git://github.com/EHER/voluntarios.git /var/www/queroservoluntario.com;
	git clone git://github.com/EHER/chegamos.git /var/www/chegamos.com;
	git clone git://github.com/EHER/chegamos.git /var/www/chegamos.com.br;
	git clone git://github.com/EHER/encaixote.me.git /var/www/encaixote.me;
	git clone https://EHER@bitbucket.org/EHER/paginas-brancas.git /var/www/paginasbrancas.com.br;

pull:
	cd /var/www/queroservoluntario.com; git pull;
	cd /var/www/chegamos.com; git pull;
	cd /var/www/chegamos.com.br; git pull;
	cd /var/www/encaixote.me; git pull;
	cd /var/www/paginasbrancas.com.br; git pull;


