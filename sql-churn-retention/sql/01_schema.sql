PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS support_tickets;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS plans;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  created_at DATE NOT NULL,
  country TEXT NOT NULL,
  acquisition_channel TEXT NOT NULL
);

CREATE TABLE plans (
  plan_id INTEGER PRIMARY KEY,
  plan_name TEXT NOT NULL,
  monthly_price REAL NOT NULL
);

CREATE TABLE subscriptions (
  subscription_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  plan_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  status TEXT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

CREATE TABLE payments (
  payment_id INTEGER PRIMARY KEY,
  subscription_id INTEGER NOT NULL,
  payment_date DATE NOT NULL,
  amount REAL NOT NULL,
  payment_status TEXT NOT NULL,
  FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

CREATE TABLE support_tickets (
  ticket_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  created_at DATE NOT NULL,
  issue_type TEXT NOT NULL,
  priority TEXT NOT NULL,
  resolved_at DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
