INSERT INTO plans (plan_id, plan_name, monthly_price) VALUES
(1, 'Basic', 15.00),
(2, 'Pro', 30.00),
(3, 'Team', 60.00);

INSERT INTO customers (customer_id, created_at, country, acquisition_channel) VALUES
(1, '2025-01-03', 'US', 'Organic'),
(2, '2025-01-10', 'US', 'Paid Search'),
(3, '2025-01-15', 'CA', 'Referral'),
(4, '2025-02-02', 'US', 'Organic'),
(5, '2025-02-15', 'UK', 'Paid Social'),
(6, '2025-03-01', 'US', 'Referral'),
(7, '2025-03-12', 'CA', 'Organic'),
(8, '2025-04-05', 'US', 'Paid Search');

INSERT INTO subscriptions (subscription_id, customer_id, plan_id, start_date, end_date, status) VALUES
(101, 1, 2, '2025-01-03', NULL, 'active'),
(102, 2, 1, '2025-01-10', '2025-03-10', 'canceled'),
(103, 3, 2, '2025-01-15', NULL, 'active'),
(104, 4, 1, '2025-02-02', '2025-04-01', 'canceled'),
(105, 5, 3, '2025-02-15', NULL, 'active'),
(106, 6, 2, '2025-03-01', '2025-05-01', 'canceled'),
(107, 7, 1, '2025-03-12', NULL, 'active'),
(108, 8, 2, '2025-04-05', NULL, 'active');

INSERT INTO payments (payment_id, subscription_id, payment_date, amount, payment_status) VALUES
(1001, 101, '2025-01-03', 30.00, 'paid'),
(1002, 101, '2025-02-03', 30.00, 'paid'),
(1003, 101, '2025-03-03', 30.00, 'paid'),
(1004, 101, '2025-04-03', 30.00, 'paid'),

(1005, 102, '2025-01-10', 15.00, 'paid'),
(1006, 102, '2025-02-10', 15.00, 'late'),
(1007, 102, '2025-03-10', 15.00, 'failed'),

(1008, 103, '2025-01-15', 30.00, 'paid'),
(1009, 103, '2025-02-15', 30.00, 'paid'),
(1010, 103, '2025-03-15', 30.00, 'paid'),

(1011, 104, '2025-02-02', 15.00, 'paid'),
(1012, 104, '2025-03-02', 15.00, 'late'),
(1013, 104, '2025-04-01', 15.00, 'failed'),

(1014, 105, '2025-02-15', 60.00, 'paid'),
(1015, 105, '2025-03-15', 60.00, 'paid'),
(1016, 105, '2025-04-15', 60.00, 'paid'),

(1017, 106, '2025-03-01', 30.00, 'paid'),
(1018, 106, '2025-04-01', 30.00, 'paid'),
(1019, 106, '2025-05-01', 30.00, 'failed'),

(1020, 107, '2025-03-12', 15.00, 'paid'),
(1021, 107, '2025-04-12', 15.00, 'paid'),

(1022, 108, '2025-04-05', 30.00, 'paid');
