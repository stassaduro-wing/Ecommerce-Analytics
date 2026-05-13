# 📊 Interactive eCommerce Executive Summary (theLook)

![Dashboard Preview](viz/images/Executive_Summary.pdf) 

> **Live Demo:** [Link to Tableau Public](https://public.tableau.com/app/profile/stanislav.saduro/viz/e-commerceproj/Dashboard1)

## 📌 Project Overview
This project presents a high-level **Executive Summary** dashboard for an eCommerce business. It is designed to provide stakeholders with immediate insights into sales performance, profitability, and customer acquisition trends.

The core challenge was not just to visualize data, but to build a scalable analytical environment from scratch — from designing the database schema to implementing complex business logic in BI.

## 🛠 Tech Stack
* **BI Tool:** Tableau Desktop (2024.1)
* **Database:** PostgreSQL (Cloud/Local instance)
* **Languages:** SQL (PostgreSQL), Tableau Calculations (LOD, Advanced Logic)
* **Data Source:** [Kagle eCommerce dataset](https://www.kaggle.com/datasets/mustafakeser4/looker-ecommerce-bigquery-dataset?select=products.csv) (Synthesized Sales, Users, and Products data)

## 🗄 Data Engineering & Architecture
Unlike many BI projects based on flat files, this one utilizes a relational database structure.
* **Database Design:** Reconstructed a relational schema consisting of **7 tables** (Orders, Products, Users, Distribution Centers, etc.).
* **Relational Logic:** Configured `JOIN` and `REFERENCES` logic to ensure data integrity across the analytical layers.
* **Quality Assurance (QA):** Performed data auditing using SQL to verify chronological consistency, handle NULL values, and eliminate duplicate records.

*(See the `/sql` directory for the full DDL and audit scripts).*

## 📈 Key Dashboard Features
* **Dynamic Period Switching (MoM/YoY)**: Integrated advanced parameters allowing users to toggle between Month-to-Date and Year-to-Date views with a single click.
* **Advanced Calculation Logic**: Implemented `DATEADD` and `DATETRUNC` formulas to calculate "Previous Period" metrics automatically.
* **Executive KPIs**: Tracking Total Revenue, Net Profit, Average Order Value (AOV), and Order Volume.
* **Trend Visualizations**: Combined chart types to show performance vs. targets and historical growth.

## 📂 Repository Structure
* 📁 `viz`: Contains the `.twbx` (Tableau Packaged Workbook) and high-res screenshots.
* 📁 `sql/`: Contains the database initialization (`init_db.sql`) and data cleaning scripts (`data_audit.sql`).
* 📁 `images/`: High-resolution assets for documentation.

---

## 💡 How to Use
1.  Navigate to the `viz` folder.
2.  Download the `.twbx` file.
3.  Open it using **Tableau Desktop** or **Tableau Reader**.
4.  *(Note: The workbook is packaged with data extracts for offline viewing).*

**Author:** Stanislaw Saduro
**Connect with me via email or LinkedIn:** 

stas.saduro@gmail.com

https://www.linkedin.com/in/stanislav-saduro-4045b3305/
