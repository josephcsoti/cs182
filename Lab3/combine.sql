BEGIN TRANSACTION;
SET TRANSACTION READ WRITE ISOLATION LEVEL SERIALIZABLE;

  -- Update customer tuple
  UPDATE Customers
    SET 
      custName = n.custName,
      address = n.address,
      joinDate = n.joinDate
    FROM 
      NewCustomers n
    WHERE 
      Customers.customerID = n.customerID
  ;

  -- Insert new tuple
  INSERT INTO Customers (customerID, custName, address, joinDate, amountOwed, lastPaidDate, status)
    SELECT
      n.customerID, n.custName, n.address, n.joinDate, 0, NULL, 'L'
    FROM
      NewCustomers n
    WHERE
      NOT EXISTS ( SELECT * FROM Customers c WHERE c.customerID = n.customerID)
  ;

COMMIT TRANSACTION;