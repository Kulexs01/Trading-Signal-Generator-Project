Project: Trading Signal Generator

Objective: Developed a 20/50-day Simple Moving Average (SMA) crossover trading strategy for SPY.

Data: SPY daily prices from 9/30/2020 to 3/7/2025, sourced via yfinance and stored in PostgreSQL.

Tools:
- Python (yfinance for data download)
- SQL (PostgreSQL for data prep, calculating SMAs)
- Excel (signal generation, backtesting, metrics)
- Tableau (visualization of cumulative returns)

Methodology:
- Calculated 20-day and 50-day SMAs in SQL.
- Generated Buy/Sell signals in Excel (Buy: sma_20 crosses above sma_50; Sell: sma_20 crosses below sma_50).
- Filtered 203 Buy and 683 Sell signals into 12 distinct trades (ignoring consecutive signals).
- Backtested returns and evaluated performance.

Results:
- Total Return: 49% over 4.5 years
- Win/Loss Ratio: 10 (10 wins, 1 loss)
- Max Drawdown: -16%
- Number of Trades: 12
- Annualized Return: 9.4%

Visualization:
- Created a line chart in Tableau showing the strategy’s cumulative return (49%) over time, compared to a SPY buy-and-hold benchmark (71.4%).
