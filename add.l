#*Title *Year *Description *Filename

#Add info on the piece to the file

(load "loadArt.l")

(when (and *Title *Year *Description *FileName)
   (out "+db.l" 
      (println 
         (list 
            (cons 'id *DrawingAmt)
            (cons 'title *Title) 
            (cons 'year *Year)
            (cons 'description *Description)
            (cons 'filename *FileName))))
   (call 'mv (tmp *FileName) (pack "static/img/" *FileName))
   (call 'gm 'convert '-resize '25% 
      (pack "static/img/" *FileName)
      (pack "static/thumb/" *FileName))
   (unless (fork) (script "generate.l")))

(redirect "index.l")
