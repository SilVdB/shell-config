# Claude Function
# Custom Claude Code wrapper with auto-detection of project settings

function claude --description 'Claude Code wrapper with auto-detection'
    # Set environment variable to disable zsh completion warnings
    set -x ZSH_DISABLE_COMPFIX true

    # Check if .claude/AUTO_PLAN_MODE.txt exists in current directory
    if test -f .claude/AUTO_PLAN_MODE.txt
        # Use the file content as system prompt
        command claude --append-system-prompt (cat .claude/AUTO_PLAN_MODE.txt | string collect) $argv
    else
        # Run normally without the append-system-prompt
        command claude $argv
    end
end