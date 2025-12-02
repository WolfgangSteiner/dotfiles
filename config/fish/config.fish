fish_add_path ~/.bin ~/bin ~/.local/bin
fish_add_path ~/dev/tools/build ~/dev/tools/scripts
fish_add_path ~/dev/grv_mono/build


if status is-interactive
    zoxide init fish | source
end
