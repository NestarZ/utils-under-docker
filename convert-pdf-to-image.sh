for d in $1/*.pdf ; do
    echo $(basename "$d" .pdf).pdf
    docker run -v $1:/imgs konjak/imagemagick-ghostscript convert "/imgs/$(basename "$d" .pdf).pdf" -quality 100 "/imgs/outfile-$(basename "$d" .pdf).jpg"
done
