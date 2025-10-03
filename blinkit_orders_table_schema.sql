
CREATE TABLE orders2 (
    customer_id INT,
    order_date DATE,
    coupon_code VARCHAR(50)
);

INSERT INTO Orders2 VALUES (1, '2025-01-10', NULL);
INSERT INTO Orders2 VALUES (1, '2025-02-05', NULL);
INSERT INTO Orders2 VALUES (1, '2025-02-20', NULL);
INSERT INTO Orders2 VALUES (1, '2025-03-01', NULL);
INSERT INTO Orders2 VALUES (1, '2025-03-10', NULL);
INSERT INTO Orders2 VALUES (1, '2025-03-15', 'DISC10'); 

INSERT INTO Orders2 VALUES (2, '2025-02-02', NULL);   -- Month1 = 1
INSERT INTO Orders2 VALUES (2, '2025-02-05', NULL);   -- Month1 = 1
INSERT INTO Orders2 VALUES (2, '2025-03-05', NULL);   -- Month2 = 2
INSERT INTO Orders2 VALUES (2, '2025-03-18', NULL);
INSERT INTO Orders2 VALUES (2, '2025-03-20', NULL);   -- Month2 = 2
INSERT INTO Orders2 VALUES (2, '2025-03-22', NULL);
INSERT INTO Orders2 VALUES (2, '2025-04-02', NULL);   -- Month3 = 3
INSERT INTO Orders2 VALUES (2, '2025-04-10', NULL);
INSERT INTO Orders2 VALUES (2, '2025-04-15', 'DISC20'); -- last order with coupon ?
INSERT INTO Orders2 VALUES (2, '2025-04-16', NULL);   -- Month3 = 3
INSERT INTO Orders2 VALUES (2, '2025-04-18', NULL);
INSERT INTO Orders2 VALUES (2, '2025-04-20', 'DISC20'); -- last order with coupon ?

INSERT INTO Orders2 VALUES (3, '2025-03-05', NULL);  -- Month1 = 1
INSERT INTO Orders2 VALUES (3, '2025-04-10', NULL);  -- Month2 should have 2, but only 1 ?
INSERT INTO Orders2 VALUES (3, '2025-05-15', 'DISC30');

INSERT INTO Orders2 VALUES (4, '2025-02-01', NULL);  -- Month1
INSERT INTO Orders2 VALUES (4, '2025-04-05', 'DISC40'); -- Skipped March ?

INSERT INTO Orders2 VALUES (5, '2025-01-03', NULL);  -- M1 = 1
INSERT INTO Orders2 VALUES (5, '2025-02-05', NULL);  -- M2 = 2
INSERT INTO Orders2 VALUES (5, '2025-02-15', NULL);
INSERT INTO Orders2 VALUES (5, '2025-03-01', NULL);  -- M3 = 3
INSERT INTO Orders2 VALUES (5, '2025-03-08', 'DISC50'); -- coupon mid
INSERT INTO Orders2 VALUES (5, '2025-03-20', NULL);     -- last order no coupon ?

INSERT INTO Orders2 VALUES (6, '2025-01-05', NULL);     -- Month1 = 1 order
-- (no Orders2 in Feb, so Month2 is missing ?)
INSERT INTO Orders2 VALUES (6, '2025-03-02', NULL);     -- Month3 = 1st order
INSERT INTO Orders2 VALUES (6, '2025-03-15', NULL);     -- Month3 = 2nd order
-- Jump to May (Month5 relative to Jan)
INSERT INTO Orders2 VALUES (6, '2025-05-05', NULL);     
INSERT INTO Orders2 VALUES (6, '2025-05-10', NULL);     
INSERT INTO Orders2 VALUES (6, '2025-05-25', 'DISC60'); -- Last order with coupon