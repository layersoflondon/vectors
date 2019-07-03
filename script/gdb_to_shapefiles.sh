#!/bin/bash

usage() {
	echo "Usage: $0 [-i my_shapes.gdb] [-o my_folder/]"
}

exit_abnormal() {
  usage
  exit 1
}

DOCKER="docker run -ti --rm -v $(pwd):/data klokantech/gdal"

while getopts "i:o:" options; do
	case "${options}" in
		i)
			FILENAME=${OPTARG}
			;;
		o)
			OUTPUT_PATH=${OPTARG}
			;;
		:)
			echo "Error: -${OPTARG} needs to be included"
			exit_abnormal
			;;
		*)
			exit_abnormal
			;;
	esac
done



for i in `$DOCKER ogrinfo -ro -so -q ${FILENAME} | cut -d ' ' -f 2`; do
	echo $i;
	$DOCKER ogr2ogr -f "ESRI Shapefile" "${OUTPUT_PATH}/${i}.shp" $FILENAME "${i}"
done
