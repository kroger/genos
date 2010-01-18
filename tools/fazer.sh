for file in *.bib
do
    bibtool -r sort.btl $file -o $file.new
    mv $file.new $file
done
