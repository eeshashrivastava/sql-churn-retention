# Customer Churn & Retention Analysis (SQL)

## Overview
This project analyzes customer churn, plan performance, and revenue trends for a subscription-based business using **SQLite**. The goal is to demonstrate practical SQL skills (joins, aggregation, conditional logic) and translate results into business insights.

## Business Questions
- How many subscriptions are currently active?
- What is the overall churn rate?
- Which plans churn the most?
- How does paid revenue trend over time?
- Do churned subscriptions show early warning signs (late/failed payments)?

## Data
The dataset is **synthetic** and seeded using SQL insert statements for reproducibility.

### Tables
- `customers` - customer signup info (country, acquisition channel)
- `plans` - plan tier and monthly price
- `subscriptions` - start/end dates and subscription status
- `payments` - payment history and payment status
- `support_tickets` - included in schema (optional for future analysis)

## Key Findings (from this sample dataset)
- Overall churn rate is **~38%**
- **Basic** plan has the highest churn (**~67%**) compared to **Pro** (**~25%**)
- Paid revenue trends upward across the active months in the sample
- Churned subscriptions tend to have **more late/failed payments**, suggesting payment friction may be an early churn signal

## How to Reproduce
1. Create tables:
   - Run `sql/01_schema.sql`
2. Seed data:
   - Run `sql/02_seed_data.sql`
3. Run analysis:
   - Run queries in `sql/03_analysis.sql`

## Tools
- SQLite
- DB Browser for SQLite (local execution)
- SQL

## Next Steps (future improvements)
- Add cohort retention (month 0, month 1, etc.)
- Add support ticket impact on churn risk
- Expand dataset size for more robust analysis
