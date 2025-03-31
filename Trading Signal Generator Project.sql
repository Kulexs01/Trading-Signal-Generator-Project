SELECT * FROM spy_prices
LIMIT 5;

SELECT MIN(date), MAX(date)
FROM spy_prices;

--Data Preparation: Calculating 20-day and 50-day moving average.
CREATE TABLE spy_with_ma AS
WITH daily_prices AS (
	SELECT date,adj_close
	FROM spy_prices
	ORDER BY date
)
	SELECT
		date,
		adj_close,
		CASE
			WHEN ROW_NUMBER() OVER(ORDER BY date) >= 20
			THEN AVG(adj_close) OVER(
				ORDER BY date
				ROWS BETWEEN 19 PRECEDING AND CURRENT ROW
			) 
			ELSE NULL
		END AS sma_20,
		CASE 
			WHEN ROW_NUMBER() OVER(ORDER BY date) >= 50
			THEN AVG(adj_close) OVER(
				ORDER BY date
				ROWS BETWEEN 49 PRECEDING AND CURRENT ROW
			)
			ELSE NULL
		END AS sma_50
FROM daily_prices
ORDER BY date;

SELECT date,adj_close, sma_20, sma_50
FROM spy_with_ma
ORDER BY date
LIMIT 60;

		