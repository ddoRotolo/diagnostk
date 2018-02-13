run: db.l site/
	./app.l

db.l:
	touch db.l

site/:
	./generate.l
