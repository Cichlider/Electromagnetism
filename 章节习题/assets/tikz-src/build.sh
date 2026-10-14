#!/bin/bash
# Usage: ./build.sh <name-without-ext>
set -e
name="$1"
pdflatex -interaction=nonstopmode -halt-on-error "${name}.tex" > "/tmp/${name}_build.log" 2>&1 || {
  echo "BUILD FAILED for $name"; tail -40 "/tmp/${name}_build.log"; exit 1;
}
pdftoppm -png -r 300 "${name}.pdf" "${name}"
mv "${name}-1.png" "../${name}-v2.png"
echo "OK: ${name} -> ../${name}-v2.png"
