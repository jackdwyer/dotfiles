.PHONY: st
all: folders dotfiles st tools vim-plugins

folders:
	mkdir -p $(HOME)/{bin,tools,programming,.i3,.vim}

vim-plugins:
	nvim -u $(HOME)/.vim/vimrc -c VundleInstall +qall

SHELL=/bin/bash
dotfiles:
	./install.sh

st:
	git clone git://git.suckless.org/st /tmp/st
	cp $(PWD)/st/config.h /tmp/st
	cd /tmp/st && make && mv st $(HOME)/bin/
	rm -fr /tmp/st

tools:
	curl -s -o $(HOME)/bin/geoip https://raw.githubusercontent.com/jackdwyer/geoip/master/geoip.sh
	chmod +x $(HOME)/bin/geoip
	curl -s -o $(HOME)/bin/screenshot https://raw.githubusercontent.com/jackdwyer/s3-screenshot/master/screenshot.sh
	chmod +x $(HOME)/bin/screenshot
	echo "[INFO] Setup screenshot configuration"
