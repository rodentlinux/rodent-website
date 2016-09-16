build:
	bash update-packages.sh
	bash update-latest-packages.sh
	bash compile-index.sh
	mkdocs build

publish:
	rsync \
		--archive \
		--verbose \
		--delete-after \
		--exclude /__init__.* \
		--exclude /rodent \
		site/ \
		rodentlinux.org:/www/

serve:
	mkdocs serve

clean:
	rm -rf site
