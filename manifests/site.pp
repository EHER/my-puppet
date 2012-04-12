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

apache::vhost{"encaixote.me":
    replace => true,
}

