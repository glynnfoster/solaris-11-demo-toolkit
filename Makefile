DEMODIR=demos
SCRIPTSDIR=scripts
BINDIR=bin
DEMOS=boot-environments dtrace ips network zfs zones smf

all: generate mainmenu

mainmenu:
	@cp $(SCRIPTSDIR)/mainmenu.sh mainmenu


generate:
	@mkdir -p $(BINDIR);
	@for dir in $(DEMOS); do \
		if [ -e $(DEMODIR)/$$dir/*.txt ]; then \
			for files in `ls -1 $(DEMODIR)/$$dir/*.txt`; do \
				$(SCRIPTSDIR)/makedemo.py $$files > $(BINDIR)/`basename $$files '.txt'`.pl; \
				chmod +x $(BINDIR)/`basename $$files '.txt'`.pl; \
			done; \
		fi; \
		if [ -e $(DEMODIR)/$$dir/*.pl ]; then \
			for files in `ls -1 $(DEMODIR)/$$dir/*.pl`; do \
				cp $$files $(BINDIR) ; \
			done; \
		fi \
	done

clean:
	@rm -f *.pl
	@rm -f mainmenu
	@rm -rf $(BINDIR)
