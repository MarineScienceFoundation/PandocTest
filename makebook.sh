pandoc -o  MSF_template.pdf \
  title.txt \
  README.md \
  --include-before-body cover.tex \
  --variable mainfont="DejaVu Sans" \
  --variable monofont="DejaVu Sans Mono" \
  --variable fontsize=12pt \
  --variable geometry:a4paper \
  --variable number-sections \
  --table-of-contents \
  --toc-depth=1 \
  --top-level-division=chapter \
  --pdf-engine=pdflatex \
