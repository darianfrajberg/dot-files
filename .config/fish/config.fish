fish_vi_key_bindings

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/antonbossenbroek/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

