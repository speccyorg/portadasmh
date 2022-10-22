#!/usr/bin/env bash

SRC="/tmp/srcdir"
DST="/tmp/dstdir"

# MHXXX/MHXXX_01.jpg (1660x2267)

# galerias/smmhXXX.jpg (146x200)
# portadas/mhXXX.jpg (621x850)

for n in $(seq -f "%03g" 1 217); do
    echo "Processing MH ${n}..."
    src=${SRC}/MH${n}/MH${n}_01.jpg
    dstfilename=${DST}/portadas/mh${n}.jpg
    dstfilenamewebp="${dstfilename/jpg/webp}"
    convert -despeckle -resize 800x -quality 80 -define webp:lossless=false ${src} ${dstfilenamewebp}
    convert -despeckle -resize 800x -quality 80 ${src} ${dstfilename}
    dsttnfilename=${DST}/galerias/smmh${n}.jpg
    dsttnfilenamewebp="${dsttnfilename/jpg/webp}"
    convert -resize 150x -quality 80 -define webp:lossless=false ${src} ${dsttnfilenamewebp}
    convert -resize 150x -quality 80 ${src} ${dsttnfilename}
done
