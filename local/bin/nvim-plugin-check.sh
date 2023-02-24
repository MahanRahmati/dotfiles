#!/bin/bash

echo "Checking Plugins..."

PLUGINS=$(grep -A 2000 'lazy.setup {' ~/.config/nvim/lua/core/plugins.lua | grep -A 1 '{' | grep ',' | cut -d'"' -f 2)

for repo in ${PLUGINS[*]}; do
	ORIGINCOMMIT=$(git ls-remote https://github.com/"$repo".git HEAD | awk '{print $1}')
	LOCALCOMMIT=$(grep -A 1 "$repo" ~/.config/nvim/lua/core/plugins.lua | grep commit | cut -d'"' -f 2)

	if [[ "$ORIGINCOMMIT" != "$LOCALCOMMIT" ]]; then
		echo "============"
		echo "$repo"
		echo "$ORIGINCOMMIT"
		echo "============"
	fi

done
