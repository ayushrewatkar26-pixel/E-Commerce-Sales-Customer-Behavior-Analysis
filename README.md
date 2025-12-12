# E-Commerce-Sales-Customer-Behavior-Analysis
By: Ayush Rewatkar

SQL ▷ Python ▷ Power BI ▷ Insights

This end-to-end analytics project explores sales performance, customer behavior, delivery operations, and RFM segmentation using real-world e-commerce data.
The workflow integrates MySQL, Python, and Power BI to deliver insights that support data-driven business decisions.

🚀 Project Workflow
1️⃣ SQL — Data Cleaning & Transformation (MySQL Workbench)

Clean and standardize raw data

Remove duplicates

Format timestamps

Join tables to create the master table: full_orders

Generate RFM base table

Perform analytical SQL queries

2️⃣ Python — EDA & Customer Analysis

Import SQL tables into Pandas

Clean & preprocess data

Exploratory Data Analysis (EDA)

Customer behavior analysis

RFM segmentation using Python

Export datasets for Power BI

3️⃣ Power BI — Dashboard & Insights

Sales performance dashboard

Customer segmentation dashboard

Operations & delivery performance dashboard

Interactive KPIs, slicers, drilldowns

📊 Dashboards (Power BI)
1. Sales Overview

Total Revenue

Total Orders

Average Order Value (AOV)

Monthly Sales Trend

Category Revenue

Top 10 Products

2. Customer Behavior

RFM Segmentation

Customer Lifetime Value

Repeat Purchase Customers

High-value vs Low-value customers

3. Operations & Delivery

Delivery Days & Delays

Review Score Distribution

Payment Methods

Top Sellers


🗄️ SQL Components
✔️ Master Table (full_orders)

Joined using:

orders_dataset

customers

order_items

order_payments

order_reviews

products

sellers

✔️ Key SQL Queries

Total Sales

Monthly Sales Trend

Category-wise Revenue

Top 10 Products

Delivery Analysis

Payment Method Summary

✔️ RFM SQL Query

Calculating Recency, Frequency, Monetary per customer.

🐍 Python Components
Notebooks Included

Python_eda.ipynb — Data Cleaning + Exploratory Analysis + RFM Scoring + Customer Segmentation

Visualizations

Sales Trend

Category Revenue

Payment Type Usage

Delivery Days Distribution

RFM Heatmap

Customer Segments

Libraries Used
pandas
numpy
matplotlib
sqlalchemy

📁 Project Folder Structure
ecommerce-sales-customer-analysis/
│
├── 1_SQL/
│   ├── create_master_table.sql
│   ├── cleaning_queries.sql
│   ├── analysis_queries.sql
│   └── rfm_queries.sql
│
├── 2_Python/
│   ├── python_eda.ipynb
│   ├── requirements.txt
│   └── final_ecommerce_dataset.csv 
│
├── 3_PowerBI/
│   ├── Ecommerce_Dashboard.pbix
│   ├── dashboard_screenshots/
│
├── images/
│   ├── project_cover.png
│
└── README.md

📥 How to Use This Project
Clone Repository
git clone https://github.com/your-username/ecommerce-sales-analysis.git

Install Python Dependencies
pip install -r requirements.txt

Run Python Notebooks

Open .ipynb files in
Jupyter Notebook / VS Code / Google Colab.

View Dashboard

Open Power BI (.pbix) file.

🧠 Key Insights (Examples)

Customers with high frequency but moderate monetary value represent strong growth potential.

Delivery delays correlate negatively with review scores.

A few product categories contribute to the majority of revenue (Pareto 80/20 pattern).

Payment is dominated by credit card transactions.

🧾 Author

👤 Ayush Rewatkar
Aspiring Data Analyst | B.Tech CSE (AI)
🔗 LinkedIn: www.linkedin.com/in/ayushrewatkar2611
