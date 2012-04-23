# site.pp
include "test"
include "php"
include "vim"
include "mysql"
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
                "neuroeducacaosorocaba.com.br",
                "ervaonline.com.br"
            ]:
            replace => true,
}
