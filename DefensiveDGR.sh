#!/bin/bash

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1O2yhzYcWZYhhE1rCy9AGPZSdBCEcls0d' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1O2yhzYcWZYhhE1rCy9AGPZSdBCEcls0d" -O v_Data.tar.xz && rm -rf /tmp/cookies.txt
mkdir dir1
tar -xf v_Data.tar.xz -C dir1
rm v_Data.tar.xz
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1iVOdIJBe5i6ge91rDYFLp1fBsHdG2XAt' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1iVOdIJBe5i6ge91rDYFLp1fBsHdG2XAt" -O r_Data.tar.xz && rm -rf /tmp/cookies.txt
mkdir dir2
tar -xf r_Data.tar.xz -C dir2
rm r_Data.tar.xz

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CwEkIm9XkgyO0F7vAo-K6HiEMeKCYqH_' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CwEkIm9XkgyO0F7vAo-K6HiEMeKCYqH_" -O draw_figures.py && rm -rf /tmp/cookies.txt

mkdir icity_scores
n=0
x=1
>union_set
while [ $n -le 1 ]
do
    cd dir1
    python3 icity.py
    cd ../dir2
    python3 icity.py
    cd ..
    cp dir1/icity_pfam.csv icity_scores/v${x}_icity_pfam.csv
    cp dir2/icity_pfam.csv icity_scores/r${x}_icity_pfam.csv
    x=$(($x+1))
    old_union_set=$(cat union_set)
    python3 union_set.py
    new_union_set=$(cat union_set)
    if [ "$old_union_set" == "$new_union_set" ]; then
        n=$(( $n + 1 ))
        echo "match"
    else
        n=0
        echo "no match"
    fi
done

python3 draw_figures.py

