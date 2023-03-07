# bitmex-trend-bot

All bitmex trades
```
aws --no-sign-request --region=eu-west-1 s3 sync s3://public.bitmex.com . --exclude "*" --include "data/trade/[0123456789]*.csv.gz"
```
