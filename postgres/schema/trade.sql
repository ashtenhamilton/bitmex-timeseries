create table trade
(
    timestamp timestamp,
    symbol text,
    side text,
    size bigint,
    price numeric,
    tickDirection text,
    trdMatchID text,
    grossValue bigint,
    homeNotional numeric,
    foreignNotional numeric,
    trdType text
);
