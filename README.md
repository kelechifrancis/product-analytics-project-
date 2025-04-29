# Product-Analytics-Project
This end-to-end product analytics project focuses on building and querying a database using Microsoft SQL Server Management Studio (SSMS) and creating data visualizations in Power BI. Google Sheets was also used for initial data exploration and light product analysis to demonstrate spreadsheet skills before full database querying.

## Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Results and FIndings](#results-and-findings)
- [Recommendations](#recommendations)

## Project Overview
The request is to develop a single page high-level product analytics dashboard for a leading innovator in the audio technology industry, dedicated to providing high-quality audio solutions for professionals and enthusiasts.
The dashboard should provide insights into key product performance metrics that will support strategic decision-making and allow performance tracking.

### Key Metrics:
1. Revenue by Country: Top-performing regions with corresponding revenue.
2. Revenue by Date and Year: Comparative trends
3. Profit and Unit Sales Year-over-Year (YoY) Change: High-level summary of YoY growth.
4. Profit Breakdown by Discount Band: Distribution of profit across different discount categories.
5. Revenue and profit details by country and year. 

## Data Sources
Data was sourced from [Absent Data](https://absentdata.com/) and loaded into Google Sheets for EDA, and then into SSMS 18 for database building and querying. The data was then linked to Power BI from SSMS 18 for dashboard building and visualization.

### Tables:
1. Product Data: The `product_data.csv` uniquely lists the company's different products and their details including;
    - Product ID
    - Product (name of product)
    - Category (product category)
    - Cost Price (product cost price)
    - Sale Price (product selling price)
    - Brand (product brand name)
    - Description (product description)
    - Image url (link to product image)
      
2. Product Sales: The `product_sales.csv` file contains the information of each sale made by the company. It includes the following fields;
    - Date (the data includes sales records from January 1, 2022 to December 31, 2022)
    - Customer Type (the data has 5 unique customer types; creator, education, enterprise, government and small business)
    - Country (country where the sale was made)
    - Product (product purchased)
    - Discount Band (range of discount applied on the sale. The unique discount bands are none, low, medium and high)
    - Units Sold
      
3. Discount Data: The `discount_data.csv` file lists the various discounts offerings for each month from January to December. It includes the following fields;
    - Month
    - Discount Band (range of discount applied on the sale. The unique discount bands are none, low, medium and high)
    - Discount (the discount percentage offering)

## Tools
- Google Sheet: For exploratory data analysis [see spreadheet here](https://docs.google.com/spreadsheets/d/1IM_uVcEWs5BYq0vJK-SgasrCd78JTwDZ07F6gofKRjU/edit?usp=sharing)
- Microsoft SQL Server Management Studio 18: For database creation and data querying
- Power BI: For dashboard creation

## Data Cleaning and Preparation
The data did not require complex data cleaning exercises but had two major concerns to be addressed- date formatting and missing values handling. 

### Handling Missing Values
In the `product_sales table`, there was one record with a missing `product_ID`. The associated `country` and `customer_type` values were available (`USA` and `Education`, respectively).
To impute the missing `product_ID`, the product with the highest number of sales among customers in the USA with a customer type of `Education` was identified and assigned to the missing entry.

This approach allowed the sale to be preserved without significantly impacting the overall analysis.
However, it introduces a small assumption that the missing product aligns with the most commonly sold product for that group, which may not be 100% accurate. This was considered an acceptable trade-off given the minimal number of affected records (only one row).

### Date Formatting
The original sales dataset had dates formatted as dd-mm-yyyy. However, because tools like Google Sheets and SQL Server have default settings that assume different date formats (e.g., mm-dd-yyyy for US locales), the dates were sometimes misinterpreted — for example, 01-12-2023 could be incorrectly read as January 12th instead of December 1st. For datasets involving dates, it is important to always verify that the regional settings and date parsing rules in the tools match the intended format of the data. Failing to do so can cause significant misinterpretations in time-based analyses and reports. Here's how it was resolved;

- In Google Sheets, the locale setting was changed from United States to United Kingdom, ensuring that the dd-mm-yyyy format was interpreted correctly without needing to manually adjust the date values.

- In SQL Server, the DATEFORMAT was set to dmy at the beginning of my query sessions using `SET DATEFORMAT dmy`; to make sure the database engine interpreted dates in the correct day-month-year order.


## Exploratory Data Analysis
The exploratory data analysis focused on uncovering insights that would be valuable to product managers. For each product, the following key questions were investigated:

1. What? – What is the quantity sold and total revenue generated per year?

2. When? – What is the revenue trend over time? Are there identifiable peak and low sales periods?

3. Where? – Which countries generate the highest revenue? How profitable is the product across different regions?

4. Who? – Which customer types contribute most to sales volume? How profitable is each customer segment?

5. How? – Which discount bands are most effective in driving sales, and how do they impact overall profitability?



## Results and Findings
The key findings from the analysis are summarized below:

1. **Sales Seasonality**
Across all products, there is a consistent and noticeable sales peak in June and October each year. Some products experience sharper peaks than others, suggesting higher surges in demand and during those months.

2. **Profitability by Country and Customer Type**

Profitability does not always correlate with revenue.

For example, the NT1-A product generated 8% more revenue in Canada than in the USA, yet both countries recorded a similar total profit of about $21,000 each (2022–2023). This suggests higher profitability in the Canadian market.

The Arctis 7P+ product recorded 23% more sales from Education customers compared to Enterprise customers, but was more profitable when sold to Enterprise customers, generating over $2,000 more in profit.

3. **Impact of Discount Bands on Profitability**

Medium-range discounts were the most profitable across most products.

An exception is the MV7 product, which was most profitable under low-range discounts and showed a loss under high-range discounts — indicating that excessive discounting leaded to loss for that item.


## Recommendations
Based on the analysis, the following actions are recommended;
1. **Leverage Sales Peaks for Targeted Campaigns**
Since June and October show consistently high sales across products, marketing and promotional campaigns should be intensified during these months. Consider launching discounted product bundles or loyalty offers to maximize revenue during peak periods.

2. **Optimize Market and Customer Targeting**

- For products like NT1-A, allocate more resources to the Canadian market, where the profitability is higher, even if revenue appears similar to other markets.

- Tailor sales strategies to customer types. For example, the Arctis 7P+ should be strategically marketed to Enterprise customers, where margins are higher, despite Education customers generating more volume.

3. **Adjust Discounting Strategy**

- Maintain or expand medium-range discount offers, as they consistently yield strong profitability across most products.

- Avoid or minimize high-range discounts on sensitive products like MV7, where high discounts leads to financial losses.

## Limitations
The missing value resolution assumed that the missing `product_ID` aligns with the most commonly sold product for that group. This assumption may not be 100% accurate and thus affects the confidence level of this analysis.

## References
1. [Absent Data](https://absentdata.com/data-analysis/end-to-end-data-analysis-project/)
2. [YouTube](https://www.youtube.com/watch?v=6MOyrQLCi3w)
