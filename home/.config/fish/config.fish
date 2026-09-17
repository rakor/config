source /usr/share/cachyos-fish-config/cachyos-config.fish
source ~/.config/fish/gnupg.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end


set -gx EDITOR nvim
set -gx VISUAL nvim

# von superfile um cd_on_quit zu ermöglichen
function spf
    set os $(uname -s)

    if test "$os" = "Linux"
        set spf_last_dir "$HOME/.local/state/superfile/lastdir"
    end

    if test "$os" = "Darwin"
        set spf_last_dir "$HOME/Library/Application Support/superfile/lastdir"
    end

    command spf $argv

    if test -f "$spf_last_dir"
        source "$spf_last_dir"
        rm -f -- "$spf_last_dir" >> /dev/null
    end
end
