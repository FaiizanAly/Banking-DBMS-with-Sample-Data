# 🏦 Bank Database Management System (DBMS)

This project is a **MySQL-based Banking Database System** designed for educational and DBMS learning purposes.  
It contains complete **table creation scripts, relationships, constraints, and sample data insertions** for a real-world banking environment.

---

## 📁 Files Included
| File | Description |
|---|---|
| `bankdb.sql` | Full database schema + inserted sample data |

---

## 🏷 Features
- Customer management with address records  
- Multiple branch support  
- Account handling with balance tracking  
- Debit/Credit card system  
- Loan types, loan issue details & repayment tracking  
- Employee management with salary & status  
- Transactions (Deposit, Withdraw, Payment, Transfer)  
- Proper **FOREIGN KEY relationships** & constraints  

---

## 🧱 Tables Overview

| Table Name | Stores Information |
|---|---|
| `customer` | Customer personal info |
| `customer_address` | Address of customers |
| `branch` | Bank branches |
| `account` | Bank accounts and balance |
| `card` | Debit/Credit card info linked to account |
| `employee` | Employees working in branches |
| `loan_type` | Types of loans available |
| `loan` | Loan sanctioned to a customer account |
| `loan_payment` | Loan installment payments |
| `transaction` | All banking transactions |

---

## 🚀 How to Run

### 1. Create/Import Database
Using MySQL CLI:
```sql
SOURCE bankdb.sql;
```
## SQL QUERIES 1 to 10 (All in One)

1. SELECT Queries
-----------------
SELECT * FROM customer;
SELECT first_name, last_name, email FROM customer;
SELECT * FROM branch WHERE branch_city='Mumbai';
SELECT * FROM account WHERE balance > 50000;
SELECT * FROM loan ORDER BY total_amount DESC;

2. INSERT Queries
-----------------
INSERT INTO customer(branch_id,address_id,first_name,last_name,dob,gender,email,mobile_number)
VALUES (1,1,'Rahul','Shah','1995-05-10','Male','rahul@test.com','9999955555');

INSERT INTO account(account_number,customer_id,account_type,balance,creation_date)
VALUES ('00121010000121',1,'Savings',12000.00,'2024-12-10');

3. UPDATE Queries
-----------------
UPDATE customer SET mobile_number='9876543210' WHERE customer_id=1;
UPDATE account SET balance = balance + 5000 WHERE account_id=3;
UPDATE account SET balance = balance - 2000 WHERE account_id=3;

4. DELETE Queries
-----------------
DELETE FROM customer WHERE customer_id=4;
DELETE FROM account WHERE account_id=10;

5. JOIN Queries
-----------------
SELECT c.first_name, c.last_name, b.branch_name, b.branch_city
FROM customer c JOIN branch b ON c.branch_id = b.branch_id;

SELECT c.first_name, c.email, a.account_number, a.balance
FROM customer c JOIN account a ON c.customer_id = a.customer_id;

SELECT c.first_name, c.last_name, b.branch_name, a.account_number, a.balance
FROM customer c JOIN branch b ON c.branch_id=b.branch_id
JOIN account a ON a.customer_id=c.customer_id;

6. CARD / LOAN / PAYMENT Queries
-----------------
SELECT c.first_name, ca.card_number, ca.card_type
FROM customer c JOIN account a ON c.customer_id=a.customer_id
JOIN card ca ON a.account_id=ca.account_id;

SELECT c.first_name, a.account_number, l.total_amount, lt.type
FROM loan l JOIN account a ON l.account_id=a.account_id
JOIN customer c ON a.customer_id=c.customer_id
JOIN loan_type lt ON l.loan_type_id=lt.loan_type_id;

SELECT l.loan_id, lp.payment_date, lp.payment_amount
FROM loan_payment lp JOIN loan l ON lp.loan_id=l.loan_id;

7. TRANSACTION Queries
-----------------
SELECT * FROM transaction;
SELECT * FROM transaction WHERE transaction_type='Deposit';
SELECT * FROM transaction WHERE amount > 10000;

8. SEARCH & FILTER Queries
-----------------
SELECT * FROM customer WHERE gender='Female';
SELECT * FROM customer WHERE first_name LIKE 'A%';
SELECT * FROM account WHERE balance BETWEEN 20000 AND 100000;

9. AGGREGATE & GROUP BY Queries
-----------------
SELECT COUNT(*) AS total_customers FROM customer;
SELECT AVG(balance) AS average_balance FROM account;
SELECT branch_id, COUNT(*) AS customers FROM customer GROUP BY branch_id;
SELECT loan_type_id, SUM(total_amount) AS total_loan_amount FROM loan GROUP BY loan_type_id;

10. ADVANCED Queries
-----------------
SELECT first_name, last_name, balance FROM customer
JOIN account USING(customer_id)
ORDER BY balance DESC LIMIT 1;

SELECT DISTINCT c.first_name, c.last_name FROM customer c
JOIN account a ON c.customer_id=a.customer_id
JOIN loan l ON a.account_id=l.account_id;
