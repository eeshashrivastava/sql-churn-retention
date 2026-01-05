/* =========================================================
   Customer Churn & Retention Analysis (SQLite)
   Core questions: active users, churn, churn by plan, revenue,
   and churn risk signals (payment issues).
   ========================================================= */

/* 1) Active subscriptions */
SELECT
  COUNT(*) AS active_subscriptions
FROM subscriptions
WHERE end_date IS NULL;

/* 2) Active subscriptions by plan */
SELECT
  p.plan_name,
  COUNT(*) AS active_subscriptions
FROM subscriptions s
JOIN plans p
  ON s.plan_id = p.plan_id
WHERE s.end_date IS NULL
GROUP BY p.plan_name
ORDER BY active_subscriptions DESC;

/* 3) Churned subscriptions count */
SELECT
  COUNT(*) AS churned_subscriptions
FROM subscriptions
WHERE end_date IS NOT NULL;

/* 4) Overall churn rate */
SELECT
  ROUND(
    1.0 * SUM(CASE WHEN end_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS churn_rate
FROM subscriptions;

/* 5) Churn by plan */
SELECT
  p.plan_name,
  COUNT(*) AS total_subscriptions,
  SUM(CASE WHEN s.end_date IS NOT NULL THEN 1 ELSE 0 END) AS churned_subscriptions,
  ROUND(
    1.0 * SUM(CASE WHEN s.end_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS churn_rate
FROM subscriptions s
JOIN plans p
  ON s.plan_id = p.plan_id
GROUP BY p.plan_name
ORDER BY churn_rate DESC;

/* 6) Monthly paid revenue (MRR-like trend) */
SELECT
  substr(payment_date, 1, 7) AS month,
  ROUND(SUM(amount), 2) AS paid_revenue
FROM payments
WHERE payment_status = 'paid'
GROUP BY 1
ORDER BY 1;

/* 7) Churn signal: payment issues per subscription */
SELECT
  s.subscription_id,
  s.stat
