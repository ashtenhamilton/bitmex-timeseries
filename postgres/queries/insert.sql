INSERT INTO timeseries
SELECT
    time_bucket('1 minute'::interval, "timestamp") AS ts,
    '1m' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('3 minute'::interval, "timestamp") AS ts,
    '3m' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('5 minute'::interval, "timestamp") AS ts,
    '5m' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('10 minute'::interval, "timestamp") AS ts,
    '10m' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('15 minute'::interval, "timestamp") AS ts,
    '15m' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('30 minute'::interval, "timestamp") AS ts,
    '30m' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('45 minute'::interval, "timestamp") AS ts,
    '45m' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('1 hour'::interval, "timestamp") AS ts,
    '1h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('2 hour'::interval, "timestamp") AS ts,
    '2h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('3 hour'::interval, "timestamp") AS ts,
    '3h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('4 hour'::interval, "timestamp") AS ts,
    '4h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('5 hour'::interval, "timestamp") AS ts,
    '5h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('6 hour'::interval, "timestamp") AS ts,
    '6h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('7 hour'::interval, "timestamp") AS ts,
    '7h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('8 hour'::interval, "timestamp") AS ts,
    '8h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('9 hour'::interval, "timestamp") AS ts,
    '9h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('10 hour'::interval, "timestamp") AS ts,
    '10h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('12 hour'::interval, "timestamp") AS ts,
    '12h' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('1 day'::interval, "timestamp") AS ts,
    '1d' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('2 day'::interval, "timestamp") AS ts,
    '2d' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;

INSERT INTO timeseries
SELECT
    time_bucket('7 day'::interval, "timestamp") AS ts,
    '7d' as interval,
    symbol,
    FIRST(price, timestamp) as "open",
    MAX(price) as "high",
    MIN(price) as "low",
    LAST(price, timestamp) as "close",
    SUM(size) as "volume",
    SUM(CASE WHEN side = 'Buy' THEN size ELSE CASE WHEN side = 'Sell' THEN -size ELSE 0 END END) as "delta",
    SUM(CASE WHEN side = 'Buy' AND size >= 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 250000 THEN -size ELSE 0 END END) as "delta_250k_geq",
    SUM(CASE WHEN side = 'Buy' AND size >= 166000 AND size < 250000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 166000 AND size < 250000 THEN -size ELSE 0 END END) as "delta_166k_to_250k",
    SUM(CASE WHEN side = 'Buy' AND size >= 86000 AND size < 166000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 86000 AND size < 166000 THEN -size ELSE 0 END END) as "delta_86k_to_166k",
    SUM(CASE WHEN side = 'Buy' AND size >= 50000 AND size < 86000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 50000 AND size < 86000 THEN -size ELSE 0 END END) as "delta_50k_to_86k",
    SUM(CASE WHEN side = 'Buy' AND size >= 26000 AND size < 50000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 26000 AND size < 50000 THEN -size ELSE 0 END END) as "delta_26k_to_50k",
    SUM(CASE WHEN side = 'Buy' AND size >= 11000 AND size < 26000 THEN size ELSE CASE WHEN side = 'Sell' AND size >= 11000 AND size < 26000 THEN -size ELSE 0 END END) as "delta_11k_to_26k",
    SUM(CASE WHEN side = 'Buy' AND size < 11000 THEN size ELSE CASE WHEN side = 'Sell' AND size < 11000 THEN -size ELSE 0 END END) as "delta_11k_lt"
FROM trade
GROUP BY ts, symbol
ORDER BY ts, symbol;