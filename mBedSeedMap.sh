#!/bin/bash

inputFile=$1
refFile=$2
out="_ready"
outputFile="$inputFile$out"

echo "Input file: $inputFile"
echo "Reference file: $refFile"

#get ref id's
awk -F '[| ]' '/^>/ { print $1}' < $refFile > ids.txt

#count ref seq
numRef=$(grep -c "^>" $refFile)
echo "We have $numRef seeds sequences"

#remove from fasta file
./SeqFilter/bin/SeqFilter $inputFile --ids ids.txt --ids-exclude --out clean.fa -q >>/dev/null

#append ref into the top
cat $refFile clean.fa > $outputFile

#run mBed
./mBed/mBed -infile $outputFile -seedfile $refFile -method SeedMap -numInputSeeds $numRef

#clean intermediate files
rm ids.txt clean.fa
