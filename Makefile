.PHONY: configall clean
configall:plugin
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
	git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	vim +BundleInstall +qall
plugin:vundle cmake python_dev
	@echo "config plugin"
	cd ~/.vim/bundle/YouCompleteMe
	./install.sh --clang-completer
cmake:
	sudo apt-get install cmake -y
python_dev:
	sudo apt-get install python-dev -y
git:
	sudo apt-get install git -y
clean:
	@echo "clean..."
	rm ~/.vimrc
	rm ~/.vim/colors/private.vim
