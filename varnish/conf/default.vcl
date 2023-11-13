vcl 4.1;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_backend_response {
    if (bereq.url == "/varnish.html") {
        set beresp.do_esi = true;
        set beresp.ttl = 24 h;
    }
}