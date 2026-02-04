-- Create Table

CREATE TABLE jdsearch (
    dt Date COMMENT 'Date',
    uid Varchar(100) COMMENT 'User ID',
    categoryId Bigint COMMENT 'Product Category ID',
    skuId Varchar(100) COMMENT 'Product SKU',
    price float COMMENT 'Price',
	report_ts_expo Bigint COMMENT 'Product Exposed Timestamp',
    behavior_expo Varchar(100) COMMENT 'Exposed Label',
	report_ts_cl Bigint COMMENT 'Product Clicked Timestamp',
    behavior_cl Varchar(100) COMMENT 'Clicked Label',
	report_ts_cart Bigint COMMENT 'Add-to-Cart Timestamp',
    behavior_cart Varchar(100) COMMENT 'Add-to-Cart Label',
    report_ts_buy Bigint COMMENT 'Product Bought Timestamp',
    behavior_buy Varchar(100) COMMENT 'Bought Label'
);

Select Count(*) from jdsearch;

Select * from jdsearch;