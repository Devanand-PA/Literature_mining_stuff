read searchquery1
#searchquery1="protein structure"
searchquery="$(echo $searchquery1 | sed 's/ /+/g'  )"
for i in {1..5}
do
curl -A 'Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0' "https://scholar.google.com/scholar?hl=en&start=${i}0&as_sdt=0%252C5&q=$searchquery" > test${i}.html
sed -i 's/>/>\n/g' test${i}.html
done
firefox $(cat test*.html  | grep href | grep -v accounts.google | grep pdf | awk -F "\"" '{print $2}')
