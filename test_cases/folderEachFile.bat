//convert png to jpg
//for i in *.png ; do convert "$i" "${i%.*}.jpg"

//Requires ImageMagick 
for img in *.png; do
    filename=${img%.*}
    convert "$filename.png" "$filename.jpg"
done

for x in ./*.*; do
  mkdir "${x%.*}" && mv "$x" "${x%.*}"
done

//create some duplicates (need 20 per category, minumum)
find . -name '*.jpg' -exec cp {} {}$RANDOM.jpg \;

//remove underscores (this is not reccursive - run multiple times =D)
for file in ./*; do
mv "$file" "${file/_/}"
done

//Filenames are important, they are used for decising into which category will an image go.
for i in *.jpg; do mv $i $(echo $i | md5).jpg; done


for fname in *.jpg
do
   echo mv "$fname" $RANDOM.jpg
done

OR

for fname in *.jpg;
do
mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d' ').jpg
done

for i in *.jpg; do mv $i $(openssl rand -rand $i -hex 16).jpg; done

find . -name '*.jpg' -exec mv {} $(openssl rand -rand $i -hex 16).jpg \;