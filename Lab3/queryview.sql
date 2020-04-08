-- Custom views to help query

-- Case A
-- Grab cid's that amount paid is greater than amount owed
CREATE VIEW payedMore AS
  SELECT c.customerID as "cid", cp.totalClearedPayments as totalClearedPayments
  FROM ClearedPayments cp
  INNER JOIN Customers c
    ON cp.customerID = c.customerID
  WHERE
    cp.totalClearedPayments > c.amountOwed
  GROUP BY c.customerID, cp.totalClearedPayments
;

-- Case B
-- Attach count of distinct products to a cid
CREATE VIEW uniqueProducts AS
  SELECT customerID as "cid", COUNT(DISTINCT productID) as "count"
  FROM Sales
  GROUP BY customerID
  HAVING COUNT(DISTINCT productID) >= 3
;


-- =======================================

-- Join two views to find ids that match both requirements (a AND b)
SELECT a.cid as "customerID", b.totalClearedPayments as "totalClearedPayments", a.count as "numDiffProducts"
  FROM uniqueProducts a
  INNER JOIN payedMore b
    ON a.cid = b.cid
;

-- Output before delete
--  customerID | totalClearedPayments | numDiffProducts
-- ------------+----------------------+-----------------
--        1001 |               269.11 |               5
--        1002 |               364.56 |               5
--        1004 |               494.40 |               3
--        1005 |               249.99 |               3

-- Delete rows
DELETE FROM Payments WHERE customerID = 1002 AND paidDate = DATE '2018-02-19';
DELETE FROM Payments WHERE customerID = 1004 AND paidDate = DATE '2018-02-04';

-- Join two views to find ids that match both requirements (a AND b)
SELECT a.cid as "customerID", b.totalClearedPayments as "totalClearedPayments", a.count as "numDiffProducts"
  FROM uniqueProducts a
  INNER JOIN payedMore b
    ON a.cid = b.cid
;

-- Output after delete
--  customerID | totalClearedPayments | numDiffProducts
-- ------------+----------------------+-----------------
--        1001 |               269.11 |               5
--        1002 |               352.24 |               5
--        1005 |               249.99 |               3