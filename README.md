# 🌍 World Economics Classification


## 🔍 Project Overview

Economic data is crucial for understanding global wealth distribution, economic stability, and development trends. The World Economics Classification project aims to provide a **comprehensive analysis of GDP per capita** across 176 countries using a structured approach with **SQL and data visualization with Tableau Public**.

The main motivation and objectives of this project are:

- **Optimizing and analyzing economic data** through SQL.
- **Exploring key economic indicators** that influence GDP per capita.
- **Creating an interactive visualization** to provide meaningful insights.

This project serves as an excellent resource for economists, researchers, and data enthusiasts looking to explore economic trends through data-driven storytelling.

## 🏗️ Project Workflow

The project follows a structured **data pipeline** that ensures the accuracy and usability of insights.

1️⃣ **Data Acquisition & Preparation**

- The dataset originates from Kaggle and contains **GDP per capita (nominal & PPP), wealth rankings, IMF & UN classifications, fuel export status, G7 and EU membership** details for 176 countries.
- Initial data cleansing was performed in SQL, ensuring:
     - **Handling NULL values** (replaced with 0 for consistency).
     - **Data type standardization** for seamless computation.
     - **Enhancing the dataset** by adding a continent classification column.

2️⃣ **Exploratory Data Analysis (EDA) in SQL**

A **thorough SQL-based analysis** was conducted to extract meaningful insights:

- Used **aggregate functions** to determine GDP per capita **minimum, maximum, average, and more** values.
- Grouped data by **continents** to understand regional GDP disparities.
- Leveraged **window functions and subqueries** to rank and categorize countries based on economic performance.

3️⃣ **Data Visualization with Tableau**

Using insights from SQL analysis, the **Global GDP Per Capita Report 2022** was created in Tableau.

This report provides:

✔ A **concise explanation** of GDP per capita and its calculation.

✔ **Key findings**, including the highest, lowest, and average GDP per capita values.

✔ An **interactive dendrogram**, allowing users to explore GDP per capita per continent and country.

✔ **Bar charts**, comparing GDP per capita across different economic classifications (e.g., IMF & UN, G7 and EU membership and fuel-exporting countries).

✔ A **scatter plot**, visualizing a GDP per capita overview by country, color-coded by continent.

This visual approach makes complex economic data more accessible, allowing for deeper exploration and pattern recognition.

## 📂 Files in This Repository

- **WEC.csv**: Original Kaggle dataset
- **World_Economics_Classification.sql**: SQL queries for data processing
- **World_Economics_Classifications.csv**: Optimized dataset after SQL transformations
- **Global_GDP_Per_Capita_Report**: Interactive Tableau Public Visualization

## 🚀 Getting Started

1️⃣ Download the dataset and SQL script.

2️⃣ Run the SQL queries in your preferred database system.

3️⃣ Open the Tableau visualization for interactive data exploration.

## 📢 Future Directions

🔹Incorporating historical GDP trends for a time-series analysis.

🔹Automating data processing using Python (Pandas & SQLAlchemy).

🔹Expanding the dataset to include additional economic indicators (e.g., inflation, unemployment rates).

🔹Enhance interactivity in Tableau by adding more filters.

## 📖 License

This project is licensed under the MIT License - see the LICENSE file for details.
