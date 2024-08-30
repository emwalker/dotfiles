if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    fish_git_prompt
    set -g __fish_git_prompt_showdirtystate 1
    source "$HOME/.cargo/env.fish"
    #load_nvm > /dev/stderr
    fish_add_path /usr/local/go/bin
    fish_add_path /home/walker/go/bin
end
