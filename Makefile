build:
	mkdocs build

publish:
	rsync \
		--archive \
		--verbose \
		--delete-after \
		--exclude /__init__.* \
		site/ \
		rodentlinux.org:/www/

serve:
	mkdocs serve

clean:
	rm -rf site
