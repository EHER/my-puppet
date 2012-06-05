# site.pp
include "apt"
apt::ppa { "ppa:ondrej/php5": }

include "test"
include "vim"
include "mysql"
include "php"
include "php::pecl::xdebug"
include "php::pecl::gd"
include "php::pecl::curl"
include "php::pecl::sqlite"

include "apache"
apache::vhost{[
                "chegamos.com",
                "chegamos.com.br",
                "m.chegamos.com",
                "encaixote.me",
                "eher.com.br",
                "alexandreeher.com",
                "skd.com.br",
                "paginasbrancas.com.br",
                "queroservoluntario.com",
                "neuroeducacaosorocaba.com.br"
            ]:
            replace => true,
}