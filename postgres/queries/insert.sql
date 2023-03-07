SELECT
    time_bucket('1 hour'::interval, "timestamp") AS ts,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume"
FROM trade
WHERE "symbol" = 'XBTUSD'
GROUP BY ts, symbol;