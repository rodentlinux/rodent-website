# Rodent Linux web site

These are the files used to update content on the Rodent Linux web site, on
[http://rodentlinux.org](http://rodentlinux.org).

## Contributing

The Rodent Linux web site consitutes the official documentation on using,
changing and extending [Rodent Linux](https://github.com/rodentlinux/rodent),
and we appreciate pull requests with additions, improvements and error fixes.

## Publishing

Given upload access to the Rodent Linux web site, the content can be built and
published with the data in this repo. A prerequisite for doing so is a (recent)
working version of [mkdocs](http://mkdocs.org).

Build the web site content:

	make

Publish the content:

	make publish

If you need to preview your changes beforehand, use the `serve` make target.
This starts a webserver on http://127.0.0.1:8000/, and services the working copy
of the content.

## License

The Rodent Linux web site is released under
[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

Rodent Linux itself is released under
[GNU GPLv3](https://www.gnu.org/licenses/gpl.html).
