**Project overview and instructions**

🔍 Customer Order Pattern Analysis Using Advanced SQL Techniques
This project demonstrates an SQL solution for analyzing customer order behaviors over multiple months. It involves handling complex conditions, utilizing window functions, and performing period-based analysis to identify specific customer patterns.

📌 Overview
Given a blinkit_orders table with columns:

customer_id
order_date
coupon_code (nullable)

The goal is to identify customers who:

Have orders in three consecutive months  
Follow specific order count patterns (e.g., doubling or tripling month-over-month)
Used coupons in their latest orders

🛠️ Features & Techniques

Stepwise analysis with Common Table Expressions (CTEs)  
Window functions: lead(), row_number()
Date & time operations: to_char(), date_trunc(), age(), date_part()
Multi-condition filtering for pattern detection
Join operations for comprehensive insights

🚀 How to Run


Place your dataset (blinkit_orders.xlsx) inside the data/ folder.  
Ensure your PostgreSQL database contains the blinkit_orders table with the data.
Run the SQL query file (sql_analysis.sql) in your SQL client.

Review the output results and insights.

🎯 Key Learnings
Breaking down complex logic into manageable CTEs
Using window functions for sequential data analysis
Performing period calculations with date functions
Combining multiple conditions for pattern detection

📄 Files

sql_analysis.sql: The main SQL query implementing the analysis
README.md: Project overview and instructions

📢 Acknowledgments
Inspired by Ankit Bansal's SQL challenge, this project helped me deepen my understanding of advanced SQL techniques!

📝 License
This project is for educational purposes.
