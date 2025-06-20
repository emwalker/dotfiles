if status is-interactive
    # Commands to run in interactive sessions can go here
    set XDG_CURRENT_DESKTOP Sway
    set -x EDITOR vim

    fish_vi_key_bindings
    fish_git_prompt
    set -g __fish_git_prompt_showdirtystate 1
    source "$HOME/.cargo/env.fish"
    #load_nvm > /dev/stderr
    fish_add_path /usr/local/go/bin
    fish_add_path /home/walker/go/bin
    fish_add_path /home/walker/go/bin
    fish_add_path /home/walker/.pyenv/versions/3.12.7/bin

    if test -f ~/.asdf/asdf.fish
        source ~/.asdf/asdf.fish
    end

    if test -f ~/.rbenv/bin/rbenv
        ~/.rbenv/bin/rbenv init - --no-rehash fish | source
    end
end

# Created by `pipx` on 2024-12-01 20:00:47
set PATH $PATH /home/walker/.local/bin
