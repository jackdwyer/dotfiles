all: dotfiles tools vim-plugins

vim-plugins:
	nvim -u $(HOME)/.vim/vimrc -c VundleInstall +qall

SHELL=/bin/bash
dotfiles:
	./install.sh

tools:
	curl -s -o $(HOME)/bin/geoip https://raw.githubusercontent.com/jackdwyer/geoip/master/geoip.sh
	chmod +x $(HOME)/bin/geoip
	curl -s -o $(HOME)/bin/screenshot https://raw.githubusercontent.com/jackdwyer/s3-screenshot/master/screenshot.sh
	chmod +x $(HOME)/bin/screenshot
	echo "[INFO] Setup screenshot configuration"
