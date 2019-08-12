Clone the repo as well as submodules (Vundle):

	git clone --recursive https://github.com/lucastheis/vim ~/.vim

Run Vundle to install plugins:

	:PluginInstall

Compile YCM for autocompletion:

	cd ~/.vim/bundle/YouCompleteMe
	./install.py --clang-completer

Link to vimrc:

	ln -s ~/.vim/vimrc ~/.vimrc
