#!/bin/bash
set -e
cp "../templates/eisvogel.tex" "../templates/eisvogel.latex"

echo "##"
echo "# Building book example"
echo "##"
echo ""


echo "- custom-titlepage"
cd "../custom-titlepage"
pandoc --top-level-division=chapter "custom-title.md" -o "../output/custom-title.pdf" --from markdown --template "../templates/eisvogel.latex" --listings
pdftoppm -r 150 -png "../output/custom-title.pdf" > "../output/custom-title.png"
cd ".."


#rm "../eisvogel.latex"
