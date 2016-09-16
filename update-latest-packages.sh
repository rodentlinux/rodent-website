#!/bin/bash

rodent_repo='../rodent'
repo_url='https://rodentlinux.org/rodent/repo.armv7hl.xz'

{
	echo
	echo '### Latest packages'
	echo
	for updated in $(git --git-dir "$rodent_repo/.git" log --name-only --oneline recipes/*/recipe |grep ^recipes/ |head -5 |cut -d/ -f2); do
		first='true'
		curl -s "$repo_url" |xz -dc |tr '\t' '\n' |while read -r candidate; do
			read -r recipe_version
			# shellcheck disable=SC2034
			read -r makedepends
			# shellcheck disable=SC2034
			read -r depends
			# shellcheck disable=SC2034
			read -r sha
			# shellcheck disable=SC2034
			read -r description
			recipe=${recipe_version%%=*}
			version=${recipe_version##*=}
			package=${candidate%%=*}

			if [ "$recipe" = "$updated" ]; then
				if [ -n "$first" ]; then
					echo
					echo "Recipe **$updated** was updated to version $version, releasing packages:<br>"
					first=''
				fi

				echo "• [$package](/packages/#$package)"
			fi
		done
	done
} > docs/latest-packages.md
