if [ -z "$2" ]
then
    OUTFILE_NAME="outfile"
else
    OUTFILE_NAME="$2"
fi

docker run -v $1:/imgs konjak/imagemagick-ghostscript convert "/imgs/*.jpg" -quality 100 "/imgs/$OUTFILE_NAME.pdf"
