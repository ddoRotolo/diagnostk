#*Drawings *DrawingAmt

(de lst2obj ("lst" "val")
   (let N (box "val")
      (for P "lst"
         (put N (car P) (cdr P)))
      N))

(setq *DrawingAmt 0)
(setq *Drawings '())
(in "db.l"
   (while (read)
      (push '*Drawings (lst2obj @ *DrawingAmt))
      (inc '*DrawingAmt)))
