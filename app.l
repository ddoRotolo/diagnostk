#!/usr/bin/env pil

(load "@lib/http.l" "@lib/xhtml.l")

(allowed '("site/css/") "index.l" "add.l" "transition.l"
    "*Title"
    "*Year"
    "*Description"
    "*FileName"
    "*Password")

(setq *Css '("site/css/reset.css" "site/css/layout.css"))

(de main () 
   (unless (fork)
      (exec "darkhttpd" "site" "--port" 8081))
   (server 8080 "index.l")
   (wait))

(main)
