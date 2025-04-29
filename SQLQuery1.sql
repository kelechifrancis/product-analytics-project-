USE Products_Analytics_Project;
GO


WITH cte AS (
    SELECT 
        pd.Product,
        pd.Category,
        pd.Brand,
        pd.Description,
        pd.Sale_Price,
        pd.Cost_Price,
        pd.Image_url,

        -- Fixed date
        CONVERT(datetime2,
            CONCAT(
                FORMAT(ps.date, 'yyyy'), '-', 
                FORMAT(ps.date, 'dd'), '-', 
                FORMAT(ps.date, 'MM')
            )
        ) AS Corrected_Date,

        ps.Customer_Type,
        ps.Discount_Band,
		ps.Country,
        ps.Units_Sold,
        Sale_Price * Units_Sold AS Revenue,
        Cost_Price * Units_Sold AS Total_Cost,

        FORMAT(CONVERT(datetime2,
            CONCAT(
                FORMAT(ps.date, 'yyyy'), '-', 
                FORMAT(ps.date, 'dd'), '-', 
                FORMAT(ps.date, 'MM')
            )
        ), 'MMMM') AS month,

        FORMAT(CONVERT(datetime2,
            CONCAT(
                FORMAT(ps.date, 'yyyy'), '-', 
                FORMAT(ps.date, 'dd'), '-', 
                FORMAT(ps.date, 'MM')
            )
        ), 'yyyy') AS year

    FROM Product_data pd
    JOIN product_sales ps ON pd.Product_ID = ps.Product
)
SELECT 
    *,
    (1 - Discount * 1.0 / 100) * Revenue AS Discount_Revenue
FROM cte a
JOIN discount_data da 
    ON a.month = da.Month
    AND a.Discount_Band = da.Discount_Band;
