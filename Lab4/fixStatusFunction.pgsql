CREATE OR REPLACE FUNCTION fixStatusFunction (lowCustomerID integer) RETURNS integer AS $$
    DECLARE
        custID INTEGER;
        numStatusFixed INTEGER := 0;
        customerStatus CHAR(1);
        newCustomerStatus CHAR(1)
    ;

    DECLARE lowCustomerIDCursor CURSOR FOR
        SELECT customerID
        FROM Customers 
        WHERE customerID >= lowCustomerID
    ;

    BEGIN
        OPEN lowCustomerIDCursor;
        LOOP
            FETCH lowCustomerIDCursor INTO custID;
            EXIT WHEN NOT FOUND;

            SELECT  c.status INTO customerStatus
            FROM    Customers c
            WHERE   c.customerID = custID;
            
            IF    customerStatus = NULL THEN newCustomerStatus := 'L';
            ELSIF customerStatus = 'L'  THEN newCustomerStatus := 'M';
            ELSIF customerStatus = 'M'  THEN newCustomerStatus := 'H';
            ELSE  newCustomerStatus := 'J';
            END IF;

            IF NOT (newCustomerStatus = 'J')
              THEN
                UPDATE  Customers
                SET     status = newCustomerStatus
                FROM    Customers c
                WHERE   c.customerID = custID;
                numStatusFixed := numStatusFixed + 1;
            END IF;

        END LOOP;
        CLOSE lowCustomerIDCursor;
        RETURN numStatusFixed;
    END;
$$ LANGUAGE plpgsql;