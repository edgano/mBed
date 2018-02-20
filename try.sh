#!/bin/bash

inputFile=$1
refFile=$2
out="_ready"
ref_full="ref_full.txt"
outputFile="$inputFile$out"

echo "Input file: $inputFile"
echo "Reference file: $refFile"

python populate_fasta.py $inputFile $refFile $ref_full

#get ref id's
#awk -F '[| ]' '/^>/ { print $1}' < $refFile > ids.txt

#count ref seq
#numRef=$(grep -c "^>" $refFile)
numRef=$(cat $refFile | wc -l)
echo "We have $numRef seeds sequences"

#remove from fasta file
./SeqFilter/bin/SeqFilter $inputFile --ids $refFile --ids-exclude --out clean.fa -q >>/dev/null

#append ref into the top
cat $ref_full clean.fa > $outputFile

#run mBed
./mBed/mBed -infile $outputFile -seedfile $ref_full -method SeedMap -numInputSeeds $numRef

#clean intermediate files
#rm ids.txt clean.fa ref_full.txt
