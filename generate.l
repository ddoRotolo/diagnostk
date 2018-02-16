#!/usr/bin/env pil

#Generates the basic files and pages

#Load database, html lib


(load "@lib/xhtml.l")
(load "@lib/http.l")
(load "loadArt.l")

(de extension (FileName)
   (pack (last (split (chop FileName) "."))))


#Patch html so it doesn't send out an http header

(patch html '(httpHead NIL Upd) NIL)

#redefine css so it works when not in a server

(de css ("Src")
   (tag "link"
    (list 
      (cons 'href "Src")
      (cons 'rel "stylesheet"))))

#reset the site
(call 'rm '-rf "site")
(call 'mkdir "site")

#copy static resources to site
(call 'cp '-r ~(mapcar '((d) (pack "static/" d)) (dir "static")) "site")

#cd into site
(cd 'site)

#create the index

(setq *Css '("/css/reset.css" "/css/layout.css"))

(out "index.html"
   (html 0 "Index" *Css NIL
      (<div> '(id . topBar) 
         (<h1> '(id . header) "In Vitro Diagnostic Use"))
      (<div> '(id . gallery)
         (for D *Drawings
            (with D
               (<tag> "a"
                  (list
                     (cons 'href (pack "/art/" (: title) ".html")))
                  (<tag> "img"  
                     (list 
                        (cons 'src (pack "/thumb/" (: filename)))
                        (cons 'alt (: title))))))))
      (<div> '(id . footer)
         (<p> '() "Copyright © Liseth Sanchez 2017-2018"))))

#create the pages

(call 'mkdir "art")
(cd "art")

(for D *Drawings
   (with D 
      (out (pack (: title) ".html")
         (html 0 (: title) *Css NIL
            (<div> '(id . topBar) 
               (<h1> '(id . header) "In Vitro Diagnostic Use"))
            (<div> '(id . artContainer)
               (<div> '(id . artPiece)
                  (<tag> "img"  (cons 'src (pack "/img/" (: filename)))))
               (<div> '(id . artDetails)
                  (<h1> NIL (ht:Prin (: title)))
                  (<h2> NIL (ht:Prin (: year)))
                  (<p> NIL (ht:Prin (: description)))
                  (<tag> "a"
                     (list
                        (cons 'href (pack "/index.html")))
                     "Return to Gallery")))
            (<div> '(id . footer)
               (<p> '() "Copyright © Liseth Sanchez 2017-2018"))))))

(bye)
