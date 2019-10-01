for id in {104..120}
do
  awk -F, '$2=$2+1' OFS=, inventory.csv > inventory2.csv
  cp inventory2.csv inventory.csv
  rm inventory2.csv
  git commit -a -m "C$id - some change"
done

