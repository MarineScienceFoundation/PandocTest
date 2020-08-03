#!/bin/bash
set -e
cp "../eisvogel.tex" "../eisvogel.latex"

echo "##"
echo "# Building book example"
echo "##"
echo ""


#echo "- book"
# Additional options like `book: true` and `classoption: [oneside]` are set in the markdown file via the YAML metadata block.
#pandoc "book/book.md" -o "book/book.pdf" --from markdown --template "../eisvogel.latex" --listings --top-level-division="chapter"
#pdftoppm -r 150 -png "book/book.pdf" > "book/book.png"


#echo "- titlepage-background"
#cd "titlepage-background"
#pandoc "titlepage-background.md" -o "titlepage-background.pdf" --from markdown --template "../../eisvogel.latex" --listings
#pdftoppm -r 150 -png "titlepage-background.pdf" > "titlepage-background.png"
#cd ".."

#echo "- custom-titlepage"
#cd "custom-titlepage"
#pandoc "custom-titlepage.md" -o "custom-titlepage.pdf" --from markdown --template "../../eisvogel.latex" --listings
#pdftoppm -r 150 -png "custom-titlepage.pdf" > "custom-titlepage.png"
#cd ".."



#echo "- MSF logo-titlepage"
# Important: Since the logo is a manually included image, the option "--resource-path" can't be used for specifying its location.
# The location of the logo has to be relative to where pandoc is executed, so we cd into the directory with the logo.
#cd "MSF-titlepage"
#pandoc --top-level-division=chapter "logo-titlepage.md" -o "logo-titlepage.pdf" --from markdown --template "../../eisvogel.latex" --listings
#pdftoppm -r 150 -png "logo-titlepage.pdf" > "logo-titlepage.png"
#cd ".."

echo "- custom-titlepage"
cd "../custom-titlepage"
pandoc --top-level-division=chapter "custom-titlepage.md" -o "custom-titlepage.pdf" --from markdown --template "../eisvogel.latex" --listings
pdftoppm -r 150 -png "custom-titlepage.pdf" > "custom-titlepage.png"
cd ".."


#rm "../eisvogel.latex"
