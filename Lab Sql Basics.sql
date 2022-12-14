#Get the id values of the first 5 clients from district_id with a value equals to 1.
select client_id from bank.client
where district_id = 1
limit 5;

#In the client table, get an id value of the last client where the district_id equals to 72.
select client_id from bank.client
where district_id = 72
order by client_id DESC
limit 1;

#Get the 3 lowest amounts in the loan table.
select amount from bank.loan
order by amount asc
limit 3;

#What are the possible values for status, ordered alphabetically in ascending order in the loan table?
select distinct(status) from bank.loan
order by status;

#What is the loan_id of the highest payment received in the loan table?
select loan_id from bank.loan
order by payments desc
limit 1;

#What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
select account_id, amount from bank.loan
order by account_id asc
limit 5;

#What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
select account_id from bank.loan
where duration = 60
order by amount asc
limit 5;

#What are the unique values of k_symbol in the order table?
#Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name.
select distinct(k_symbol) from bank.order
where k_symbol <> " ";

#In the order table, what are the order_ids of the client with the account_id 34?
select order_id from bank.order
where account_id = 34;

#In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select distinct(account_id) from bank.order
where order_id > 29540 and order_id < 29560;

#In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select amount from bank.order
where account_to = 30067122;

#In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
select trans_id, date, type, amount from bank.trans
where account_id = 793
order by date desc
limit 10;

#In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
select district_id,count(client_id) from bank.client
where district_id < 10
group by district_id;

#In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
select type, count(type) AS amount from bank.card
group by type
order by amount DESC;


