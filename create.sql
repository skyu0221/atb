DROP TABLE if exists account;
DROP TABLE if exists card;
DROP TABLE if exists client;
DROP TABLE if exists disp;
DROP TABLE if exists district;
DROP TABLE if exists loan;
DROP TABLE if exists order_table;
DROP TABLE if exists trans;

.mode csv
.mode column
.header on

CREATE TABLE district (
	A1	int,
	A2	char,
	A3	char,
	A4	int,
	A5	int,
	A6	int,
	A7	int,
	A8	int,
	A9	int,
	A10	int,
	A11	int,
	A12	int,
	A13	int,
	A14	int,
	A15	int,
	A16	int,
	PRIMARY KEY (A1)
);

CREATE TABLE client (
	garbage	int,
	client_id	int,
	birth_number	date,
	district_id	int,
	gender	char,
	PRIMARY KEY (client_id),
	FOREIGN KEY (district_id) REFERENCES district
);

CREATE TABLE account (
	garbage	int,
	account_id	int,
	district_id	int,
	frequency	char,
	date	date,
	PRIMARY KEY (account_id),
	FOREIGN KEY (district_id) REFERENCES district
);

CREATE TABLE disp (
	disp_id	int,
	client_id	int,
	account_id	int,
	type	char,
	PRIMARY KEY (disp_id),
	FOREIGN KEY (client_id) REFERENCES client,
	FOREIGN KEY (account_id) REFERENCES account
);

CREATE TABLE card (
	card_id	int,
	disp_id int,
	type char,
	issued	char,
	PRIMARY KEY (card_id),
	FOREIGN KEY (disp_id) REFERENCES disp
);

CREATE TABLE loan (
	garbage	int,
	loan_id	int,
	account_id	int,
	date	date,
	amount	float,
	duration	int,
	payments	float,
	status	char,
	PRIMARY KEY (loan_id),
	FOREIGN KEY (account_id) REFERENCES account
);

CREATE TABLE order_table (
	order_id	int,
	account_id	int,
	bank_to	char,
	account_to	char,
	amount	float,
	k_symbol	char,
	PRIMARY KEY (order_id),
	FOREIGN KEY (account_id) REFERENCES account
);

CREATE TABLE trans (
	garbage	int,
	trans_id	int,
	account_id	int,
	date	date,
	type	char,
	operation	char,
	amount	float,
	balance	float,
	k_symbol	char,
	bank	char,
	account	char,
	PRIMARY KEY (trans_id),
	FOREIGN KEY (account_id) REFERENCES account
);

.separator ";"
.import ./czech/district.csv district
.import ./czech/disp.csv disp
.import ./czech/card.csv card
.import ./czech/order.csv order_table

.separator ","
.import ./czech/new_loan.csv loan
.import ./czech/new_account.csv account
.import ./czech/new_client.csv client
.import ./czech/new_trans.csv trans