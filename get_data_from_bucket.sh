#!/bin/bash



# modify from 
# https://github.com/yennanliu/data-science-on-gcp/blob/master/02_ingest/ingest_from_crsbucket.sh


if [ "$#" -ne 1 ]; then
    echo "Usage: ./get_data_from_bucket.sh  destination-bucket-name"
    exit
fi

BUCKET=$1
FROM=gs://data-science-on-gcp/flights/raw
TO=gs://$BUCKET/flights/raw

CMD="gsutil -m cp "
for MONTH in `seq -w 1 12`; do
  CMD="$CMD ${FROM}/2015${MONTH}.csv"
done
CMD="$CMD ${FROM}/201601.csv $TO"

echo $CMD
$CMD
