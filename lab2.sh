
if [ "$#" -ne 1 ]; then
 echo "Please provide exactly one argument"
 exit 1
fi



if [[ -f "$1" && "$1" = *.c ]]; then
owner=$(ls -l $1 | awk '{print $3}')
file_name=$1
month=$(ls -l $1 | awk '{print $6}')
day=$(ls -l $1 | awk '{print $7}')
time=$(ls -l $1 | awk '{print $8}')

temp=$(mktemp)
 
 { 
 echo "/**"
 echo "* File Name: $file_name"
 echo "* Owner: $owner"
 echo "* Last Modified On: $month $day $time"
 echo "*/"
 } > "$temp"

 cat -- "$1" >> "$temp"
 cat -- "$temp" > "$1"
 rm -f "$temp"
 
 echo "Header has been added" 
else
 echo "This is not a valid file"
fi


