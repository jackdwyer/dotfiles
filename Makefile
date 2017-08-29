.PHONY: st
all: folders dotfiles tools vim-plugins
phat: all st i3-folders vim-folders

SHELL=/bin/bash
dotfiles:
	./install.sh

i3-folders:
	mkdir -p $(HOME)/{.i3}

folders:
	mkdir -p $(HOME)/{bin,tools,programming}

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

vim-folders:
	mkdir -p ${HOME}/{.vim}

vim-plugins: vundle
	nvim -u $(HOME)/.vim/vimrc -c VundleInstall +qall

vundle: vim-folders
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
