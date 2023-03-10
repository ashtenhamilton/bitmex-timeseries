SELECT
    time_bucket('6 hour'::interval, "timestamp") AS ts,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250000k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_leq"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;