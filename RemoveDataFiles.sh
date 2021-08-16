#!/bin/bash

# How : Devops
# Want: Remove the data files in the local or remote server AWS EC2
# For : Perform a clean-up of un-used dataset files

# CSV
temp_file="files_to_delete_csv.txt"
touch $temp_file

find / -type f -name "*.csv" -not -path "*/venv/*" -not -path "*/csv_translations/*" -not -path "*/python3.7/*" -not -path "*/python3.8/*" -not -path "*/snap/*" -not -path "*/overlay2/*" -not -path "*/distro-info/*" -not -path "*/gawk/*" -print0 | while read -d $'\0' file
do
    echo ${file} >> $temp_file
done
files=$(cat $temp_file)
find / -type f -name '*.csv' -not -path "*/venv/*" -not -path "*/csv_translations/*" -not -path "*/python3.7/*" -exec rm -f {} \;
echo $files
rm -rf $temp_file

# TSV
temp_file="files_to_delete_tsv.txt"
touch $temp_file

find / -type f -name "*.tsv" -not -path "*/venv/*" -not -path "*/csv_translations/*" -not -path "*/python3.7/*" -not -path "*/python3.8/*" -not -path "*/snap/*" -not -path "*/overlay2/*" -not -path "*/distro-info/*" -not -path "*/gawk/*" -print0 | while read -d $'\0' file
do
    echo ${file} >> $temp_file
done
files=$(cat $temp_file)
find / -type f -name '*.tsv' -not -path "*/venv/*" -not -path "*/csv_translations/*" -not -path "*/python3.7/*" -exec rm -f {} \;
echo $files
rm -rf $temp_file

# TSV.GZ
temp_file="files_to_delete_tsv_gz.txt"
touch $temp_file

find / -type f -name "*.tsv.gz" -not -path "*/venv/*" -not -path "*/csv_translations/*" -not -path "*/python3.7/*" -not -path "*/python3.8/*" -not -path "*/snap/*" -not -path "*/overlay2/*" -not -path "*/distro-info/*" -not -path "*/gawk/*" -not -path "*/example_output/*" -print0 | while read -d $'\0' file
do
    echo ${file} >> $temp_file
done
files=$(cat $temp_file)
find / -type f -name '*.tsv.gz' -not -path "*/venv/*" -not -path "*/csv_translations/*" -not -path "*/python3.7/*" -exec rm -f {} \;
echo $files
rm -rf $temp_file