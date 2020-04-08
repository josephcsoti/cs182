-- a) Invalid product id
INSERT INTO Sales VALUES (999, 1006, 4, '2018-01-18', 100.81, 3);
-- b) Invalid customer id
INSERT INTO Sales VALUES (108, 1111, 4, '2018-01-18', 100.81, 3);
-- c) Invalid store id
INSERT INTO Sales VALUES (108, 1006, 100, '2018-01-18', 100.81, 3);
-- d) Invalid dev
INSERT INTO Sales VALUES (108, 1006, 4, '2020-05-13', 100.81, 3);
-- e) Invalid customer id
INSERT INTO Payments VALUES (1111, 'Tressa Hayes', '2018-02-06', 100.00, f);

-- 1) amountOwed must be greater than or equal to zero
--pass
UPDATE Customers SET amountOwed = 99.99 WHERE customerID = 1006;
--fail
UPDATE Customers SET amountOwed = -99.99 WHERE customerID = 1006;

-- 2) paidPrice * quantity >= 10.00
--pass
UPDATE Sales
  SET paidPrice = 1.25, quantity = 11
  WHERE productID = 108 AND customerID = 1006 AND storeId = 4 AND dayDate = DATE '2018-01-18'
;
--fail
UPDATE Sales
  SET paidPrice = 1.25, quantity = 1
  WHERE productID = 108 AND customerID = 1006 AND storeId = 4 AND dayDate = DATE '2018-01-18'
;

-- 3) if lastPaidDate is NULL then status must be ‘L’.
-- pass
UPDATE Customers
  SET lastPaidDate = NULL, status = 'L'
  WHERE customerID = 1006
;
--fail
UPDATE Customers
  SET lastPaidDate = NULL, status = 'H'
  WHERE customerID = 1006
;