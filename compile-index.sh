#!/bin/bash

{
	for file in welcome.md latest-packages.md; do
		cat docs/$file
		echo
	done
} > docs/index.md
