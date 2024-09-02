links:
	[ -f ~/.tmux.conf ] || ln -s ${PWD}/tmux.conf ~/.tmux.conf
	[ -f ~/.screenrc ] || ln -s ${PWD}/screenrc ~/.screenrc
	[ -f ~/.zshrc ] || ln -s ${PWD}/zshrc ~/.zshrc
	[ -f ~/.bashrc ] || ln -s ${PWD}/bashrc ~/.bashrc
	[ -f ~/.inputrc ] || ln -s ${PWD}/inputrc ~/.inputrc
	[ -d ~/.config/fish ] || ln -s ${PWD}/fish ~/.config/fish
	[ -f ~/.gitconfig ] || ln -s ${PWD}/gitconfig ~/.gitconfig
	[ -d ~/.config/nvim ] || ln -s ${PWD}/nvim ~/.config/nvim
	[ -f ~/.nvmrc ] || ln -s ${PWD}/nvmrc ~/.nvmrc
	[ -f  ~/.config/Code/User/settings.json ] || ln -s ${PWD}/Code/User/settings.json ~/.config/Code/User/settings.json
	[ -f  ~/.gitignore ] || ln -s ${PWD}/gitignore ~/.gitignore
