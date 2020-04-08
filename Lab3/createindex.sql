 -- Index to speed up queries
CREATE INDEX LookUpSales ON Sales(customerID, dayDate)