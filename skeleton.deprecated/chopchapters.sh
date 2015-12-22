i=0 
o=$1
old=1
for l in `cat main.pgs`
do 
new=$(($l+o))
echo $i $old-$(($new-1))
pdftk main.pdf cat $old-$(($new-1)) output $i.pdf 
old=$new
i=$(($i+1))
done
echo $i $old-end
pdftk main.pdf cat $old-end output $i.pdf 