# site.pp
include "test"
include "php"
include "php::apache"
include "vim"
include "mysql"
include "apache"

apache::vhost{"chegamos.com":
    replace => true,
}

apache::vhost{"chegamos.com.br":
    replace => true,
}

apache::vhost{"m.chegamos.com":
    replace => true,
}

apache::vhost{"encaixote.me":
    replace => true,
}

apache::vhost{"eher.com.br":
    replace => true,
}

apache::vhost{"alexandreeher.com":
    replace => true,
}

apache::vhost{"skd.com.br":
    replace => true,
}

apache::vhost{"paginasbrancas.com.br":
    replace => true,
}

apache::vhost{"queroservoluntario.com":
    replace => true,
}

apache::vhost{"neuroeducacaosorocaba.com.br":
    replace => true,
}

apache::vhost{"ervaonline.com.br":
    replace => true,
}

