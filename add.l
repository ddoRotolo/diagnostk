#*Title *Year *Description *Filename

#Add info on the piece to the file

(load "loadArt.l")

(when (and *Title *Year *Description *FileName (= *Password "dan<3lis<3"))
   (out "+db.l" 
      (println 
         (list 
            (cons 'id *DrawingAmt)
            (cons 'title *Title) 
            (cons 'year *Year)
            (cons 'description *Description)
            (cons 'filename *FileName))))
   (call 'mv (tmp *FileName) (pack "static/img/" *FileName))
   (call 'gm 'convert 
      '-resize '30% 
      '-gaussian '3x1
      (pack "static/img/" *FileName)
      (pack "static/thumb/" *FileName)))

(redirect "transition.l")
