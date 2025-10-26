function fish_prompt
    set -l prompt_file (dirname (status --current-filename))/fish_prompt.local.fish
    if test -f $prompt_file
        source $prompt_file
        return
    end

    set -l last_status $status
    set -l color_cwd
    set -l suffix

    if functions -q fish_is_root_user; and fish_is_root_user
        set color_cwd $fish_color_cwd_root
        set suffix '#'
    else
        set color_cwd $fish_color_cwd
        set suffix '>'
    end

    echo -n -s (set_color $fish_color_user) $USER (set_color normal) '@' (set_color $fish_color_host) (prompt_hostname) (set_color normal) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) (fish_vcs_prompt) (set_color normal)

    if test $last_status -ne 0
        set_color $fish_color_error
    end
    echo -n "$suffix "
    set_color normal
end
