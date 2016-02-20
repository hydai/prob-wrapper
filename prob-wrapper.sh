#!/bin/bash

TMP_ROOT="/tmp/sprout-prob"

echo "======================================="
echo "Cleanup temp folder..."
rm -rf $TMP_ROOT
rm ./output/pack.tar.xz
mkdir $TMP_ROOT
mkdir $TMP_ROOT/http
mkdir $TMP_ROOT/res
mkdir $TMP_ROOT/res/testcase
echo "Cleanup temp folder......Done"

echo "======================================="
echo "Generate conf.json..."
python ./gen-json.py
echo "Generate conf.json......Done"

echo "======================================="
echo "Generate cont.html..."
echo "Full file name of your problem markdown(ex: prob.md): "
read prob_md_path
prob_md_path="./data/"$prob_md_path
pandoc --mathjax $prob_md_path -o $TMP_ROOT/http/cont.html -f markdown -t html
echo "Generate cont.html......Done"

echo "======================================="
echo "Copy input and output file..."
cp ./data/*.in $TMP_ROOT/res/testcase
cp ./data/*.out $TMP_ROOT/res/testcase
echo "Copy input and output file......Done"

echo "======================================="
echo "Zip all files to output/pack.tar.xz..."
cd $TMP_ROOT
tar -Jcvf pack.tar.xz conf.json res http
cd -
mv $TMP_ROOT/pack.tar.xz ./output/
echo "Zip all files to output/pack.tar.xz......Done"
echo "======================================="
