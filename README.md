Clone the repo as well as submodules (Vundle):

	git clone --recursive https://github.com/lucastheis/vim ~/.vim

Run Vundle to install plugins:

	:PluginInstall

Compile YCM for autocompletion:

	cd ~/.vim/bundle/YouCompleteMe
	./install.py --clang-completer

Install this version of the Menlo font (patched to work with vim-airline):

	https://github.com/abertsch/Menlo-for-Powerline
