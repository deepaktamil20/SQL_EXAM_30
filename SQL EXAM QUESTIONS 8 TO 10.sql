###  8. Print customer_id, account_number and balance_amount, condition 
##that if balance_amount is nil then assign transaction_amount for 
#account_type = "Credit Card"

SELECT * FROM task_1.bank_account_details;
SELECT customer_id , task_1.bank_account_details.account_number, CASE WHEN ifnull(balance_amount,0) = 0 THEN Transaction_amount ELSE balance_amount END AS balance_amount
FROM task_1.bank_account_details INNER JOIN task_1.bank_account_transaction ON task_1.bank_account_details.account_number = task_1.bank_account_transaction.account_number
AND account_type = "Credit Card";

####   9. Print customer_id, account_number, balance_amount, conPrint 
###account_number, balance_amount, transaction_amount from 
##Bank_Account_Details and bank_account_transaction for all the 
#transactions occurred during march, 2020 and april, 2020
SELECT task_1.bank_account_details.account_number, balance_amount, transaction_amount
FROM task_1.bank_account_details INNER JOIN task_1.bank_account_transaction ON task_1.bank_account_details.account_number = task_1.bank_account_transaction.account_number
AND (date_format(Transaction_Date , '%Y-%m')  BETWEEN "2020-03" AND "2020-04");


####   10. Print all of the customer id, account number, balance_amount,
###transaction_amount from bank_cutomer, bank_account_details and 
##bank_account_transactions tables where excluding all of their 
#transactions in march, 2020 month 
SELECT task_1.bank_account_details.customer_id, task_1.bank_account_details.account_number, balance_amount, transaction_amount
FROM task_1.bank_account_details LEFT JOIN task_1.bank_account_transaction ON task_1.bank_account_details.account_number = task_1.bank_account_transaction.account_number
LEFT JOIN task_1.bank_customer ON task_1.bank_account_details.customer_id = task_1.bank_customer.customer_id
AND NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );
