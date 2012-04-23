# site.pp
include "test"
include "vim"
include "mysql"
include "apache"
include "php"
include "php::pecl::xdebug"
include "php::pecl::gd"
include "php::pecl::curl"

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
                "neuroeducacaosorocaba.com.br",
                "ervaonline.com.br"
            ]:
            replace => true,
}
