set -g CONDA_ENVS_FILE ~/.config/fish/.conda_envs

function _record_conda_env
    set current_env (conda info --envs | grep '*' | awk '{print $1}')
    if test -n "$current_env"
        set current_dir (pwd)
        echo "$current_dir $current_env" >> $CONDA_ENVS_FILE
        # 删除重复记录，只保留最新的
        awk '!seen[$1]++' $CONDA_ENVS_FILE > $CONDA_ENVS_FILE.tmp
        mv $CONDA_ENVS_FILE.tmp $CONDA_ENVS_FILE
    end
end

function _remove_conda_env_record
    set current_dir (pwd)
    if test -e $CONDA_ENVS_FILE
        grep -v "^$current_dir " $CONDA_ENVS_FILE > $CONDA_ENVS_FILE.tmp
        mv $CONDA_ENVS_FILE.tmp $CONDA_ENVS_FILE
    end
end

function _activate_conda_env
    set current_dir (pwd)
    if test -e $CONDA_ENVS_FILE
        set target_env (grep "^$current_dir " $CONDA_ENVS_FILE | awk '{print $2}' | tail -n 1)
        if test -n "$target_env"
            mamba activate $target_env
        end
    end
end

function ma
	mamba activate $(mamba env list | awk '{print $1}' | fzf)
	_record_conda_env
end
function mda
	mamba deactivate
	_remove_conda_env_record
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/maya/.bin/miniforge3/bin/conda
    eval /home/maya/.bin/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/maya/.bin/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/maya/.bin/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/maya/.bin/miniforge3/bin" $PATH
    end
end

if test -f "/home/maya/.bin/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/home/maya/.bin/miniforge3/etc/fish/conf.d/mamba.fish"
		_activate_conda_env
end
# <<< conda initialize <<<
