# SQL-1
Samples of work in SQL

/*1 ROUND*/
SELECT invoice_total,
ROUND(invoice_total, 1),
ROUND(invoice_total, 0)
FROM invoices;
