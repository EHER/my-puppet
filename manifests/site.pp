# site.pp

# apt
include "apt"
apt::ppa {"ppa:ondrej/php5":}

# php
package {
    ["php5-curl", "php5-fpm", "php5-common", "php5", "php5-cli", "php5-sqlite", "php5-gd", "php5-xdebug"]:
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
#        "chegamos.com",
#        "chegamos.com.br",
#        "m.chegamos.com",
#        "encaixote.me",
#        "eher.com.br",
#        "alexandreeher.com",
#        "skd.com.br",
#        "paginasbrancas.com.br",
#        "queroservoluntario.com"
#    ]:


# Build

exec {
    "make install":
        cwd => "/var/www/",
        path => ["/usr/bin", "/usr/sbin"];
}

file {
    "/var/www/Makefile":
        require => Service["nginx"],
        notify => Exec["make install"],
        source => "/etc/puppet/files/build/Makefile";
}

