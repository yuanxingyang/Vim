.PHONY: configall clean
exist = $(shell if [ -f $(FILE) ]; then echo "exist"; else echo "notexist"; fi;)

configall:plugin ssh
ifeq (exist,"~/.vim/bundle/LeaderF/")
	cd ~/.vim/bundle/LeaderF/ && ./install.sh
endif
	@echo "config finish!"

vimrc:colorscheme
	@echo "config vimrc"
	ln vimrc ~/.vimrc
	ln gdbinit ~/.gdbinit

colorscheme:
	@echo "config colorscheme"
	mkdir -p ~/.vim/colors/
	ln private.vim ~/.vim/colors/private.vim
vundle:vimrc git
	@echo "config vundle"
	mkdir -p ~/.vim/bundle/
ifeq (exist,"~/.vim/bundle/vundle")
	git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	vim +BundleInstall +qall
else
	cd ~/.vim/bundle/vundle && git pull
	vim +BundleInstall +qall
endif

plugin:vundle cmake python_dev tmux
	@echo "config plugin"
ifeq (exist,"~/.vim/bundle/YouCompleteMe")
	cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
endif
cmake:
	sudo apt-get install cmake -y
python_dev:
	sudo apt-get install python-dev -y
git:
	sudo apt-get install git -y

tmux:
ifeq (exist,"~/.vim/bundle/vundle")	
	sudo apt-get install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln tmux.conf ~/.tmux.conf
endif
ssh:
	echo "ServerAliveInterval 60" >> ~/.ssh/config
clean:
	@echo "clean..."
	rm ~/.vimrc
	rm ~/.gdbinit
	rm ~/.vim/colors/private.vim
