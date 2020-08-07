#!/bin/bash
set -e
cp "../templates/eisvogel.tex" "../templates/eisvogel.latex"

echo "##"
echo "# Building book example"
echo "##"
echo ""


echo "- custom-titlepage"
cd "../custom-titlepage"
pandoc --top-level-division=chapter "custom-titlepage.md" -o "../output/custom-titlepage.pdf" --from markdown --template "../templates/eisvogel.latex" --listings
pdftoppm -r 150 -png "../output/custom-titlepage.pdf" > "../output/custom-titlepage.png"
cd ".."


#rm "../eisvogel.latex"
