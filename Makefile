links:
	[ -f ~/.tmux.conf ] || ln -s ${PWD}/tmux.conf ~/.tmux.conf
	[ -f ~/.screenrc ] || ln -s ${PWD}/screenrc ~/.screenrc
	[ -f ~/.zshrc ] || ln -s ${PWD}/zshrc ~/.zshrc
	[ -f ~/.bashrc ] || ln -s ${PWD}/bashrc ~/.bashrc
	[ -f ~/.inputrc ] || ln -s ${PWD}/inputrc ~/.inputrc
