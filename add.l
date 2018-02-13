#*Title *Year *Description *Filename

#Add info on the piece to the file

(load "loadArt.l")

(when (and *Title *Year *Description *FileName (= *Password "dan<3lis<3"))
   (call 'mv (tmp *FileName) (pack "static/img/" *FileName))
   (call 'gm 'convert 
      '-resize '30% 
      '-gaussian '10x5
      (pack "static/img/" *FileName)
      (pack "static/thumb/" *FileName))
   (out "+db.l" 
      (println 
         (list 
            (cons 'id *DrawingAmt)
            (cons 'title *Title) 
            (cons 'year *Year)
            (cons 'description *Description)
            (cons 'filename *FileName)))))

(redirect "transition.l")
