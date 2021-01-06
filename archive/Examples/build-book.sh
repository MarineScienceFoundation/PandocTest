#!/bin/bash
set -e
cp "../templates/eisvogel.tex" "../templates/eisvogel.latex"

echo "##"
echo "# Building book example"
echo "##"
echo ""


echo "- custom-book relative paths"
#cd "../custom-titlepage"
pandoc --top-level-division=chapter "../custom-titlepage/relative_custom-title.tex" \
                                    "../ChapterBob/chapterbob.md" \
                                    "../ChapterAlice/chapteralice.md" \
                                    -o "../Output/custom-book.pdf" --from markdown --template "../templates/eisvogel.latex" --listings
pdftoppm -r 150 -png "../Output/custom-book.pdf" > "../Output/custom-book.png"
cd ".."


#rm "../eisvogel.latex"
