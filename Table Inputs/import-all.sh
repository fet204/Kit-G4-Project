
set +e

# Note: Group4 is using table constraints, so tables must
# be loaded in the following order to fulfill these constraints:


data='
Person.txt
PaymentData.txt
Donation.txt
Merchandise.txt
Sale.txt
LineItem.txt
Comment.txt
Events.txt
Resource.txt
'

for x in $data; do
    psql -d group4 --file="$x"
done
