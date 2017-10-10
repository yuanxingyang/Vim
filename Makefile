.PHONY: configall clean
configall:plugin
	@echo "config finish!"

vimrc:colorscheme
	@echo "config vimrc"
	ln vimrc ~/.vimrc

colorscheme:
	@echo "config colorscheme"
	mkdir -p ~/.vim/colors/
	ln private.vim ~/.vim/colors/private.vim
vundle:vimrc
	@echo "config vundle"
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	vim +BundleInstall +qall
plugin:vundle
	@echo "config plugin"
	cd ~/.vim/bundle/YouCompleteMe
	./install.sh --clang-completer
clean:
	@echo "clean..."
	rm ~/.vimrc
	rm ~/.vim/colors/private.vim
