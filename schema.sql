SET time zone UTC;
SET datestyle TO ymd;

DROP TABLE IF EXISTS sale;
CREATE TABLE sale (
    id          INTEGER PRIMARY KEY,
    branch      TEXT,
    sold_at     TIMESTAMP WITH TIME ZONE,
    customer    TEXT,
    product     TEXT,
    price       INTEGER,
    discount    INTEGER
);

INSERT INTO sale (
    id,     branch, sold_at,                   customer,   product,       price,  discount
) VALUES
    (1,     'NY',   '2020-04-01 03:15:00 UTC', 'Bill',    'Shoes',        10000,  1000),
    (2,     'NY',   '2020-04-01 04:00:00 UTC', null,      'Shoes',        5000,   0),
    (3,     'LA',   '2020-04-01 06:15:00 UTC', 'Lily',    'Shoes',        15000,  0),
    (4,     'LA',   '2020-04-01 09:10:00 UTC', 'John',    'Shoes',        5000,   2500),
    (5,     'NY',   '2020-04-01 03:15:00 UTC', null,      'Shirt',        1500,   0),
    (6,     'NY',   '2020-04-01 02:07:00 UTC', 'John',    'Shirt',        1850,   0),
    (7,     'LA',   '2020-03-31 09:55:00 UTC', 'Bill',    'Shirt',        1250,   0),
    (8,     'LA',   '2020-03-31 10:45:00 UTC', 'Lily',    'Shirt',        1850,   100),
    (9,     'NY',   '2020-03-31 07:45:00 UTC', 'Lily',    'Pants',        5200,   0),
    (10,    'LA',   '2020-03-31 10:45:00 UTC', 'John',    'Pants',        5200,   0),
    (11,    'LA',   '2020-04-01 07:01:00 UTC', 'David',   'Pants',        4500,   0),
    (12,    'LA',   '2020-04-02 06:01:00 UTC', null,      'Hat',          8000,   8000),
    (13,    'LA',   '2020-04-02 06:01:00 UTC', 'Bill',    'Give Away',    0,      0),
    (14,    'NY',   '2020-03-31 17:01:00 UTC', null,      'Give Away',    0,      0),
    (15,    'LA',   '2020-04-01 10:45:00 UTC', null,      'Give Away',    0,      0)
;



-- Generate Some Data
-- INSERT INTO sale (id, branch, sold_at, customer, product, price, discount)
-- SELECT
--    (SELECT MAX(id) FROM sale) + generate_series(1, 99985) as id,
--    (ARRAY['NY', 'LA'])[ceil(random() * 2)] AS branch,
--    '2020-03-01 00:00:00 UTC'::timestamptz + interval '1 hour' * random() * 24 * 30 * 6 AS sold_at,
--    (ARRAY['Bill', 'David', 'John', 'Lily'])[ceil(random() * 30)] AS customer,
--    (ARRAY['Shoes', 'Shirt', 'Pants', 'Hat', 'Give Away'])[ceil(random() * 4)] AS product,
--    round(random() * 150 * 100)::integer / 10 * 10 as price,
--    0 as discount;
-- ANALYZE sale;

-- Create some indexes
-- CREATE INDEX sale_customer_ix ON sale(customer);
-- CREATE INDEX sale_sold_at_ix ON sale(sold_at);
-- CREATE INDEX sale_product_ix ON sale(product);
