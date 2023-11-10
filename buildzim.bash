tmp=$(mktemp -d)
for md in *.md
do
markdown "$md" > "$tmp/${md%.*}.html"
done
convert -size 256x256 xc: -fill black -stroke none -draw "rectangle 128,128 256,256" $tmp/icon.png
zimwriterfs -w index.html -f icon.png -l fr -t Markdownpédia -d "L'encyclopédie De Mon Monde" -c Sick -p Sick $tmp markdownpedia.zim
rm -r $tmp