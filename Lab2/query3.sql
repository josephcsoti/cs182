-- Find the storeName and dayDate of each store for which there was at least one sale on that dayDate. No
-- duplicates should appear in your result.

SELECT DISTINCT STORES.storeName, SALES.dayDate
  FROM SALES
  INNER JOIN STORES on SALES.storeID=STORES.storeID
;