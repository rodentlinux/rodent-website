#!/usr/bin/env bash
# Update docs/packages.md with list of packages from repo.

repo_url='http://esmil.dk/rodent/repo.armv7hl.xz'

{
	echo '# Packages'
	last_section=''

	curl -s "$repo_url" |xz -dc |while read -r line; do
		candidate=$(echo "$line" |cut -f1)
		#recipe=$(echo "$line" |cut -f2)
		makedepends=$(echo "$line" |cut -f3)
		depends=$(echo "$line" |cut -f4)
		#sha=$(echo "$line" |cut -f5)
		description=$(echo "$line" |cut -f6)
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
