-- 1) amountOwed must be greater than or equal to zero
ALTER TABLE Customers ADD CONSTRAINT owed_is_positive CHECK ( amountOwed >= 0 );

-- 2)  paidPrice * quantity >= 10.00
ALTER TABLE Sales ADD CHECK ( paidPrice * quantity >= 10.00 );

-- 3) if lastPaidDate is NULL then status must be ‘L’.
ALTER TABLE Customers ADD CHECK ( lastPaidDate IS NOT NULL OR status = 'L' );