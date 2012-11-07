#/etc/varnish/default.vcl managed by Puppet

backend default {
    .host = "localhost";
    .port = "8080";
}

sub vcl_fetch {
    if (req.url ~ "^/static") {
        set beresp.ttl = 5d;
    }
    if (req.url ~ "\.(ico|png|gif|jpg)$") {
        unset beresp.http.set-cookie;
        set beresp.ttl = 1h;
    }
    if (beresp.ttl <= 0s ||
            beresp.http.Set-Cookie ||
            beresp.http.Vary == "*") {
        /*
         * Mark as "Hit-For-Pass" for the next 2 minutes
         */
        set beresp.ttl = 120 s;
        return (hit_for_pass);
    }
    if (beresp.http.content-type ~ "text") {
        set beresp.do_gzip = true;
    }
    return (deliver);
}

sub vcl_deliver {
    return (deliver);
}

acl local {
    "localhost";
}

sub vcl_recv {
    if (req.request == "PURGE") {
        if (client.ip ~ local) {
            return(lookup);
        }
    }
}

sub vcl_hit {
    if (req.request == "PURGE") {
        set obj.ttl = 0s;
        error 200 "Purged.";
    }
}

sub vcl_miss {
    if (req.request == "PURGE") {
        error 404 "Not in cache.";
    }
}
