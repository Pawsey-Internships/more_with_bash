titles=("$(grep -E '^##\ [0-9]+' README.md)")
for title in "${titles[@]}"
do
	echo "$title"
	
done

csplit --prefix='parts/' --suffix-format='%03d.md' README.md '/^##\ /' "{*}"

for file in $(find parts/*.md)
do
	echo $file
done

i=0
for file in $(find parts/*.md)
do
	basename=$(echo "$(grep -E '^##\ [0-9]+' $file)")
	echo $basename
	#basename=$(echo "$basename" | sed 's/^##\ [0-9]+\./')
	title=$(echo "$basename" | sed -E 's/##\ [0-9]+\. //g')
	basename=$(echo "$title" | sed -E "s/'//g")
	basename=$(echo "$basename" | sed -E "s/\`//g")
	basename=$(echo "$basename" | sed -E 's/\?//g')
	basename=$(echo "$basename" | tr '[:upper:]' '[:lower:]')
	basename=$(echo "$basename" | sed -E 's/\ /_/g')
	basename=$(echo "$basename" | sed -E 's/\.//g')
	basename="${i}_${basename}"
	echo $basename
	mkdir -p content/${basename}
	echo "+++" > temp
	echo "title = \"$title\"" >> temp
	echo "date = 2023-02-14" >> temp
	echo "weight = ${i}" >> temp
	echo "chapter = true" >> temp
	echo "pre = \"<b>${i}. </b>\"" >> temp
	echo "+++" >> temp
	cat temp > "content/${basename}/_index.md"
	cat $file >> "content/${basename}/_index.md"
	i=$((i + 1))
	
done

rm -r content/0_
rm temp

echo "+++" > content/_index.md
echo "title = \"Doing More with BASH\"" >> content/_index.md
echo "date = 2023-02-14" >> content/_index.md
echo "weight = 0" >> content/_index.md
echo "chapter = true" >> content/_index.md
echo "# Doing More with BASH" >> content/_index.md
echo "## An intermediate Unix Workshop" >> content/_index.md
echo "+++" >> content/_index.md
