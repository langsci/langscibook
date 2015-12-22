#!/bin/sh 
modulo=$1 
#count page numbers
p=$(pdfinfo $2 | grep Pages | sed 's/[^0-9]*//') 
# prepare for removal of backcover
endpage=$(($p - 1))  
effectivepages=$(($p - 1))  
# compute how many blank pages to add
n=$(($modulo -  $effectivepages % modulo)) 
# start with no blank pages
b=''
#accumulate Bs until we reach a multiple
while [ $n -ne 0 ]; do
  b=$b\ B
  n=$(($n - 1))
  done
echo $b 
# strip front and back cover and add blank pages to meet multiple of modulo
pdftk A=$2 B=blank.pdf cat B A2-$endpage $b output $3

