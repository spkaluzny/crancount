#!/bin/sh
DIR=/home/spk/DATA/crancount/reports
cd $DIR
rm -f cran_report.html
quarto render cran_report.qmd
if [ -f cran_report.html ]; then
  cp -p cran_report.html ~/public_html/reports/
else
  echo "Failed to generate cran_report.html"
fi
