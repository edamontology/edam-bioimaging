#!/bin/bash
# Script to count the number of references to EDAM in BISE
#
# Usage: EDAM-bioimaging_lookup BISE-dump.ttl EDAM-bioimaging.csv
#
#Example sources of data
# wget https://github.com/NeuBIAS/bise-core-ontology/blob/master/data-dumps/2018-01-29/neubias-dump-20180129.ttl
# wget http://edamontology.org/EDAM-bioimaging.csv

# Last edit: Joakim Lindblad 2018-01-29


#Choose the pattern you are interested in
#pattern=http://edamontology.org/operation_
#pattern=http://edamontology.org/data_
#pattern=http://edamontology.org/topic_

pattern=http://edamontology.org/

#Assumed Header of EDAM csv file: Class ID,Preferred Label
sed -n "s%.*\<\(${pattern}.*\)\>.*%^\1%p" "$1" | while read a; do grep "$a" "$2" | cut -d , -f 2; done | sort | uniq -c | sort -nr
