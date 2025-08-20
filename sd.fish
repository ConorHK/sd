function __sd_complete
    set -l sd_root $SD_ROOT
    test -z "$sd_root"; and set sd_root "$HOME/sd"
    
    set -l tokens (commandline -opc)
    set -l current_path "$sd_root"
    
    # Build path from tokens (skip 'sd')
    for i in (seq 2 (count $tokens))
        set current_path "$current_path/$tokens[$i]"
    end
    
    # List directory contents if it exists
    if test -d "$current_path"
        for item in "$current_path"/*
            test -e "$item"; or continue
            set -l name (basename "$item")
            
            if test -x "$item"; and test -f "$item"
                # Executable file - extract first non-shebang comment
                set -l desc (grep '^#[^!]' "$item" 2>/dev/null | head -1 | sed 's/^# *//')
                if test -n "$desc"
                    printf "%s\t%s\n" "$name" "$desc"
                else
                    echo "$name"
                end
            else if test -d "$item"
                # Directory - look for help file
                set -l help_file "$item/help"
                if test -f "$help_file"
                    set -l desc (head -1 "$help_file" 2>/dev/null)
                    if test -n "$desc"
                        printf "%s\t%s\n" "$name" "$desc"
                    else
                        echo "$name"
                    end
                else
                    echo "$name"
                end
            end
        end
    end
    
    # Built-in flags
    printf "%s\t%s\n" "--help" "show help"
    printf "%s\t%s\n" "--new" "create new script"
    printf "%s\t%s\n" "--edit" "edit script"
    printf "%s\t%s\n" "--cat" "show script contents"
    printf "%s\t%s\n" "--which" "show script path"
    printf "%s\t%s\n" "--really" "suppress flag handling"
end

complete -c sd -f -a "(__sd_complete)"
