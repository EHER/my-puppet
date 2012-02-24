# site.pp

import "templates"
import "nodes"

filebucket { main: server => puppet }

# global defaults
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }

Package {
    provider => $operatingsystem ? {
        debian => aptitude,
        redhat => up2date
    }
}
