# Global E-Commerce Performance Analysis

## 📌 Project Overview

This project is an **end-to-end data analytics pipeline** designed to analyze global e-commerce performance using **dbt (data build tool)** for data transformation and **Power BI** for data visualization. The objective is to transform raw transactional data into **business-ready analytical models** that support executive decision-making, supply chain optimization, and customer segmentation.

Data Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
The project follows modern analytics engineering best practices, including layered modeling (staging → marts), version control with Git/GitHub, and BI-ready data marts.

---

## 🎯 Business Objectives

The analysis answers key business questions across three strategic perspectives:

### 1. Executive (C-Level) View

* Total Revenue (Year-over-Year)
* Total Orders
* Average Order Value (AOV)
* Top 5 Product Categories by Revenue

### 2. Supply Chain & Logistics Performance

* On-time Delivery Rate (%)
* Average Delivery Delay vs Estimated Delivery Date
* Geographic distribution of late deliveries by customer state
* Identification of product categories and regions with the highest delivery delays

### 3. Customer & Marketing Analytics

* RFM (Recency, Frequency, Monetary) customer segmentation
* Identification of Loyal Customers, Big Spenders, and Churn Risk segments
* Customer payment method preferences (Credit Card vs Boleto/Voucher)

---

## 🏗️ Data Architecture & Modeling Approach

This project uses a **three-layer dbt model structure**:

### 1. Staging Layer (`models/staging`)

Purpose:

* Clean and standardize raw source data
* Rename columns for clarity
* Apply basic type casting (dates, timestamps, numeric fields)

Examples:

* `stg_olist_orders`
* `stg_olist_customers`
* `stg_olist_order_items`

Characteristics:

* 1-to-1 mapping with source tables
* Minimal business logic
* Implemented as **views**

---

### 2. Intermediate Layer (Optional / Logical Prep)

Purpose:

* Combine multiple staging models
* Prepare reusable datasets for marts
* Apply moderate business logic if needed

Note:
For this project, transformations are simple enough that most logic is handled directly in marts.

---

### 3. Mart Layer (`models/marts`)

Purpose:

* Deliver **business-ready analytical tables**
* Optimized for BI tools and dashboards

Key Mart Tables:

* `mart_customer_rfm`
* `mart_supply_chain_delay`
* `mart_product_quality`

Characteristics:

* Aggregated metrics
* Clear business definitions
* Materialized as **tables** for performance

---

## 📊 Power BI Dashboard

The transformed dbt mart tables are consumed directly by **Power BI** to create interactive dashboards.

### Dashboard Sections:

#### Executive Summary

* KPI cards: Total Revenue, Total Orders, AOV
* Bar chart: Top 5 Product Categories by Revenue
* Year-over-Year revenue trend

#### Supply Chain & Logistics

* On-time Delivery Rate
* Average delivery delay (actual vs estimated)
* Map visualization of late deliveries by customer state

#### Customer Segmentation (RFM)

* RFM segmentation visualization
* Pie chart of customer segments (Loyal, Big Spender, Churn Risk)
* Payment method preference analysis

📌 **Power BI screenshots will be added here**

---

## 🛠️ Tech Stack

* **Database**: PostgreSQL
* **Transformation**: dbt Core (Postgres Adapter)
* **Visualization**: Power BI
* **Version Control**: Git & GitHub
* **Environment**: Python Virtual Environment

---

## 📁 Project Structure

```
Global_E_Commerce_Performance_Analysis/
│
├── models/
│   ├── staging/
│   ├── marts/
│   └── example/
│
├── macros/
├── tests/
├── seeds/
├── snapshots/
├── dbt_project.yml
├── README.md
└── .gitignore
```

---

## ✅ Data Quality & Testing

* Not-null tests
* Uniqueness tests on primary keys
* Source freshness validation (where applicable)

All tests are executed using:

```bash
dbt test
```

---

## 🚀 How to Run This Project

1. Clone the repository

```bash
git clone https://github.com/rafdi03/Global-E-Commerce-Performance-Analysis.git
```

2. Create and activate virtual environment

```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
```

3. Install dbt dependencies

```bash
pip install dbt-core dbt-postgres
```

4. Configure `profiles.yml`

5. Run dbt models

```bash
dbt run
dbt test
```

6. Connect Power BI to PostgreSQL and load mart tables

---

## 👤 Author

**Arya**
Data Analytics & Analytics Engineering Enthusiast

---

## 📌 Notes

This project demonstrates:

<img width="1152" height="650" alt="Screenshot 2026-01-04 143109" src="https://github.com/user-attachments/assets/7a0152db-584f-4de1-a979-207492340eec" />

* Analytics Engineering best practices
* Clean separation of transformation layers
* BI-ready data modeling
* Real-world business use cases using e-commerce data

This repository is suitable for **portfolio, technical interviews, and production-style analytics demonstrations**.
