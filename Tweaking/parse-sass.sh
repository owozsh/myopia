#!/bin/bash
set -ueo pipefail

if [[ ! "$(command -v sassc)" ]]; then
  echo "'sassc' needs to be installed to generate the CSS."
  exit 1
fi

SASSC_OPT=('-M' '-t' 'compact')

_SHAPE_VARIANTS=('' '-R')
_ALPHA_VARIANTS=('' '-T')

if [[ -n "${SHAPE_VARIANTS:-}" ]]; then
  IFS=', ' read -r -a _SHAPE_VARIANTS <<< "${SHAPE_VARIANTS:-}"
fi

if [[ -n "${ALPHA_VARIANTS:-}" ]]; then
  IFS=', ' read -r -a _ALPHA_VARIANTS <<< "${ALPHA_VARIANTS:-}"
fi

echo "== Generating the CSS..."

for shape in "${_SHAPE_VARIANTS[@]}"; do
  for alpha in "${_ALPHA_VARIANTS[@]}"; do
    sassc "${SASSC_OPT[@]}" "./Variations/Settings$shape$alpha.scss" "../Variations/Myopia$shape$alpha/gtk-3.0/gtk.css"
  done
done