USE bank;

SELECT * 
FROM trans;

SELECT trans_id, account_id
From trans;

SELECT * 
From account;

SELECT frequency, account_id
From account;

SELECT  trans_id, account_id
From trans
LIMIT 5;

SELECT COUNT(frequency)
FROM account;

SELECT DISTINCT status
FROM loan;

SELECT trans_id AS Transaction_ID, 
	account_id AS Account_ID, 
	date As Date, 
	type AS Type_of_Account
From trans AS bank_tansaction
LIMIT 10;