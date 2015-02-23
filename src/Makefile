WEBDIR = /var/www/hackdiet/online

CGIDIR = /usr/lib/cgi-bin

EXEDIR = /usr/local/bin/hackdiet

PROGRAMS = jig.pl bump

duh:
	@echo "Please choose: check dist publish test weblint"


jig.pl:    hdiet.w
	@echo -n 'Build '
	@./bump buildno.txt
	@date -u '+%F %R %Z' >buildtime.txt
	nuweb hdiet
	chmod 755 $(PROGRAMS)
	unexpand -a <Makefile.mkf >Makefile



publish:
	mkdir -p $(WEBDIR)
	cp -pr assets/* $(WEBDIR)
	
	cp -p webapp.html hdiet.css hdiet_handheld.css hdiet.js hackersdiet.dtd hackdiet_db.css wz_jsgraphics.js $(WEBDIR)

	cp -p HackDiet.pl $(CGIDIR)/HackDiet.NEW
	chmod 755 $(CGIDIR)/HackDiet.NEW
	mv $(CGIDIR)/HackDiet.NEW $(CGIDIR)/HackDiet

	cp -p HackDietBadge.pl $(CGIDIR)/HackDietBadge.NEW
	chmod 755 $(CGIDIR)/HackDietBadge.NEW
	mv $(CGIDIR)/HackDietBadge.NEW $(CGIDIR)/HackDietBadge

	mkdir -p  $(CGIDIR)/HDiet
	cp -pr HDiet/* $(CGIDIR)/HDiet

	mkdir -p $(EXEDIR)
	mv $(CGIDIR)/HDiet/ClusterSync.pl $(EXEDIR)/ClusterSync.NEW
	chmod 755 $(EXEDIR)/ClusterSync.NEW
	mv $(EXEDIR)/ClusterSync.NEW $(EXEDIR)/ClusterSync



pubsrc:
	if [ ! -d $(WEBDIR)/download/1.0 ] ; then mkdir -p $(WEBDIR)/download/1.0 ; fi
	cp -p Bowdler/hdiet-1.0.tar.gz $(WEBDIR)/download/1.0
	cp -p Bowdler/hdiet.pdf $(WEBDIR)/download/1.0



dist:
	rm -f hdiet.tar hdiet-*.tar.gz
	tar cfv hdiet.tar hdiet.w Bowdler.pl Makefile bump HDiet buildno.txt buildtime.txt wz_jsgraphics.js
	rm -rf Bowdler
	mkdir Bowdler
	( cd Bowdler ; tar xfv ../hdiet.tar )
	( cd Bowdler ; perl Bowdler.pl hdiet.w >hdiet.w1 ; mv hdiet.w1 hdiet.w )
	( cd Bowdler ; make clean )
	( cd Bowdler ; make check )
	( cd Bowdler ; latex hdiet; nuweb hdiet ; latex hdiet )
	( cd Bowdler ; make pdf )
	( cd Bowdler ; tar cfvz hdiet-1.0.tar.gz hdiet.w jig.pl Bowdler.pl \
		HackDiet.pl HackDietBadge.pl Makefile \
		bump buildno.txt buildtime.txt \
		webapp.html hdiet.tex hdiet.pdf \
		HDiet \
		hdiet.css hdiet_handheld.css hdiet.js wz_jsgraphics.js \
		hackdiet_db.css hackersdiet.dtd )
	rm -f hdiet.tar



view:	jig.pl
	latex hdiet
	nuweb hdiet
	latex hdiet
	xdvi hdiet

viewman: jig.pl
	pod2man hdiet.pl >ZZhdiet.1
	groff -X -man ZZhdiet.1
	rm -f ZZhdiet.1

pdf:	jig.pl
	sed 's/%%%PDF%%%//' <hdiet.tex >ZZhdiet.tex
	latex ZZhdiet
	latex ZZhdiet
	pdflatex ZZhdiet
	pdflatex ZZhdiet
	mv ZZhdiet.pdf hdiet.pdf
	rm -f ZZhdiet*

viewpdf: pdf
	acroread hdiet.pdf



check:	$(PROGRAMS) weblint
	perl -c HackDiet.pl
	perl -c HDiet/Aggregator.pm
	perl -c HDiet/Cluster.pm
	perl -c HDiet/ClusterSync.pl
	perl -c HDiet/cookie.pm
	perl -c HDiet/hdCSV.pm
	perl -c HDiet/history.pm
	perl -c HDiet/html.pm
	perl -c HDiet/Julian.pm
	perl -c HDiet/monthlog.pm
	perl -c HDiet/pubname.pm
	perl -c HDiet/session.pm
	perl -c HDiet/trendfit.pm
	perl -c HDiet/user.pm
	perl -c HDiet/xml.pm
	perl -c Bowdler.pl
	perl -c HackDietBadge.pl
	perl -c jig.pl

test:	$(PROGRAMS)
	perl jig.pl --verbose --test

weblint:    jig.pl
	weblint webapp.html



clean:
	rm -f hdiet.dvi hdiet.toc hdiet.aux hdiet.log Makefile.mkf hdiet.pdf HDiet/*.pm jig.pl

cvsclean:  clean
	rm -f hdiet.pdf jig.pl *.pm hdiet.tex webapp.html
