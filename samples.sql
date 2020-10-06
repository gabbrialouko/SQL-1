
Samples of work in SQL

/*Takes the invoice total from the invoices table and in 1 column rounds it to 1, and in the other column no decimals*/
SELECT invoice_total,
ROUND(invoice_total, 1),
ROUND(invoice_total, 0)
FROM invoices;

/*Takes the vendor name and phone number columns from the vendors table. 1st column is vendor name, 2nd is vendor name all uppercase, 
3rd is vendor phone and 5th column is last word in vendor name only*/
SELECT vendor_name, 
	UPPER(vendor_name), 
    vendor_phone, 
    RIGHT(vendor_phone, 4),
    /*phone number with periods*/
    SUBSTRING_INDEX(vendor_name, ' ', -1)
FROM vendors;

/*need to work on this one to get the month invoice date to equal 5*/
SELECT invoice_number, 
	invoice_date, 
	DATE_ADD(invoice_date,INTERVAL 30 DAY),
	payment_date, 
	DATEDIFF(payment_date, invoice_date) AS days_to_pay,
	EXTRACT(MONTH FROM invoice_date),
	EXTRACT(YEAR FROM invoice_date)
/*WHERE MONTH(invoice_date) = 5*/
FROM invoices;

/*Join the invoices table to the end of the vendors table with the common field of vendor_id*/
SELECT invoice_number, vendor_name
FROM vendors INNER JOIN invoices
    ON vendors.vendor_id = invoices.vendor_id
ORDER BY invoice_number;
