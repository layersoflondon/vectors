#!/bin/bash

usage() {
	echo "Usage: $0 [-i my_shapes.gdb] [-o my_folder/]"
}

exit_abnormal() {
  usage
  exit 1
}

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



for i in `ogrinfo -ro -so -q ${FILENAME} | cut -d ' ' -f 2`; do
	# echo $i
	ogr2ogr -f "GeoJSON" "${OUTPUT_PATH}/${i}.json" $FILENAME "${i}"
done
