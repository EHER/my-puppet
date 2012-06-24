# site.pp

# apt
include "apt"
apt::ppa {"ppa:ondrej/php5":}

# MySQL
package {
    ["mysql-server", "mysql-client"]:
	ensure => "installed";
}

service {
   "mysql":
        name => "mysql",
        enable => true,
        ensure => "running",
        hasrestart => true,
        require => Package["mysql-server"];
}

# php
package {
    ["php5-curl", "php5-fpm", "php5-common", "php5", "php5-cli", "php5-sqlite", "php5-mysql", "php5-gd"]:
        ensure=> "installed"
}

file {
    "/etc/php5/cli/php.ini":
        require => Package["php5-cli"],
        source => "/etc/puppet/files/php5/cli/php.ini";
    "/etc/php5/fpm/php.ini":
        require => Package["php5-fpm"],
        notify => Service["php5-fpm"],
        source => "/etc/puppet/files/php5/fpm/php.ini";
    "/etc/php5/fpm/php-fpm.conf":
        require => Package["php5-fpm"],
        notify => Service["php5-fpm"],
        source => "/etc/puppet/files/php5/fpm/php-fpm.conf";
    "/etc/php5/fpm/pool.d/www.conf":
        require => Package["php5-fpm"],
        notify => Service["php5-fpm"],
        source => "/etc/puppet/files/php5/fpm/pool.d/www.conf";
}

service {
    "php5-fmp":
        name => "php5-fpm",
        enable => true,
        ensure => "running",
        hasrestart => true,
        require => Package["php5-fpm"];
}

# nginx
package {
    ["nginx"]:
        ensure=> "installed";
}

file {
    "/var/www":
        ensure => "directory",
        owner  => "root",
        group  => "www-data",
        mode   => 750;
    "/etc/nginx/nginx.conf":
        require => Package["nginx"],
        notify => Service["nginx"],
        source => "/etc/puppet/files/nginx/nginx.conf";
    "/etc/nginx/fastcgi_params":
        require => Package["nginx"],
        notify => Service["nginx"],
        source => "/etc/puppet/files/nginx/fastcgi_params";
    "/etc/nginx/conf.d/queroservoluntario.com.conf":
        require => Package["nginx"],
        notify => Service["nginx"],
        source => "/etc/puppet/files/nginx/conf.d/queroservoluntario.com.conf";
    "/etc/nginx/conf.d/eher.com.br.conf":
        require => Package["nginx"],
        notify => Service["nginx"],
        source => "/etc/puppet/files/nginx/conf.d/eher.com.br.conf";
    "/etc/nginx/conf.d/skd.com.br.conf":
        require => Package["nginx"],
        notify => Service["nginx"],
        source => "/etc/puppet/files/nginx/conf.d/skd.com.br.conf";
    "/etc/nginx/conf.d/alexandreeher.com.conf":
        require => Package["nginx"],
        notify => Service["nginx"],
        source => "/etc/puppet/files/nginx/conf.d/alexandreeher.com.conf";
    "/etc/nginx/conf.d/encaixote.me.conf":
        require => Package["nginx"],
        notify => Service["nginx"],
        source => "/etc/puppet/files/nginx/conf.d/encaixote.me.conf";
}

service {
    "nginx":
        name => "nginx",
        enable => true,
        ensure => "running",
        hasrestart => true,
        require => Package["nginx"];
}


#    [
#        "sismo.eher.com.br",
#        "m.chegamos.com",
#        "paginasbrancas.com.br",
#    ]:
