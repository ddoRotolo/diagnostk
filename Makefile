run: db.l site/
	./app.l &
	echo "db.l\n" | entr "./generate.l"

db.l:
	touch db.l

site/: static/img/ static/thumb/
	./generate.l
	

static/img/:
	mkdir static/img

static/thumb/:
	mkdir static/thumb

clean:
	rm -rf static/img/ static/thumb/ site/ db.l
