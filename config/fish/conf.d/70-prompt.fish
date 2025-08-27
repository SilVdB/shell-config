# Prompt Configuration
# Custom Fish prompt with PWD, Kubernetes context, and Git info

if status is-interactive
    # Set PWD directory length to show full path
    set -g fish_prompt_pwd_dir_length 0

    function fish_prompt
        # PWD
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal

        # Kubernetes
        set -l k8s_context (kubectl config current-context 2>/dev/null)
        if test -n "$k8s_context"
            set -l k8s_namespace (kubectl config view --current --minify --output 'jsonpath={.contexts[0].context.namespace}' 2>/dev/null)
            if test -z "$k8s_namespace"
                set k8s_namespace "default"
            end
            printf ' (⎈|%s:%s)' $k8s_context $k8s_namespace
        end

        # Git
        printf '%s' (fish_git_prompt ' git:(%s)')

        # Final space
        printf ' '
        set_color normal
    end
end