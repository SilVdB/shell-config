# Prompt Configuration
# Using Starship prompt for consistency across all shells

if status is-interactive
    # Initialize Starship prompt
    if type -q starship
        starship init fish | source
    end
end