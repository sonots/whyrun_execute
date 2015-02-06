#!/bin/sh
bundle exec yardoc
rsync -au --delete doc/ /tmp/doc
\rm -r doc/
git checkout gh-pages
\rm -r doc/
rsync -au --delete /tmp/doc/ doc
