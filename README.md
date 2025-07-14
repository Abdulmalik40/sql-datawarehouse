 SQL Data Warehouse
A data warehouse implementation using the medallion architecture pattern with Bronze, Silver, and Gold layers for progressive data refinement and analytics.
🏗️ Architecture Overview
This project implements a three-tier medallion architecture:

🥉 Bronze Layer: Raw data ingestion and storage
🥈 Silver Layer: Cleaned, validated, and enriched data
🥇 Gold Layer: Business-ready aggregated data and analytics

Data Sources → Bronze → Silver → Gold → Analytics/BI Tools
