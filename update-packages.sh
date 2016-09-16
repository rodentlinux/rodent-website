#!/usr/bin/env bash
# Update docs/packages.md with list of packages from repo.

repo_url='http://esmil.dk/rodent/repo.armv7hl.xz'

{
	echo '# Packages'
	last_section=''

	curl -s "$repo_url" |xz -dc |tr '\t' '\n' |while read -r candidate; do
		# shellcheck disable=SC2034
		read -r recipe
		read -r makedepends
		read -r depends
		# shellcheck disable=SC2034
		read -r sha
		read -r description
		package=${candidate%%=*}
		version=${candidate##*=}

		if [ "${package:0:1}" != "$last_section" ]; then
			last_section="${package:0:1}"
			echo "## ${last_section^^}"
			echo
			echo '<div style="height: 20px"></div>'
			echo
		fi

		echo "<h4 id=\"$package\">$package</h4>"
		echo
		echo "_Version_: $version"
		echo
		echo "$description"
		echo
		echo '_Depends_:'
		for depend in $depends; do
			target=${depend%%=*}
			echo "[$depend](#$target)"
		done
		echo '<br>'
		echo '_Makedepends_:'
		for depend in $makedepends; do
			target=${depend%%=*}
			echo "[$depend](#$target)"
		done
		echo
		echo '<div style="height: 40px"></div>'
		echo
	done
} > docs/packages.md
