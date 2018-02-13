#!/usr/bin/env pil

(load "@lib/http.l" "@lib/xhtml.l")

(allowed '("site/css/") "index.l" "add.l"
    "*Title"
    "*Year"
    "*Description"
    "*FileName"
    "*Password")

(setq *Css '("site/css/reset.css" "site/css/layout.css"))

(de main () 
   (unless (fork)
      (exec "darkhttpd" "site" "--port" 8081))
   (unless (fork)
      (pipe (prinl "db.l") (exec "entr" "./generate.l")))
   (server 8080 "index.l")
   (wait))

(main)
