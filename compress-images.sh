for X in $1; 
  do convert "$X" -resize 512x256! -strip -define jpeg:extent=200KB "$2/$X"; 
 done
