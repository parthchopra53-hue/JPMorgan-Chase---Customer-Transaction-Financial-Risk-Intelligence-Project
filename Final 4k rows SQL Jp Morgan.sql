CREATE SCHEMA analytics;



SELECT schema_name
FROM information_schema.schemata
ORDER BY schema_name;

ALTER TABLE public.customers SET SCHEMA analytics;

ALTER TABLE public.accounts SET SCHEMA analytics;

ALTER TABLE public.cards SET SCHEMA analytics;

ALTER TABLE public.transactions SET SCHEMA analytics;

ALTER TABLE public.merchants SET SCHEMA analytics;

ALTER TABLE public.loans SET SCHEMA analytics;

ALTER TABLE public.loan_payments SET SCHEMA analytics;

ALTER TABLE public.fraud_alerts SET SCHEMA analytics;

ALTER TABLE public.credit_profiles SET SCHEMA analytics;

ALTER TABLE public.customer_service SET SCHEMA analytics;


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'analytics'
ORDER BY table_name;



-- Creating Tables 

--(1)  Customers

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_number VARCHAR(50),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(20),
    date_of_birth DATE,
    age INT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    customer_since DATE,
    customer_segment VARCHAR(50),
    employment_status VARCHAR(50),
    occupation VARCHAR(100),
    annual_income NUMERIC(15,2),
    income_band VARCHAR(50),
    marital_status VARCHAR(30),
    dependents INT,
    education_level VARCHAR(100),
    risk_segment VARCHAR(50),
    customer_status VARCHAR(50),
    preferred_channel VARCHAR(50),
    email_verified BOOLEAN,
    phone_verified BOOLEAN
);

SELECT * FROM analytics.customers;



--(2) Accounts

CREATE TABLE analytics.accounts (
    account_id INTEGER,
    customer_id VARCHAR(20),
    account_number VARCHAR(30),
    account_type VARCHAR(50),
    account_open_date DATE,
    account_status VARCHAR(30),
    branch_id VARCHAR(20),
    currency VARCHAR(10),
    current_balance NUMERIC(15,2),
    available_balance NUMERIC(15,2),
    minimum_balance NUMERIC(15,2),
    interest_rate NUMERIC(10,5),
    monthly_fee NUMERIC(15,2),
    overdraft_limit NUMERIC(15,2),
    last_transaction_date DATE,
    balance_available_check VARCHAR(20),
    balance_minimum_check VARCHAR(20),
    account_date_check VARCHAR(20)
);

DROP TABLE IF EXISTS analytics.accounts;

SELECT * FROM analytics.accounts;














--(3) Cards 

CREATE TABLE analytics.cards (
    card_id BIGINT,
    customer_id VARCHAR(20),
    account_id VARCHAR(20),
    card_number VARCHAR(30),
    card_type VARCHAR(50),
    card_network VARCHAR(50),
    issue_date DATE,
    expiry_date DATE,
    card_status VARCHAR(30),
    credit_limit NUMERIC(15,2),
    cash_limit NUMERIC(15,2),
    current_outstanding NUMERIC(15,2),
    available_credit NUMERIC(15,2),
    annual_fee NUMERIC(15,2),
    international_usage BOOLEAN,
    contactless_enabled BOOLEAN,
    last_used_date DATE,
    card_number_masked VARCHAR(30),
    outstanding_limit_check VARCHAR(30),
    available_credit_check VARCHAR(30),
    cash_limit_check VARCHAR(30),
    card_date_check VARCHAR(30),
    last_used_date_check VARCHAR(30)
);

SELECT * FROM analytics.cards;
DROP TABLE IF EXISTS analytics.cards;

SELECT
    ordinal_position,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'analytics'
  AND table_name = 'cards'
ORDER BY ordinal_position;



--(4) Transactions 

DROP TABLE IF EXISTS analytics.transactions;


CREATE TABLE analytics.transactions (
    transaction_id BIGINT,
    customer_id VARCHAR(20),
    account_id VARCHAR(20),
    card_id VARCHAR(20),
    merchant_id VARCHAR(20),
    transaction_date DATE,
    transaction_timestamp TIMESTAMP,
    transaction_type VARCHAR(50),
    transaction_category VARCHAR(50),
    channel VARCHAR(50),
    amount NUMERIC(15,2),
    currency VARCHAR(10),
    debit_credit VARCHAR(10),
    payment_method VARCHAR(50),
    transaction_status VARCHAR(30),
    location VARCHAR(100),
    international_transaction BOOLEAN,
    recurring_transaction BOOLEAN,
    device_type VARCHAR(50),
    risk_score NUMERIC(5,2),
    fraud_flag BOOLEAN,
    transaction_month VARCHAR(20),
    transaction_year INTEGER,
    transaction_hour INTEGER,
    signed_amount NUMERIC(15,2),
    risk_band VARCHAR(20),
    amount_validation VARCHAR(30),
    timestamp_date_check VARCHAR(30),
    risk_score_validation VARCHAR(30),
    debit_credit_amount_check VARCHAR(30)
);


SELECT * FROM analytics.transactions;


--(5)Merchants

DROP TABLE IF EXISTS analytics.merchants;


CREATE TABLE analytics.merchants (
    merchant_id VARCHAR(20),
    merchant_name VARCHAR(150),
    merchant_category VARCHAR(100),
    merchant_type VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    risk_category VARCHAR(30),
    merchant_status VARCHAR(30),
    average_transaction_value NUMERIC(15,2),
    monthly_transaction_volume INTEGER,
    merchant_since DATE,
    merchant_tenure_years NUMERIC(5,2),
    monthly_transaction_value NUMERIC(18,2),
    merchant_value_band VARCHAR(30),
    transaction_value_check VARCHAR(30),
    merchant_date_check VARCHAR(30),
    merchant_status_check VARCHAR(30)
);

SELECT * FROM analytics.merchants;


--(6) Loans
DROP TABLE IF EXISTS analytics.loans;

CREATE TABLE analytics.loans (
    loan_id VARCHAR(20),
    customer_id VARCHAR(20),
    loan_type VARCHAR(50),
    application_date DATE,
    approval_date DATE,
    disbursement_date DATE,
    loan_amount NUMERIC(15,2),
    interest_rate NUMERIC(7,4),
    tenure_months INTEGER,
    monthly_emi NUMERIC(15,2),
    outstanding_principal NUMERIC(15,2),
    loan_status VARCHAR(30),
    credit_score_at_application INTEGER,
    debt_to_income_ratio NUMERIC(7,4),
    collateral_type VARCHAR(50),
    collateral_value NUMERIC(15,2),
    risk_grade VARCHAR(20),
    branch_id VARCHAR(20),
    processing_days INTEGER,
    disbursement_days INTEGER,
    total_interest_estimate NUMERIC(18,2),
    loan_ltv NUMERIC(7,4),
    principal_repaid NUMERIC(18,2),
    repayment_percentage NUMERIC(7,4),
    loan_date_check VARCHAR(30),
    emi_check VARCHAR(30),
    outstanding_principal_check VARCHAR(30),
    credit_score_check VARCHAR(30),
    dti_check VARCHAR(30)
);
SELECT * FROM analytics.loans;

--(7) Loan Payments 

DROP TABLE IF EXISTS analytics.loan_payments;


CREATE TABLE analytics.loan_payments (
    loan_payment_id VARCHAR(20),
    loan_id VARCHAR(20),
    customer_id VARCHAR(20),
    payment_date DATE,
    due_date DATE,
    payment_amount NUMERIC(15,2),
    principal_paid NUMERIC(15,2),
    interest_paid NUMERIC(15,2),
    late_fee NUMERIC(15,2),
    payment_status VARCHAR(30),
    days_past_due INTEGER,
    payment_channel VARCHAR(50),
    auto_debit BOOLEAN,
    remaining_principal NUMERIC(15,2),
    payment_delay_days INTEGER,
    total_payment_components NUMERIC(18,2),
    principal_payment_percentage NUMERIC(7,4),
    interest_payment_percentage NUMERIC(7,4),
    late_payment_flag VARCHAR(20),
    payment_date_check VARCHAR(30),
    payment_amount_check VARCHAR(30),
    payment_breakdown_check VARCHAR(30),
    remaining_principal_check VARCHAR(30),
    days_past_due_check VARCHAR(30)
);

SELECT * FROM analytics.loan_payments;


--(8) Fraud Alerts
DROP TABLE IF EXISTS analytics.fraud_alerts;

CREATE TABLE analytics.fraud_alerts (
    alert_id VARCHAR(20),
    transaction_id VARCHAR(20),
    customer_id VARCHAR(20),
    alert_date DATE,
    alert_type VARCHAR(100),
    risk_score NUMERIC(8,2),
    detection_method VARCHAR(100),
    alert_status VARCHAR(50),
    investigation_result VARCHAR(100),
    fraud_confirmed BOOLEAN,
    amount_at_risk NUMERIC(15,2),
    resolution_date DATE,
    investigation_duration_hours NUMERIC(10,2),
    alert_resolution_days INTEGER,
    risk_band VARCHAR(30),
    alert_age_days INTEGER,
    investigation_efficiency NUMERIC(10,4),
    exposure_band VARCHAR(30),
    alert_date_check VARCHAR(30),
    risk_score_check VARCHAR(30),
    amount_at_risk_check VARCHAR(30),
    resolution_date_check VARCHAR(30),
    investigation_duration_check VARCHAR(30),
    fraud_result_check VARCHAR(30)
);


SELECT * FROM analytics.fraud_alerts;

--(9) Credit Profiles 
DROP TABLE IF EXISTS analytics.credit_profiles;


CREATE TABLE analytics.credit_profiles (
    credit_profile_id VARCHAR(20),
    customer_id VARCHAR(20),
    credit_score INTEGER,
    credit_rating VARCHAR(30),
    credit_utilization_percentage NUMERIC(8,2),
    total_credit_limit NUMERIC(15,2),
    total_outstanding NUMERIC(15,2),
    number_of_active_loans INTEGER,
    number_of_credit_cards INTEGER,
    payment_history_score NUMERIC(8,2),
    delinquency_count INTEGER,
    default_history INTEGER,
    debt_to_income_ratio NUMERIC(8,4),
    annual_income NUMERIC(15,2),
    risk_probability NUMERIC(8,4),
    credit_profile_date DATE,
    calculated_utilization NUMERIC(8,4),
    available_credit NUMERIC(15,2),
    credit_risk_band VARCHAR(30),
    credit_health_band VARCHAR(30),
    credit_score_check VARCHAR(30),
    utilization_check VARCHAR(30),
    credit_limit_check VARCHAR(30),
    delinquency_check VARCHAR(30),
    risk_probability_check VARCHAR(30),
    profile_date_check VARCHAR(30)
);


SELECT * FROM analytics.credit_profiles;


--(10) Customer Service 

DROP TABLE IF EXISTS analytics.customer_service;


CREATE TABLE analytics.customer_service (
    case_id VARCHAR(20),
    customer_id VARCHAR(20),
    case_date DATE,
    case_type VARCHAR(100),
    channel VARCHAR(50),
    priority VARCHAR(30),
    issue_category VARCHAR(100),
    resolution_status VARCHAR(50),
    resolution_time_hours NUMERIC(10,2),
    first_response_time_minutes NUMERIC(10,2),
    agent_id VARCHAR(50),
    customer_satisfaction_score NUMERIC(5,2),
    escalated BOOLEAN,
    refund_required BOOLEAN,
    case_resolution_date DATE,
    case_age_days INTEGER,
    resolution_delay_hours NUMERIC(10,2),
    response_to_resolution_ratio NUMERIC(10,4),
    satisfaction_band VARCHAR(30),
    service_priority_score VARCHAR(30),
    case_date_check VARCHAR(30),
    resolution_time_check VARCHAR(30),
    first_response_check VARCHAR(30),
    satisfaction_score_check VARCHAR(30),
    escalation_check VARCHAR(30),
    refund_check VARCHAR(30)
);
SELECT * FROM analytics.customer_service;







--- Business Questions---

--(1) Customers 

--(Q-1) How many total customers are in the bank?

SELECT
    COUNT(*) AS total_customers
FROM analytics.customers;

--(Q-2) How many customers are currently active?

SELECT
    COUNT(*) AS active_customers
FROM analytics.customers
WHERE customer_status = 'Active';

--(Q-3) What percentage of customers are active?

SELECT
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN customer_status = 'Active'
            THEN 1
            ELSE 0
        END
    ) AS active_customers,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN customer_status = 'Active'
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS active_customer_percentage

FROM analytics.customers;

--(Q-4) How are customers distributed across customer segments?

SELECT
    customer_segment,
    COUNT(*) AS customer_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage

FROM analytics.customers

GROUP BY customer_segment

ORDER BY customer_count DESC;


--(Q-5) What is the average annual income of customers by segment?

SELECT
    customer_segment,

    COUNT(*) AS customer_count,

    ROUND(
        AVG(annual_income),
        2
    ) AS average_annual_income,

    ROUND(
        MIN(annual_income),
        2
    ) AS minimum_income,

    ROUND(
        MAX(annual_income),
        2
    ) AS maximum_income

FROM analytics.customers

GROUP BY customer_segment

ORDER BY average_annual_income DESC;

--(Q-6) How many customers belong to each income band?

SELECT
    income_band,
    COUNT(*) AS customer_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage

FROM analytics.customers

GROUP BY income_band

ORDER BY customer_count DESC;

--(Q-7) Which customer segments have the highest risk exposure?

SELECT
    customer_segment,
    risk_segment,

    COUNT(*) AS customer_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (
            PARTITION BY customer_segment
        ),
        2
    ) AS percentage_within_segment

FROM analytics.customers

GROUP BY
    customer_segment,
    risk_segment

ORDER BY
    customer_segment,
    customer_count DESC;


--(2) Accounts 

--(Q-1) How many accounts are currently active, closed, and dormant?

SELECT
    account_status,
    COUNT(*) AS account_count
FROM analytics.accounts
GROUP BY account_status
ORDER BY account_count DESC;

--(Q-2) Which account types hold the highest total balance?

SELECT
    account_type,
    COUNT(*) AS account_count,
    ROUND(SUM(current_balance), 2) AS total_current_balance,
    ROUND(AVG(current_balance), 2) AS average_balance
FROM analytics.accounts
GROUP BY account_type
ORDER BY total_current_balance DESC;


--(Q-3) Which account types have the highest average available balance?

SELECT
    account_type,
    ROUND(AVG(available_balance), 2) AS average_available_balance,
    ROUND(MIN(available_balance), 2) AS minimum_available_balance,
    ROUND(MAX(available_balance), 2) AS maximum_available_balance
FROM analytics.accounts
GROUP BY account_type
ORDER BY average_available_balance DESC;

--(Q-4) How much of the account portfolio is currently overdrawn?

SELECT
    COUNT(*) AS total_accounts,

    SUM(
        CASE
            WHEN available_balance < current_balance
            THEN 1
            ELSE 0
        END
    ) AS accounts_using_overdraft,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN available_balance < current_balance
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS overdraft_usage_rate_percentage,

    ROUND(
        SUM(
            CASE
                WHEN available_balance < current_balance
                THEN current_balance - available_balance
                ELSE 0
            END
        ),
        2
    ) AS total_overdraft_exposure

FROM analytics.accounts;


--(Q-5) Which account types provide the highest overdraft facility to customers?

SELECT
    account_type,
    COUNT(*) AS account_count,
    ROUND(SUM(overdraft_limit), 2) AS total_overdraft_limit,
    ROUND(AVG(overdraft_limit), 2) AS average_overdraft_limit,
    ROUND(MAX(overdraft_limit), 2) AS maximum_overdraft_limit
FROM analytics.accounts
GROUP BY account_type
ORDER BY total_overdraft_limit DESC;


--(Q-6) Which account types generate the highest monthly fee revenue?

SELECT
    account_type,
    COUNT(*) AS account_count,
    ROUND(SUM(monthly_fee), 2) AS monthly_fee_revenue,
    ROUND(AVG(monthly_fee), 2) AS average_monthly_fee
FROM analytics.accounts
GROUP BY account_type
ORDER BY monthly_fee_revenue DESC;

--(Q-7) Which accounts have the highest balance relative to their overdraft limit?

SELECT
    account_id,
    account_type,
    current_balance,
    overdraft_limit,
    ROUND(
        CASE
            WHEN overdraft_limit > 0
            THEN current_balance / overdraft_limit
            ELSE NULL
        END,
        2
    ) AS balance_to_overdraft_ratio
FROM analytics.accounts
WHERE overdraft_limit > 0
ORDER BY balance_to_overdraft_ratio DESC
LIMIT 20;


--(3) Cards

--Q1. What is the distribution of cards by card type and status?

SELECT
    card_type,
    card_status,
    COUNT(*) AS card_count
FROM analytics.cards
GROUP BY
    card_type,
    card_status
ORDER BY
    card_type,
    card_count DESC;


--Q2. Which card networks have the highest number of cards and credit limits?

SELECT
    card_network,
    COUNT(*) AS card_count,
    ROUND(SUM(credit_limit), 2) AS total_credit_limit,
    ROUND(AVG(credit_limit), 2) AS average_credit_limit
FROM analytics.cards
GROUP BY card_network
ORDER BY total_credit_limit DESC;

--Q3. What is the overall credit utilization of the card portfolio?

SELECT
    ROUND(
        100.0 * SUM(current_outstanding)
        / NULLIF(SUM(credit_limit), 0),
        2
    ) AS overall_credit_utilization_percentage,

    ROUND(SUM(credit_limit), 2) AS total_credit_limit,

    ROUND(SUM(current_outstanding), 2) AS total_current_outstanding,

    ROUND(SUM(available_credit), 2) AS total_available_credit

FROM analytics.cards;

--Q4. Which card types have the highest credit utilization?

SELECT
    card_type,

    COUNT(*) AS total_cards,

    SUM(
        CASE
            WHEN card_status = 'Active'
            THEN 1
            ELSE 0
        END
    ) AS active_cards,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN card_status = 'Active'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS active_card_percentage,

    SUM(
        CASE
            WHEN international_usage = TRUE
            THEN 1
            ELSE 0
        END
    ) AS international_usage_cards,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN international_usage = TRUE
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS international_usage_percentage,

    SUM(
        CASE
            WHEN contactless_enabled = TRUE
            THEN 1
            ELSE 0
        END
    ) AS contactless_cards,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN contactless_enabled = TRUE
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS contactless_adoption_percentage

FROM analytics.cards

GROUP BY card_type

ORDER BY total_cards DESC;






--Q5. How many cards fall into high, medium, and low utilization categories?

SELECT
    CASE
        WHEN credit_limit <= 0 THEN 'Invalid Credit Limit'

        WHEN current_outstanding / NULLIF(credit_limit, 0) * 100 >= 80
            THEN 'High Utilization'

        WHEN current_outstanding / NULLIF(credit_limit, 0) * 100 >= 50
            THEN 'Medium Utilization'

        ELSE 'Low Utilization'
    END AS utilization_band,

    COUNT(*) AS card_count

FROM analytics.cards
GROUP BY
    CASE
        WHEN credit_limit <= 0 THEN 'Invalid Credit Limit'

        WHEN current_outstanding / NULLIF(credit_limit, 0) * 100 >= 80
            THEN 'High Utilization'

        WHEN current_outstanding / NULLIF(credit_limit, 0) * 100 >= 50
            THEN 'Medium Utilization'

        ELSE 'Low Utilization'
    END

ORDER BY card_count DESC;

--Q6. Which card types generate the highest annual fee revenue?

SELECT
    card_type,
    COUNT(*) AS card_count,

    ROUND(SUM(annual_fee), 2)
        AS total_annual_fee_revenue,

    ROUND(AVG(annual_fee), 2)
        AS average_annual_fee

FROM analytics.cards
GROUP BY card_type
ORDER BY total_annual_fee_revenue DESC;


--Q7. Which cards have the highest outstanding exposure relative to their credit limit?

SELECT
    card_id,
    card_type,
    card_network,
    credit_limit,
    current_outstanding,
    available_credit,

    ROUND(
        100.0 * current_outstanding
        / NULLIF(credit_limit, 0),
        2
    ) AS utilization_percentage

FROM analytics.cards

WHERE credit_limit > 0

ORDER BY utilization_percentage DESC

LIMIT 20;


--(4) Transactions 

--Q-1. What is the total transaction volume and total transaction value?


SELECT
    COUNT(*) AS total_transactions,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    ROUND(
        MIN(amount),
        2
    ) AS minimum_transaction_amount,

    ROUND(
        MAX(amount),
        2
    ) AS maximum_transaction_amount

FROM analytics.transactions;

--Q-2. Which transaction categories generate the highest transaction value?

SELECT
    transaction_category,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    ROUND(
        100.0 * SUM(amount)
        / NULLIF(SUM(SUM(amount)) OVER (), 0),
        2
    ) AS transaction_value_percentage

FROM analytics.transactions

GROUP BY transaction_category

ORDER BY total_transaction_value DESC;

--Q-3. What is the transaction volume and value across different channels?

SELECT
    channel,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS transaction_volume_percentage

FROM analytics.transactions

GROUP BY channel

ORDER BY transaction_count DESC;


--Q-4. How much transaction value is domestic versus international?

SELECT
    CASE
        WHEN international_transaction = TRUE
            THEN 'International'
        ELSE 'Domestic'
    END AS transaction_scope,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS transaction_volume_percentage

FROM analytics.transactions

GROUP BY
    CASE
        WHEN international_transaction = TRUE
            THEN 'International'
        ELSE 'Domestic'
    END

ORDER BY total_transaction_value DESC;


--Q-5. What is the fraud rate and fraud exposure across transactions?

SELECT
    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN fraud_flag = TRUE
            THEN 1
            ELSE 0
        END
    ) AS fraudulent_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN fraud_flag = TRUE
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS fraud_rate_percentage,

    ROUND(
        SUM(
            CASE
                WHEN fraud_flag = TRUE
                THEN amount
                ELSE 0
            END
        ),
        2
    ) AS fraudulent_transaction_value,

    ROUND(
        AVG(
            CASE
                WHEN fraud_flag = TRUE
                THEN amount
                ELSE NULL
            END
        ),
        2
    ) AS average_fraudulent_transaction

FROM analytics.transactions;

--Q-6. Which risk bands have the highest transaction exposure?

SELECT
    risk_band,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(risk_score),
        2
    ) AS average_risk_score,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    SUM(
        CASE
            WHEN fraud_flag = TRUE
            THEN 1
            ELSE 0
        END
    ) AS fraudulent_transactions

FROM analytics.transactions

GROUP BY risk_band

ORDER BY total_transaction_value DESC;

--Q-7. How does transaction activity vary by month?

SELECT
    transaction_month,
    transaction_year,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    SUM(
        CASE
            WHEN fraud_flag = TRUE
            THEN 1
            ELSE 0
        END
    ) AS fraudulent_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN fraud_flag = TRUE
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS fraud_rate_percentage

FROM analytics.transactions

GROUP BY
    transaction_year,
    transaction_month

ORDER BY
    transaction_year,
    transaction_month;



--(5) Merchants

--Q1. What is the total transaction volume and transaction value?

SELECT
    COUNT(*) AS total_transactions,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    ROUND(
        MIN(amount),
        2
    ) AS minimum_transaction_amount,

    ROUND(
        MAX(amount),
        2
    ) AS maximum_transaction_amount

FROM analytics.transactions;

--Q2. How are transactions distributed across transaction types?

SELECT
    transaction_type,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS transaction_percentage

FROM analytics.transactions

GROUP BY transaction_type

ORDER BY total_transaction_value DESC;


--Q3. Which transaction categories generate the highest transaction value?

SELECT
    transaction_category,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value

FROM analytics.transactions

GROUP BY transaction_category

ORDER BY total_transaction_value DESC;

--Q4. Which channels are most frequently used for transactions?

SELECT
    channel,

    COUNT(*) AS transaction_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS transaction_percentage,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value

FROM analytics.transactions

GROUP BY channel

ORDER BY transaction_count DESC;

--Q5. What percentage of transactions are international and recurring?

SELECT
    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN international_transaction = TRUE
            THEN 1
            ELSE 0
        END
    ) AS international_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN international_transaction = TRUE
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS international_transaction_percentage,

    SUM(
        CASE
            WHEN recurring_transaction = TRUE
            THEN 1
            ELSE 0
        END
    ) AS recurring_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN recurring_transaction = TRUE
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS recurring_transaction_percentage

FROM analytics.transactions;

--Q6. How much transaction value is associated with different risk bands?

SELECT
    risk_band,

    COUNT(*) AS transaction_count,

    ROUND(
        SUM(amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(amount),
        2
    ) AS average_transaction_value,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS transaction_percentage

FROM analytics.transactions

GROUP BY risk_band

ORDER BY total_transaction_value DESC;


--Q7. What percentage of transactions are flagged as fraudulent?

SELECT
    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN fraud_flag = TRUE
            THEN 1
            ELSE 0
        END
    ) AS fraudulent_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN fraud_flag = TRUE
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS fraud_transaction_percentage,

    ROUND(
        SUM(
            CASE
                WHEN fraud_flag = TRUE
                THEN amount
                ELSE 0
            END
        ),
        2
    ) AS fraudulent_transaction_value

FROM analytics.transactions;


--(6) LOANS

--Q1. How many loans are currently active, closed, and pending?

SELECT
    loan_status,
    COUNT(*) AS loan_count
FROM analytics.loans
GROUP BY loan_status
ORDER BY loan_count DESC;

--Q2. Which loan types have the highest total loan exposure?

SELECT
    loan_type,
    COUNT(*) AS loan_count,

    ROUND(
        SUM(loan_amount),
        2
    ) AS total_loan_amount,

    ROUND(
        AVG(loan_amount),
        2
    ) AS average_loan_amount,

    ROUND(
        SUM(outstanding_principal),
        2
    ) AS total_outstanding_principal

FROM analytics.loans

GROUP BY loan_type

ORDER BY total_loan_amount DESC;

--Q3. Which risk grades have the highest loan exposure?

SELECT
    risk_grade,
    COUNT(*) AS loan_count,

    ROUND(
        SUM(loan_amount),
        2
    ) AS total_loan_amount,

    ROUND(
        SUM(outstanding_principal),
        2
    ) AS outstanding_principal,

    ROUND(
        AVG(interest_rate),
        2
    ) AS average_interest_rate

FROM analytics.loans

GROUP BY risk_grade

ORDER BY total_loan_amount DESC;

--Q4. Which loans have the highest loan-to-value (LTV) exposure?

SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    collateral_value,
    loan_ltv,
    risk_grade,
    loan_status

FROM analytics.loans

WHERE collateral_value > 0

ORDER BY loan_ltv DESC

LIMIT 20;

--Q5. Which loan types generate the highest estimated interest income?

SELECT
    loan_type,
    COUNT(*) AS loan_count,

    ROUND(
        SUM(loan_amount),
        2
    ) AS total_principal,

    ROUND(
        SUM(total_interest_estimate),
        2
    ) AS estimated_total_interest,

    ROUND(
        AVG(total_interest_estimate),
        2
    ) AS average_interest_per_loan

FROM analytics.loans

GROUP BY loan_type

ORDER BY estimated_total_interest DESC;

--Q6. Which loans have high debt-to-income risk?

SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    debt_to_income_ratio,
    credit_score_at_application,
    risk_grade,
    loan_status
FROM analytics.loans
ORDER BY debt_to_income_ratio DESC
LIMIT 20;

--Q7. Which loans have the highest outstanding principal and repayment risk?

SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    outstanding_principal,
    principal_repaid,
    repayment_percentage,
    loan_status,
    risk_grade

FROM analytics.loans

WHERE outstanding_principal > 0

ORDER BY outstanding_principal DESC

LIMIT 20;


--(7) Loan Payments

--Q1. What is the total number and value of loan payments?

SELECT
    COUNT(*) AS total_payments,

    ROUND(
        SUM(payment_amount),
        2
    ) AS total_payment_value,

    ROUND(
        AVG(payment_amount),
        2
    ) AS average_payment_amount,

    ROUND(
        SUM(principal_paid),
        2
    ) AS total_principal_paid,

    ROUND(
        SUM(interest_paid),
        2
    ) AS total_interest_paid

FROM analytics.loan_payments;

--Q2. How are loan payments distributed by payment status?

SELECT
    payment_status,

    COUNT(*) AS payment_count,

    ROUND(
        SUM(payment_amount),
        2
    ) AS total_payment_value,

    ROUND(
        AVG(payment_amount),
        2
    ) AS average_payment_amount,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS payment_percentage

FROM analytics.loan_payments

GROUP BY payment_status

ORDER BY payment_count DESC;

--Q3. How much payment value is collected through each payment channel?

SELECT
    payment_channel,

    COUNT(*) AS payment_count,

    ROUND(
        SUM(payment_amount),
        2
    ) AS total_payment_value,

    ROUND(
        AVG(payment_amount),
        2
    ) AS average_payment_amount

FROM analytics.loan_payments

GROUP BY payment_channel

ORDER BY total_payment_value DESC;

--Q4. What percentage of loan payments are made through auto-debit?

SELECT
    COUNT(*) AS total_payments,

    SUM(
        CASE
            WHEN auto_debit = TRUE
            THEN 1
            ELSE 0
        END
    ) AS auto_debit_payments,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN auto_debit = TRUE
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS auto_debit_percentage

FROM analytics.loan_payments;

--Q5. How much late-payment exposure does the bank have?

SELECT
    COUNT(*) AS total_payments,

    SUM(
        CASE
            WHEN days_past_due > 0
            THEN 1
            ELSE 0
        END
    ) AS late_payments,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN days_past_due > 0
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS late_payment_percentage,

    ROUND(
        SUM(
            CASE
                WHEN days_past_due > 0
                THEN payment_amount
                ELSE 0
            END
        ),
        2
    ) AS late_payment_value

FROM analytics.loan_payments;

--Q6. Which payments have the highest days past due and late fees?

SELECT
    loan_payment_id,
    loan_id,
    customer_id,
    payment_date,
    due_date,
    payment_amount,
    late_fee,
    days_past_due,
    payment_status,
    payment_channel

FROM analytics.loan_payments

WHERE days_past_due IS NOT NULL

ORDER BY days_past_due DESC

LIMIT 20;

--Q7. Which loans have the highest remaining principal after payments?

SELECT
    loan_id,

    COUNT(*) AS payment_count,

    ROUND(
        SUM(payment_amount),
        2
    ) AS total_paid,

    ROUND(
        SUM(principal_paid),
        2
    ) AS total_principal_paid,

    ROUND(
        SUM(interest_paid),
        2
    ) AS total_interest_paid,

    ROUND(
        MAX(remaining_principal),
        2
    ) AS remaining_principal

FROM analytics.loan_payments

GROUP BY loan_id

ORDER BY remaining_principal DESC

LIMIT 20;


--(8) Fraud Alerts

--Q-1. How many fraud alerts have been generated?

SELECT
    COUNT(*) AS total_fraud_alerts
FROM analytics.fraud_alerts;

--Q-2. How are fraud alerts distributed by alert type?

SELECT
    alert_type,
    COUNT(*) AS alert_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS alert_percentage

FROM analytics.fraud_alerts

GROUP BY alert_type

ORDER BY alert_count DESC;

--Q-3. How many alerts have been confirmed as actual fraud?

SELECT
    COUNT(*) AS total_alerts,

    SUM(
        CASE
            WHEN fraud_confirmed = TRUE
            THEN 1
            ELSE 0
        END
    ) AS confirmed_fraud_alerts,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN fraud_confirmed = TRUE
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS fraud_confirmation_rate_percentage

FROM analytics.fraud_alerts;

--Q-4. Which detection methods generate the highest number of confirmed fraud cases?

SELECT
    detection_method,

    COUNT(*) AS total_alerts,

    SUM(
        CASE
            WHEN fraud_confirmed = TRUE
            THEN 1
            ELSE 0
        END
    ) AS confirmed_fraud_cases,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN fraud_confirmed = TRUE
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS fraud_confirmation_rate_percentage

FROM analytics.fraud_alerts

GROUP BY detection_method

ORDER BY confirmed_fraud_cases DESC;

--Q-5. How much transaction value is currently exposed to fraud?

SELECT
    ROUND(
        SUM(amount_at_risk),
        2
    ) AS total_amount_at_risk,

    ROUND(
        AVG(amount_at_risk),
        2
    ) AS average_amount_at_risk,

    ROUND(
        MAX(amount_at_risk),
        2
    ) AS maximum_amount_at_risk

FROM analytics.fraud_alerts;

--Q-6. What is the average investigation time by alert status?

SELECT
    alert_status,

    COUNT(*) AS alert_count,

    ROUND(
        AVG(investigation_duration_hours),
        2
    ) AS average_investigation_hours,

    ROUND(
        MIN(investigation_duration_hours),
        2
    ) AS minimum_investigation_hours,

    ROUND(
        MAX(investigation_duration_hours),
        2
    ) AS maximum_investigation_hours

FROM analytics.fraud_alerts

GROUP BY alert_status

ORDER BY average_investigation_hours DESC;

--Q-7. Which alerts represent the highest fraud-risk exposure?

SELECT
    alert_id,
    transaction_id,
    customer_id,
    alert_type,
    risk_score,
    alert_status,
    fraud_confirmed,
    amount_at_risk,
    investigation_duration_hours

FROM analytics.fraud_alerts

ORDER BY
    amount_at_risk DESC,
    risk_score DESC

LIMIT 20;


--(9) Credit Profiles 

--Q1. What is the distribution of customers across credit ratings?

SELECT
    credit_rating,
    COUNT(*) AS customer_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage

FROM analytics.credit_profiles

GROUP BY credit_rating

ORDER BY customer_count DESC;

--Q2. What is the average credit score by credit rating?

SELECT
    credit_rating,

    COUNT(*) AS customer_count,

    ROUND(
        AVG(credit_score),
        2
    ) AS average_credit_score,

    MIN(credit_score) AS minimum_credit_score,

    MAX(credit_score) AS maximum_credit_score

FROM analytics.credit_profiles

GROUP BY credit_rating

ORDER BY average_credit_score DESC;

--Q3. Which customers have the highest credit utilization?

SELECT
    credit_profile_id,
    customer_id,
    credit_score,
    credit_rating,
    credit_utilization_percentage,
    total_credit_limit,
    total_outstanding

FROM analytics.credit_profiles

WHERE total_credit_limit > 0

ORDER BY credit_utilization_percentage DESC

LIMIT 20;

--Q4. What is the overall credit utilization of the portfolio?

SELECT
    ROUND(
        100.0 * SUM(total_outstanding)
        / NULLIF(SUM(total_credit_limit), 0),
        2
    ) AS overall_credit_utilization_percentage,

    ROUND(
        SUM(total_credit_limit),
        2
    ) AS total_credit_limit,

    ROUND(
        SUM(total_outstanding),
        2
    ) AS total_outstanding,

    ROUND(
        SUM(total_credit_limit - total_outstanding),
        2
    ) AS total_available_credit

FROM analytics.credit_profiles;

--Q5. How many customers have delinquency or default history?

SELECT
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN delinquency_count > 0
            THEN 1
            ELSE 0
        END
    ) AS customers_with_delinquency,

    SUM(
        CASE
            WHEN default_history = 1
            THEN 1
            ELSE 0
        END
    ) AS customers_with_default_history,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN delinquency_count > 0
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS delinquency_percentage,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN default_history = 1
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS default_history_percentage

FROM analytics.credit_profiles;

--Q6. Which credit ratings have the highest average risk probability?
SELECT
    credit_rating,

    COUNT(*) AS customer_count,

    ROUND(
        AVG(risk_probability) * 100,
        2
    ) AS average_risk_probability_percentage,

    ROUND(
        AVG(debt_to_income_ratio),
        2
    ) AS average_debt_to_income_ratio,

    ROUND(
        AVG(credit_utilization_percentage),
        2
    ) AS average_credit_utilization

FROM analytics.credit_profiles

GROUP BY credit_rating

ORDER BY average_risk_probability_percentage DESC;

--Q7. Which customers have the highest overall credit-risk exposure?

SELECT
    credit_profile_id,
    customer_id,
    credit_score,
    credit_rating,
    credit_utilization_percentage,
    total_credit_limit,
    total_outstanding,
    number_of_active_loans,
    delinquency_count,
    default_history,
    debt_to_income_ratio,
    risk_probability,

    ROUND(
        total_outstanding *
        risk_probability,
        2
    ) AS estimated_risk_exposure

FROM analytics.credit_profiles

ORDER BY estimated_risk_exposure DESC

LIMIT 20;

--(10) Customer Service

--Q1. How many customer service cases are there by resolution status?

SELECT
    resolution_status,
    COUNT(*) AS case_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS case_percentage

FROM analytics.customer_service

GROUP BY resolution_status

ORDER BY case_count DESC;

--Q2. Which case types generate the highest number of customer service requests?

SELECT
    case_type,
    COUNT(*) AS case_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS case_percentage

FROM analytics.customer_service

GROUP BY case_type

ORDER BY case_count DESC;

--Q3. Which issue categories have the highest average resolution time?

SELECT
    issue_category,

    COUNT(*) AS case_count,

    ROUND(
        AVG(resolution_time_hours),
        2
    ) AS average_resolution_time_hours,

    ROUND(
        MIN(resolution_time_hours),
        2
    ) AS minimum_resolution_time_hours,

    ROUND(
        MAX(resolution_time_hours),
        2
    ) AS maximum_resolution_time_hours

FROM analytics.customer_service

GROUP BY issue_category

ORDER BY average_resolution_time_hours DESC;

--Q4. Which channels receive the highest number of customer service cases?

SELECT
    channel,

    COUNT(*) AS case_count,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS case_percentage,

    ROUND(
        AVG(first_response_time_minutes),
        2
    ) AS average_first_response_minutes

FROM analytics.customer_service

GROUP BY channel

ORDER BY case_count DESC;

--Q5. What percentage of customer service cases are escalated?

SELECT
    COUNT(*) AS total_cases,

    SUM(
        CASE
            WHEN escalated = TRUE
            THEN 1
            ELSE 0
        END
    ) AS escalated_cases,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN escalated = TRUE
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS escalation_percentage

FROM analytics.customer_service;

--Q6. Does faster first response lead to higher customer satisfaction?

SELECT
    CASE
        WHEN first_response_time_minutes <= 15
            THEN '0-15 Minutes'

        WHEN first_response_time_minutes <= 30
            THEN '16-30 Minutes'

        WHEN first_response_time_minutes <= 60
            THEN '31-60 Minutes'

        ELSE '60+ Minutes'
    END AS response_time_band,

    COUNT(*) AS case_count,

    ROUND(
        AVG(customer_satisfaction_score),
        2
    ) AS average_customer_satisfaction,

    ROUND(
        AVG(resolution_time_hours),
        2
    ) AS average_resolution_time_hours

FROM analytics.customer_service

GROUP BY
    CASE
        WHEN first_response_time_minutes <= 15
            THEN '0-15 Minutes'

        WHEN first_response_time_minutes <= 30
            THEN '16-30 Minutes'

        WHEN first_response_time_minutes <= 60
            THEN '31-60 Minutes'

        ELSE '60+ Minutes'
    END

ORDER BY
    MIN(first_response_time_minutes);


--Q7. Which agents handle the highest number of cases and maintain good customer satisfaction?

SELECT
    agent_id,

    COUNT(*) AS total_cases,

    SUM(
        CASE
            WHEN resolution_status = 'Resolved'
            THEN 1
            ELSE 0
        END
    ) AS resolved_cases,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN resolution_status = 'Resolved'
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS resolution_percentage,

    ROUND(
        AVG(customer_satisfaction_score),
        2
    ) AS average_customer_satisfaction,

    ROUND(
        AVG(resolution_time_hours),
        2
    ) AS average_resolution_time_hours

FROM analytics.customer_service

GROUP BY agent_id

HAVING COUNT(*) >= 10

ORDER BY
    average_customer_satisfaction DESC,
    resolution_percentage DESC,
    total_cases DESC;





--CORE BUSINESS QUESTIONS 

--Q-1.  How does each customer segment compare in terms of number of customers,
--total account balances, average product holdings per customer, account status mix, and 
--share of the bank's total deposit base?

WITH customer_account_summary AS (

    SELECT
        c.customer_id,
        c.customer_segment,

        COUNT(a.account_id) AS account_count,

        COALESCE(
            SUM(a.current_balance),
            0
        ) AS total_customer_balance,

        COUNT(
            CASE
                WHEN a.account_status = 'Active'
                THEN 1
            END
        ) AS active_accounts,

        COUNT(
            CASE
                WHEN a.account_status = 'Dormant'
                THEN 1
            END
        ) AS dormant_accounts,

        COUNT(
            CASE
                WHEN a.account_status = 'Closed'
                THEN 1
            END
        ) AS closed_accounts

    FROM analytics.customers c

    LEFT JOIN analytics.accounts a
        ON c.customer_id = a.customer_id

    GROUP BY
        c.customer_id,
        c.customer_segment
),

segment_summary AS (

    SELECT
        customer_segment,

        COUNT(*) AS customer_count,

        ROUND(
            AVG(account_count),
            2
        ) AS average_accounts_per_customer,

        ROUND(
            SUM(total_customer_balance),
            2
        ) AS total_account_balance,

        ROUND(
            AVG(total_customer_balance),
            2
        ) AS average_balance_per_customer,

        SUM(active_accounts) AS active_accounts,

        SUM(dormant_accounts) AS dormant_accounts,

        SUM(closed_accounts) AS closed_accounts

    FROM customer_account_summary

    GROUP BY customer_segment
)

SELECT
    customer_segment,

    customer_count,

    average_accounts_per_customer,

    total_account_balance,

    average_balance_per_customer,

    active_accounts,

    dormant_accounts,

    closed_accounts,

    ROUND(
        100.0 * total_account_balance
        / NULLIF(
            SUM(total_account_balance) OVER (),
            0
        ),
        2
    ) AS deposit_base_share_percentage,

    RANK() OVER (
        ORDER BY total_account_balance DESC
    ) AS deposit_balance_rank

FROM segment_summary

ORDER BY deposit_balance_rank;


--Q-2. Which accounts are classified as Dormant or Inactive, how much 
--balance do they collectively hold, how long has it been since their
--last transaction, and which branches/account types have the highest concentration of dormant balances?

WITH dormant_accounts AS (

    SELECT
        a.account_id,
        a.customer_id,
        a.account_type,
        a.branch_id,
        a.account_status,
        a.current_balance,
        a.available_balance,
        a.last_transaction_date,

        CURRENT_DATE - a.last_transaction_date
            AS days_since_last_transaction

    FROM analytics.accounts a

    WHERE a.account_status IN ('Dormant', 'Inactive')
),

branch_summary AS (

    SELECT
        branch_id,

        COUNT(*) AS dormant_account_count,

        ROUND(
            SUM(current_balance),
            2
        ) AS dormant_balance,

        ROUND(
            AVG(current_balance),
            2
        ) AS average_dormant_balance

    FROM dormant_accounts

    GROUP BY branch_id
)

SELECT
    d.account_id,
    d.customer_id,
    c.customer_segment,

    d.account_type,
    d.branch_id,
    d.account_status,

    ROUND(
        d.current_balance,
        2
    ) AS current_balance,

    ROUND(
        d.available_balance,
        2
    ) AS available_balance,

    d.last_transaction_date,

    d.days_since_last_transaction,

    b.dormant_account_count,
    b.dormant_balance,
    b.average_dormant_balance,

    RANK() OVER (
        ORDER BY b.dormant_balance DESC
    ) AS branch_dormant_balance_rank

FROM dormant_accounts d

LEFT JOIN analytics.customers c
    ON d.customer_id = c.customer_id

LEFT JOIN branch_summary b
    ON d.branch_id = b.branch_id

ORDER BY
    branch_dormant_balance_rank,
    d.current_balance DESC;

--Q-3. Across card types and customer segments, what is the total credit limit issued, 
--total outstanding balance, and average utilization rate, and which combinations show
--utilization high enough to warrant credit-line review?

WITH card_customer_data AS (

    SELECT
        c.card_id,
        c.customer_id,
        c.card_type,
        c.card_network,
        c.card_status,
        c.credit_limit,
        c.current_outstanding,
        c.available_credit,

        cu.customer_segment,

        ROUND(
            100.0 * c.current_outstanding
            / NULLIF(c.credit_limit, 0),
            2
        ) AS utilization_percentage

    FROM analytics.cards c

    LEFT JOIN analytics.customers cu
        ON c.customer_id = cu.customer_id

    WHERE c.card_type IN (
        'Credit',
        'Corporate',
        'Premium'
    )
),

card_analysis AS (

    SELECT
        card_type,
        customer_segment,

        COUNT(*) AS card_count,

        SUM(
            CASE
                WHEN card_status = 'Active'
                THEN 1
                ELSE 0
            END
        ) AS active_card_count,

        ROUND(
            SUM(credit_limit),
            2
        ) AS total_credit_limit,

        ROUND(
            SUM(current_outstanding),
            2
        ) AS total_outstanding_balance,

        ROUND(
            SUM(available_credit),
            2
        ) AS total_available_credit,

        ROUND(
            AVG(utilization_percentage),
            2
        ) AS average_utilization_percentage,

        SUM(
            CASE
                WHEN utilization_percentage >= 80
                THEN 1
                ELSE 0
            END
        ) AS high_utilization_cards

    FROM card_customer_data

    GROUP BY
        card_type,
        customer_segment
)

SELECT
    card_type,
    customer_segment,

    card_count,
    active_card_count,

    total_credit_limit,
    total_outstanding_balance,
    total_available_credit,

    average_utilization_percentage,

    high_utilization_cards,

    ROUND(
        100.0 * high_utilization_cards
        / NULLIF(card_count, 0),
        2
    ) AS high_utilization_percentage,

    RANK() OVER (
        ORDER BY average_utilization_percentage DESC
    ) AS utilization_rank

FROM card_analysis

ORDER BY
    utilization_rank;

--Q-4.  How many products (accounts, cards, and loans combined) does the average customer 
--hold in each segment, and how does total balance/value differ between
--single-product and multi-product customers?

WITH account_summary AS (

    SELECT
        customer_id,

        COUNT(account_id) AS account_count,

        ROUND(
            SUM(current_balance),
            2
        ) AS total_account_balance

    FROM analytics.accounts

    GROUP BY customer_id
),

card_summary AS (

    SELECT
        customer_id,

        COUNT(card_id) AS card_count

    FROM analytics.cards

    GROUP BY customer_id
),

loan_summary AS (

    SELECT
        customer_id,

        COUNT(loan_id) AS loan_count,

        ROUND(
            SUM(loan_amount),
            2
        ) AS total_loan_value,

        ROUND(
            SUM(outstanding_principal),
            2
        ) AS total_outstanding_principal

    FROM analytics.loans

    GROUP BY customer_id
),

customer_product_summary AS (

    SELECT
        c.customer_id,
        c.customer_segment,

        COALESCE(a.account_count, 0) AS account_count,

        COALESCE(cs.card_count, 0) AS card_count,

        COALESCE(l.loan_count, 0) AS loan_count,

        COALESCE(a.total_account_balance, 0) AS total_account_balance,

        COALESCE(l.total_loan_value, 0) AS total_loan_value,

        COALESCE(l.total_outstanding_principal, 0)
            AS total_outstanding_principal

    FROM analytics.customers c

    LEFT JOIN account_summary a
        ON c.customer_id = a.customer_id

    LEFT JOIN card_summary cs
        ON c.customer_id = cs.customer_id

    LEFT JOIN loan_summary l
        ON c.customer_id = l.customer_id
),

customer_relationship AS (

    SELECT
        *,

        (
            CASE
                WHEN account_count > 0
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN card_count > 0
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN loan_count > 0
                THEN 1
                ELSE 0
            END
        ) AS product_count,

        CASE
            WHEN
                (
                    CASE
                        WHEN account_count > 0 THEN 1
                        ELSE 0
                    END

                    +

                    CASE
                        WHEN card_count > 0 THEN 1
                        ELSE 0
                    END

                    +

                    CASE
                        WHEN loan_count > 0 THEN 1
                        ELSE 0
                    END
                ) = 1

            THEN 'Single-Product'

            WHEN
                (
                    CASE
                        WHEN account_count > 0 THEN 1
                        ELSE 0
                    END

                    +

                    CASE
                        WHEN card_count > 0 THEN 1
                        ELSE 0
                    END

                    +

                    CASE
                        WHEN loan_count > 0 THEN 1
                        ELSE 0
                    END
                ) >= 2

            THEN 'Multi-Product'

            ELSE 'No-Product'

        END AS relationship_type

    FROM customer_product_summary
)

SELECT
    customer_segment,

    relationship_type,

    COUNT(*) AS customer_count,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (
            PARTITION BY customer_segment
        ),
        2
    ) AS customer_percentage,

    ROUND(
        AVG(product_count),
        2
    ) AS average_products_per_customer,

    ROUND(
        AVG(total_account_balance),
        2
    ) AS average_account_balance,

    ROUND(
        AVG(total_loan_value),
        2
    ) AS average_loan_value,

    ROUND(
        AVG(total_outstanding_principal),
        2
    ) AS average_outstanding_principal,

    ROUND(
        AVG(
            total_account_balance
            + total_loan_value
        ),
        2
    ) AS average_total_relationship_value

FROM customer_relationship

GROUP BY
    customer_segment,
    relationship_type

ORDER BY
    customer_segment,
    relationship_type;


--Q-5. What is the transaction volume, total value, and success/failure/decline rate by channel,  (Dono mai successful transaction mai 0)
--and which channels show failure rates high enough to represent a customer-experience or 
--infrastructure problem?

WITH channel_summary AS (

    SELECT
        channel,

        COUNT(*) AS transaction_count,

        ROUND(
            SUM(amount),
            2
        ) AS total_transaction_value,

        ROUND(
            AVG(amount),
            2
        ) AS average_transaction_value,

        SUM(
            CASE
                WHEN transaction_status = 'Success'
                THEN 1
                ELSE 0
            END
        ) AS successful_transactions,

        SUM(
            CASE
                WHEN transaction_status = 'Failed'
                THEN 1
                ELSE 0
            END
        ) AS failed_transactions,

        SUM(
            CASE
                WHEN transaction_status = 'Declined'
                THEN 1
                ELSE 0
            END
        ) AS declined_transactions

    FROM analytics.transactions

    GROUP BY channel
)

SELECT
    channel,

    transaction_count,

    total_transaction_value,

    average_transaction_value,

    successful_transactions,

    failed_transactions,

    declined_transactions,

    ROUND(
        100.0 * successful_transactions
        / NULLIF(transaction_count, 0),
        2
    ) AS success_rate_percentage,

    ROUND(
        100.0 * failed_transactions
        / NULLIF(transaction_count, 0),
        2
    ) AS failure_rate_percentage,

    ROUND(
        100.0 * declined_transactions
        / NULLIF(transaction_count, 0),
        2
    ) AS decline_rate_percentage,

    RANK() OVER (
        ORDER BY
            100.0 * failed_transactions
            / NULLIF(transaction_count, 0) DESC
    ) AS failure_rate_rank

FROM channel_summary

ORDER BY failure_rate_rank;



--Monthly Trend


SELECT
    DATE_TRUNC(
        'month',
        transaction_date
    ) AS transaction_month,

    channel,

    COUNT(*) AS transaction_count,

    SUM(
        CASE
            WHEN transaction_status = 'Success'
            THEN 1
            ELSE 0
        END
    ) AS successful_transactions,

    SUM(
        CASE
            WHEN transaction_status = 'Failed'
            THEN 1
            ELSE 0
        END
    ) AS failed_transactions,

    SUM(
        CASE
            WHEN transaction_status = 'Declined'
            THEN 1
            ELSE 0
        END
    ) AS declined_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN transaction_status = 'Failed'
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS failure_rate_percentage,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN transaction_status = 'Declined'
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS decline_rate_percentage

FROM analytics.transactions

GROUP BY
    DATE_TRUNC('month', transaction_date),
    channel

ORDER BY
    transaction_month,
    channel;

--Q-6. Which merchant categories and individual merchants generate the highest transaction (Dono mai zero aur null ka panga)
--volume and value, and how does that concentration compare against each merchant's risk category?

WITH merchant_transaction_summary AS (

    SELECT
        m.merchant_id,
        m.merchant_name,
        m.merchant_category,
        m.merchant_type,
        m.risk_category,
        m.merchant_status,

        COUNT(t.transaction_id) AS transaction_count,

        ROUND(
            SUM(t.amount),
            2
        ) AS total_transaction_value,

        ROUND(
            AVG(t.amount),
            2
        ) AS average_transaction_value,

        SUM(
            CASE
                WHEN t.transaction_status = 'Success'
                THEN 1
                ELSE 0
            END
        ) AS successful_transactions

    FROM analytics.merchants m

    LEFT JOIN analytics.transactions t
        ON m.merchant_id = t.merchant_id

    GROUP BY
        m.merchant_id,
        m.merchant_name,
        m.merchant_category,
        m.merchant_type,
        m.risk_category,
        m.merchant_status
),

merchant_ranking AS (

    SELECT
        *,

        ROUND(
            100.0 * total_transaction_value
            / NULLIF(
                SUM(total_transaction_value) OVER (),
                0
            ),
            2
        ) AS transaction_value_share_percentage,

        RANK() OVER (
            ORDER BY total_transaction_value DESC
        ) AS merchant_value_rank

    FROM merchant_transaction_summary
)

SELECT
    merchant_id,
    merchant_name,
    merchant_category,
    merchant_type,
    risk_category,
    merchant_status,

    transaction_count,
    successful_transactions,

    total_transaction_value,
    average_transaction_value,

    transaction_value_share_percentage,

    merchant_value_rank,

    CASE
        WHEN risk_category IN ('High', 'Medium')
             AND merchant_value_rank <= 20
            THEN 'High-Value High-Risk Merchant'

        WHEN risk_category IN ('High', 'Medium')
            THEN 'Medium/High Risk Merchant'

        WHEN merchant_value_rank <= 20
            THEN 'High-Value Low-Risk Merchant'

        ELSE 'Normal Merchant'
    END AS merchant_risk_priority

FROM merchant_ranking

ORDER BY
    merchant_value_rank;

--Category evel View

SELECT
    m.merchant_category,
    m.risk_category,

    COUNT(DISTINCT m.merchant_id)
        AS merchant_count,

    COUNT(t.transaction_id)
        AS transaction_count,

    ROUND(
        SUM(t.amount),
        2
    ) AS total_transaction_value,

    ROUND(
        AVG(t.amount),
        2
    ) AS average_transaction_value,

    ROUND(
        100.0 * SUM(t.amount)
        / NULLIF(
            SUM(SUM(t.amount)) OVER (),
            0
        ),
        2
    ) AS transaction_value_share_percentage

FROM analytics.merchants m

LEFT JOIN analytics.transactions t
    ON m.merchant_id = t.merchant_id

GROUP BY
    m.merchant_category,
    m.risk_category

ORDER BY
    total_transaction_value DESC;


--Q-7. What is the total outstanding principal, average interest rate, and loan count broken down
--by loan type and risk grade, and which combinations represent the largest share of the bank's total credit exposure?

WITH loan_portfolio AS (

    SELECT
        loan_type,
        risk_grade,

        COUNT(loan_id) AS loan_count,

        ROUND(
            SUM(outstanding_principal),
            2
        ) AS total_outstanding_principal,

        ROUND(
            AVG(interest_rate),
            2
        ) AS average_interest_rate,

        ROUND(
            SUM(loan_amount),
            2
        ) AS total_loan_amount,

        SUM(
            CASE
                WHEN loan_status = 'Active'
                THEN 1
                ELSE 0
            END
        ) AS active_loan_count

    FROM analytics.loans

    GROUP BY
        loan_type,
        risk_grade
),

portfolio_total AS (

    SELECT
        SUM(outstanding_principal) AS total_portfolio_outstanding

    FROM analytics.loans
)

SELECT
    lp.loan_type,
    lp.risk_grade,

    lp.loan_count,
    lp.active_loan_count,

    lp.total_loan_amount,
    lp.total_outstanding_principal,

    lp.average_interest_rate,

    ROUND(
        100.0 * lp.total_outstanding_principal
        / NULLIF(
            pt.total_portfolio_outstanding,
            0
        ),
        2
    ) AS portfolio_exposure_percentage,

    RANK() OVER (
        ORDER BY
            lp.total_outstanding_principal DESC
    ) AS exposure_rank

FROM loan_portfolio lp

CROSS JOIN portfolio_total pt

ORDER BY
    exposure_rank;


--If we want to see higher risker grades

SELECT
    risk_grade,

    COUNT(loan_id) AS loan_count,

    ROUND(
        SUM(outstanding_principal),
        2
    ) AS total_outstanding_principal,

    ROUND(
        100.0 * SUM(outstanding_principal)
        / NULLIF(
            SUM(SUM(outstanding_principal)) OVER (),
            0
        ),
        2
    ) AS portfolio_exposure_percentage,

    ROUND(
        AVG(interest_rate),
        2
    ) AS average_interest_rate

FROM analytics.loans

GROUP BY risk_grade

ORDER BY
    total_outstanding_principal DESC;


--Q-8. Which branches and loan-type/risk-grade combinations show the highest rates of 
--Delinquent, Default, and Written Off loan status, and how do those rates compare to the branch/segment averages?

WITH branch_performance AS (

    SELECT
        branch_id,

        COUNT(loan_id) AS total_loans,

        SUM(
            CASE
                WHEN loan_status IN (
                    'Delinquent',
                    'Default',
                    'Written Off'
                )
                THEN 1
                ELSE 0
            END
        ) AS bad_loans,

        SUM(
            CASE
                WHEN loan_status = 'Delinquent'
                THEN 1
                ELSE 0
            END
        ) AS delinquent_loans,

        SUM(
            CASE
                WHEN loan_status = 'Default'
                THEN 1
                ELSE 0
            END
        ) AS default_loans,

        SUM(
            CASE
                WHEN loan_status = 'Written Off'
                THEN 1
                ELSE 0
            END
        ) AS written_off_loans,

        ROUND(
            SUM(outstanding_principal),
            2
        ) AS outstanding_exposure

    FROM analytics.loans

    GROUP BY branch_id
),

branch_rates AS (

    SELECT
        *,

        ROUND(
            100.0 * bad_loans
            / NULLIF(total_loans, 0),
            2
        ) AS bad_rate_percentage,

        ROUND(
            100.0 * delinquent_loans
            / NULLIF(total_loans, 0),
            2
        ) AS delinquency_rate_percentage,

        ROUND(
            100.0 * default_loans
            / NULLIF(total_loans, 0),
            2
        ) AS default_rate_percentage

    FROM branch_performance
)

SELECT
    branch_id,

    total_loans,
    bad_loans,

    delinquent_loans,
    default_loans,
    written_off_loans,

    outstanding_exposure,

    bad_rate_percentage,
    delinquency_rate_percentage,
    default_rate_percentage,

    ROUND(
        AVG(bad_rate_percentage) OVER (),
        2
    ) AS portfolio_average_bad_rate,

    ROUND(
        bad_rate_percentage
        -
        AVG(bad_rate_percentage) OVER (),
        2
    ) AS difference_from_portfolio_average,

    RANK() OVER (
        ORDER BY bad_rate_percentage DESC
    ) AS bad_rate_rank

FROM branch_rates

ORDER BY bad_rate_rank;


--Loan Type + Risk Grade Analysis

WITH loan_segment AS (

    SELECT
        loan_type,
        risk_grade,

        COUNT(loan_id) AS total_loans,

        SUM(
            CASE
                WHEN loan_status IN (
                    'Delinquent',
                    'Default',
                    'Written Off'
                )
                THEN 1
                ELSE 0
            END
        ) AS bad_loans,

        SUM(
            CASE
                WHEN loan_status = 'Delinquent'
                THEN 1
                ELSE 0
            END
        ) AS delinquent_loans,

        SUM(
            CASE
                WHEN loan_status = 'Default'
                THEN 1
                ELSE 0
            END
        ) AS default_loans,

        ROUND(
            SUM(outstanding_principal),
            2
        ) AS outstanding_exposure,

        ROUND(
            AVG(credit_score_at_application),
            2
        ) AS average_application_credit_score

    FROM analytics.loans

    GROUP BY
        loan_type,
        risk_grade
)

SELECT
    loan_type,
    risk_grade,

    total_loans,
    bad_loans,

    delinquent_loans,
    default_loans,

    outstanding_exposure,

    average_application_credit_score,

    ROUND(
        100.0 * bad_loans
        / NULLIF(total_loans, 0),
        2
    ) AS bad_rate_percentage,

    ROUND(
        100.0 * delinquent_loans
        / NULLIF(total_loans, 0),
        2
    ) AS delinquency_rate_percentage,

    ROUND(
        100.0 * default_loans
        / NULLIF(total_loans, 0),
        2
    ) AS default_rate_percentage,

    RANK() OVER (
        ORDER BY
            100.0 * bad_loans
            / NULLIF(total_loans, 0) DESC
    ) AS bad_rate_rank

FROM loan_segment

ORDER BY bad_rate_rank;

--Executive Priority View

SELECT
    branch_id,

    COUNT(loan_id) AS total_loans,

    SUM(
        CASE
            WHEN loan_status IN (
                'Delinquent',
                'Default',
                'Written Off'
            )
            THEN 1
            ELSE 0
        END
    ) AS bad_loans,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status IN (
                    'Delinquent',
                    'Default',
                    'Written Off'
                )
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(loan_id), 0),
        2
    ) AS bad_rate_percentage,

    ROUND(
        SUM(outstanding_principal),
        2
    ) AS outstanding_exposure

FROM analytics.loans

GROUP BY branch_id

HAVING COUNT(loan_id) >= 10

ORDER BY
    bad_rate_percentage DESC,
    outstanding_exposure DESC;




--Q-9. For each alert_type and detection_method, what percentage of alerts result in Confirmed Fraud 
--versus False Positive, and which combinations have the best and worst signal-to-noise ratio?

--Main Query

WITH alert_performance AS (

    SELECT
        alert_type,
        detection_method,

        COUNT(alert_id) AS total_alerts,

        SUM(
            CASE
                WHEN fraud_confirmed = TRUE
                THEN 1
                ELSE 0
            END
        ) AS confirmed_fraud_alerts,

        SUM(
            CASE
                WHEN fraud_confirmed = FALSE
                THEN 1
                ELSE 0
            END
        ) AS false_positive_alerts,

        ROUND(
            AVG(risk_score),
            2
        ) AS average_risk_score,

        ROUND(
            SUM(amount_at_risk),
            2
        ) AS total_amount_at_risk,

        ROUND(
            AVG(amount_at_risk),
            2
        ) AS average_amount_at_risk

    FROM analytics.fraud_alerts

    GROUP BY
        alert_type,
        detection_method
)

SELECT
    alert_type,
    detection_method,

    total_alerts,

    confirmed_fraud_alerts,
    false_positive_alerts,

    average_risk_score,

    total_amount_at_risk,
    average_amount_at_risk,

    ROUND(
        100.0 * confirmed_fraud_alerts
        / NULLIF(total_alerts, 0),
        2
    ) AS confirmed_fraud_percentage,

    ROUND(
        100.0 * false_positive_alerts
        / NULLIF(total_alerts, 0),
        2
    ) AS false_positive_percentage,

    RANK() OVER (
        ORDER BY
            100.0 * confirmed_fraud_alerts
            / NULLIF(total_alerts, 0) DESC
    ) AS fraud_conversion_rank

FROM alert_performance

ORDER BY
    fraud_conversion_rank;


--Best & Worst Detection Methods

WITH alert_conversion AS (

    SELECT
        alert_type,
        detection_method,

        COUNT(alert_id) AS total_alerts,

        SUM(
            CASE
                WHEN fraud_confirmed = TRUE
                THEN 1
                ELSE 0
            END
        ) AS confirmed_fraud_alerts,

        SUM(
            CASE
                WHEN fraud_confirmed = FALSE
                THEN 1
                ELSE 0
            END
        ) AS false_positive_alerts

    FROM analytics.fraud_alerts

    GROUP BY
        alert_type,
        detection_method
)

SELECT
    alert_type,
    detection_method,

    total_alerts,
    confirmed_fraud_alerts,
    false_positive_alerts,

    ROUND(
        100.0 * confirmed_fraud_alerts
        / NULLIF(total_alerts, 0),
        2
    ) AS confirmation_rate_percentage,

    ROUND(
        100.0 * false_positive_alerts
        / NULLIF(total_alerts, 0),
        2
    ) AS false_positive_rate_percentage,

    ROUND(
        confirmed_fraud_alerts::NUMERIC
        / NULLIF(false_positive_alerts, 0),
        2
    ) AS signal_to_noise_ratio

FROM alert_conversion

WHERE total_alerts >= 10

ORDER BY
    signal_to_noise_ratio DESC;


--Risk Score vs Fraud Confirmation

SELECT
    CASE
        WHEN risk_score >= 80
            THEN 'High Risk'

        WHEN risk_score >= 50
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS risk_band,

    COUNT(alert_id) AS total_alerts,

    SUM(
        CASE
            WHEN fraud_confirmed = TRUE
            THEN 1
            ELSE 0
        END
    ) AS confirmed_fraud_alerts,

    SUM(
        CASE
            WHEN fraud_confirmed = FALSE
            THEN 1
            ELSE 0
        END
    ) AS false_positive_alerts,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN fraud_confirmed = TRUE
                THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(alert_id), 0),
        2
    ) AS fraud_confirmation_rate

FROM analytics.fraud_alerts

GROUP BY
    CASE
        WHEN risk_score >= 80
            THEN 'High Risk'

        WHEN risk_score >= 50
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END

ORDER BY
    fraud_confirmation_rate DESC;



--Q-10. For each branch, what is the total account balance under management, total outstanding loan principal, 
--loan delinquency rate, average customer service resolution time and customer satisfaction score — and 
--which branches are strong on some dimensions but weak on others?

WITH branch_accounts AS (

    SELECT
        branch_id,

        COUNT(account_id) AS total_accounts,

        ROUND(
            SUM(current_balance),
            2
        ) AS total_account_balance,

        ROUND(
            AVG(current_balance),
            2
        ) AS average_account_balance

    FROM analytics.accounts

    GROUP BY branch_id
),

customer_branch AS (

    SELECT DISTINCT
        a.customer_id,
        a.branch_id

    FROM analytics.accounts a
),

branch_loans AS (

    SELECT
        branch_id,

        COUNT(loan_id) AS total_loans,

        ROUND(
            SUM(outstanding_principal),
            2
        ) AS total_outstanding_principal,

        SUM(
            CASE
                WHEN loan_status IN (
                    'Delinquent',
                    'Default',
                    'Written Off'
                )
                THEN 1
                ELSE 0
            END
        ) AS bad_loans

    FROM analytics.loans

    GROUP BY branch_id
),

branch_service AS (

    SELECT
        cb.branch_id,

        COUNT(cs.case_id) AS total_service_cases,

        ROUND(
            AVG(cs.resolution_time_hours),
            2
        ) AS average_resolution_time_hours,

        ROUND(
            AVG(cs.customer_satisfaction_score),
            2
        ) AS average_customer_satisfaction,

        SUM(
            CASE
                WHEN cs.escalated = TRUE
                THEN 1
                ELSE 0
            END
        ) AS escalated_cases

    FROM analytics.customer_service cs

    JOIN customer_branch cb
        ON cs.customer_id = cb.customer_id

    GROUP BY cb.branch_id
),

branch_scorecard AS (

    SELECT
        ba.branch_id,

        ba.total_accounts,
        ba.total_account_balance,
        ba.average_account_balance,

        COALESCE(
            bl.total_loans,
            0
        ) AS total_loans,

        COALESCE(
            bl.total_outstanding_principal,
            0
        ) AS total_outstanding_principal,

        COALESCE(
            bl.bad_loans,
            0
        ) AS bad_loans,

        COALESCE(
            bs.total_service_cases,
            0
        ) AS total_service_cases,

        COALESCE(
            bs.average_resolution_time_hours,
            0
        ) AS average_resolution_time_hours,

        COALESCE(
            bs.average_customer_satisfaction,
            0
        ) AS average_customer_satisfaction,

        COALESCE(
            bs.escalated_cases,
            0
        ) AS escalated_cases

    FROM branch_accounts ba

    LEFT JOIN branch_loans bl
        ON ba.branch_id = bl.branch_id

    LEFT JOIN branch_service bs
        ON ba.branch_id = bs.branch_id
)

SELECT
    branch_id,

    total_accounts,
    total_account_balance,
    average_account_balance,

    total_loans,
    total_outstanding_principal,
    bad_loans,

    ROUND(
        100.0 * bad_loans
        / NULLIF(total_loans, 0),
        2
    ) AS loan_bad_rate_percentage,

    total_service_cases,
    average_resolution_time_hours,
    average_customer_satisfaction,
    escalated_cases,

    RANK() OVER (
        ORDER BY total_account_balance DESC
    ) AS deposit_balance_rank,

    RANK() OVER (
        ORDER BY total_outstanding_principal DESC
    ) AS loan_exposure_rank,

    RANK() OVER (
        ORDER BY average_customer_satisfaction DESC
    ) AS customer_satisfaction_rank

FROM branch_scorecard

ORDER BY
    total_account_balance DESC;



--END--