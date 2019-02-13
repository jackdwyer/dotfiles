.PHONY: st firefox
all: folders dotfiles tools
vim: vundle vim-plugins
phat: all st vim

SHELL=/bin/bash
dotfiles:
	./install.sh

FIREFOX_PROFILE_ID=
firefox:
	mkdir $(HOME)/.mozilla/firefox/$(FIREFOX_PROFILE_ID).default/chrome
	cp firefox/userChrome.css $(HOME)/.mozilla/firefox/$(FIREFOX_PROFILE_ID).default/chrome/

folders:
	mkdir -p $(HOME)/{bin,tools,programming,.vim,.i3}

ST_VERSION=0.8.1
st:
	curl -o /tmp/st-$(ST_VERSION).tar.gz "https://dl.suckless.org/st/st-$(ST_VERSION).tar.gz"
	cd /tmp/ && tar xvzf /tmp/st-$(ST_VERSION).tar.gz
	curl -o /tmp/st-$(ST_VERSION)/st-no_bold_colors-$(ST_VERSION).diff "https://st.suckless.org/patches/solarized/st-no_bold_colors-$(ST_VERSION).diff"
	cd /tmp/st-$(ST_VERSION) && patch < st-no_bold_colors-$(ST_VERSION).diff
	cp $(PWD)/st/config.h-solarized-light /tmp/st-$(ST_VERSION)/config.h
	# cp $(PWD)/st/config.h /tmp/st-$(ST_VERSION)/
	cd /tmp/st-$(ST_VERSION) && make && mv st $(HOME)/bin/
	rm -fr /tmp/st-$(ST_VERSION)

tools:
	curl -s -o $(HOME)/bin/geoip https://raw.githubusercontent.com/jackdwyer/geoip/master/geoip.sh
	chmod +x $(HOME)/bin/geoip
	curl -s -o $(HOME)/bin/screenshot https://raw.githubusercontent.com/jackdwyer/s3-screenshot/master/screenshot.sh
	chmod +x $(HOME)/bin/screenshot
	echo "[INFO] Setup screenshot configuration"

vim-folders:
	mkdir -p ${HOME}/.vim

vim-plugins:
	nvim -u $(HOME)/.vim/vimrc -c VundleInstall +qall

vundle: vim-folders
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim-all: vim-folders vundle vim-plugins
