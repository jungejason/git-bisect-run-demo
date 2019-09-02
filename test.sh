# Check the size of inventory. Return 1 when it fails. REturn 0 when it succeeds.

if [ `wc -l inventory.csv | awk '{print $1}'` -gt "3" ]
then
  echo Test Failed
  exit 1
fi

echo Test Passed

