.PHONY: configall clean
configall:vimrc
	@echo "config finish!"

vimrc:colorscheme
	@echo "config vimrc"
	ln vimrc ~/.vimrc

colorscheme:
	@echo "config colorscheme"
	mkdir -p ~/.vim/colors/
	ln private.vim ~/.vim/colors/private.vim
clean:
	@echo "clean..."
	rm ~/.vimrc
	rm ~/.vim/colors/private.vim
