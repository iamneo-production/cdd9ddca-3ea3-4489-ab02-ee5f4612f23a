SELECT
    TRANSACTIONNO,
    "Date",
    PRODUCTNO,
    PRODUCTNAME,
    PRICE,
    QUANTITY,
    CUSTOMERNO,
    COUNTRY,
    MON_FIELD,
    YEAR_FIELD
FROM
    ECOMMERCE
WHERE
    TRANSACTIONNO = 'VARCHAR2(50)';