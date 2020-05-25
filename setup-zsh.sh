#!/bin/bash

repo_dir=$(cd `dirname $0` && pwd)

echo "repo_dir=${repo_dir}"

cd $HOME

bak_dir=$HOME/bak/linux_`date "+%Y%m%d-%H.%M.%S"`
mkdir -p $bak_dir

mv .zshrc $bak_dir/bak.zshrc
mv .profile $bak_dir/bak.profile

ln -s ${repo_dir}/_zshrc ${HOME}/.zshrc
if [[ $? -ne 0 ]]; then
    echo "ERROR: creating my .zshrc"
    exit 255
fi

ln -s ${repo_dir}/_profile ${HOME}/.profile
if [[ $? -ne 0 ]]; then
    echo "ERROR: creating my .profile"
    exit 255
fi

mv ${HOME}/.oh-my-zsh/custom/themes/ross.zsh-theme $bak_dir/
ln -s ${repo_dir}/ross.zsh-theme ${HOME}/.oh-my-zsh/custom/themes/ross.zsh-theme
if [[ $? -ne 0 ]]; then
    echo "ERROR: creating ross.zsh-theme"
    exit 255
fi

