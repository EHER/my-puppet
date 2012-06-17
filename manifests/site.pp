# site.pp
include "apt"
include "vim"
include "mysql"
include "php"
include "php::pecl::xdebug"
include "php::pecl::gd"
include "php::pecl::curl"
include "php::pecl::sqlite"
include "git"
include "apache"

apt::ppa { "ppa:ondrej/php5": }

git::repo {"clone dotVim":
    target => '/root/.vim',
    source => 'git://github.com/renanivo/dotvim.git'
}
exec {"install dotVim":
    command => "/usr/bin/make install",
    cwd => "/root/.vim"
}

git::repo {"clone queroservoluntario.com":
    target => '/var/www/queroservoluntario.com',
    source => 'git://github.com/EHER/voluntarios.git'
}
exec {"install queroservoluntario.com":
    command => "/usr/bin/make install",
    cwd => "/var/www/queroservoluntario.com"
}

apache::vhost{[
                "chegamos.com",
                "chegamos.com.br",
                "m.chegamos.com",
                "encaixote.me",
                "eher.com.br",
                "alexandreeher.com",
                "skd.com.br",
                "paginasbrancas.com.br",
                "queroservoluntario.com"
            ]:
            replace => true,
}
