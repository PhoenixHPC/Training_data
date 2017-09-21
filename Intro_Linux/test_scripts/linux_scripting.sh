#!/bin/bash
# Declare some helpful variables
FILEDIR=~/fastdir/training_linux/scripting
FILENAME=NC_015214.gff
OUTFILE=NC_015214_CDS.txt
# Make sure the directory exists
if [ -d ${FILEDIR} ];
then
echo Changing to ${FILEDIR}
cd ${FILEDIR}
else
echo Cannot find directory ${FILEDIR}
exit 1
fi
# If the file exists, extract the important ProbeFeature data
if [ -a ${FILENAME} ];
then
echo Extracting ProbeFeature data from ${FILEDIR}/${FILENAME}
echo "SeqID Source Start Stop Strand Tags" > ${OUTFILE}
awk '{if (($3=="ProbeFeature")) print $1, $2, $4, $5, $7, $9}' ${FILENAME} >> \
${OUTFILE}
else
echo Cannot find ${FILENAME}
exit 1
fi
