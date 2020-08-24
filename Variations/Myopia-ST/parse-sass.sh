#!/bin/sh

[ "$(which sassc 2> /dev/null)" ] || {
   echo "sassc needs to be installed to generate the css."
   exit 1
}

SASSC_OPT="-M -t compact"

echo "Generating the css..."

sassc $SASSC_OPT Myopia-Settings.scss gtk-3.0/gtk.css
