# var
MODULE = $(notdir $(CURDIR))

# tool
CURL = curl -L -o

# src
D += $(wildcard src/*.d)
J += $(wildcard *.json)

# all
.PHONY: all run
all: bin/$(MODULE)
	dub build
run:
	dub run

# rule
bin/$(MODULE): $(D) $(J)

# doc
.PHONY: doc
doc: doc/Gubichev_QL.pdf

doc/Gubichev_QL.pdf:
	$(CURL) $@ https://mediatum.ub.tum.de/doc/1238730/1238730.pdf

# install
.PHONY: install update gz
install: doc gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
gz:
