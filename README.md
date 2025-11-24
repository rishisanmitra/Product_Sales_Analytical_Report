# Product Sales Analysis Report

## Data Validation and Cleaning

A full validation was conducted on every column in the dataset to ensure accuracy before analysis. The dataset contained 15,000 customer records representing sales of a newly launched office product line over the first six weeks.

The `week` column was validated first. This variable records the week of purchase relative to the product launch. Values ranged from 1 to 6, matching the expected six-week launch period, so no cleaning was required.

The `sales_method` column initially contained inconsistent labels, including “email,” “Email,” “Call,” “em + call,” and “Email + Call.” These were standardized to the three valid categories: Email, Call, and Email + Call. After these corrections, a distinct value check confirmed that only the three expected labels remained.

The `customer_id` field was validated for uniqueness. There were 15,000 distinct IDs for 15,000 rows, confirming that the dataset contained no duplicate customer records. No adjustments were necessary.

The `nb_sold` column records the number of units of the new product sold. All values were positive and within a reasonable range. However, 1,074 rows had positive quantities sold while having missing values in the revenue column. Since revenue cannot be missing when a sale occurs, these rows were identified as data entry errors. They were kept for non-revenue analyses but removed from all revenue-based summaries and visualizations.

The `revenue` column contained the same 1,074 missing values identified above. Because revenue depends on the specific products and pricing and cannot be reliably inferred from other fields, no imputation was performed. A cleaned dataset with only valid revenue entries was created for revenue analysis.

The `years_as_customer` variable was checked to ensure that values fell within a plausible range. Pens and Printers was founded in 1984, so the maximum possible customer tenure is approximately forty years. Two rows had values of forty-seven and sixty-three years, which are impossible. These rows were removed. All remaining values were valid.

The `nb_site_visits` column, recording the number of website visits in the last six months, ranged from twelve to forty-one. All values were non-missing, non-negative, and plausible. No cleaning was required.

The `state` column was validated by reviewing distinct values. All fifty U.S. states were present, each spelled correctly and consistently formatted. No cleaning was necessary.

---

## Exploratory Analysis

The analysis addresses four essential questions related to customer volume, the distribution of revenue, how revenue evolved across the six-week launch period, and which sales method demonstrates the strongest performance. Each question is examined using the validated dataset and supported with visual evidence from Figures 1–4.

### Customers by Sales Method

Email reached the largest number of customers, with 7,465 records compared to 4,961 for Call and 2,572 for Email + Call. Figure 1 illustrates this distribution. The prominence of Email reflects its minimal labor requirement and high scalability, while the two call-based methods were applied to fewer customers due to the additional time investment.

  
**Figure 1. Number of Customers by Sales Method**  
![Customers by Method](/Visuals/01_customers_by_method.png)

<br><br><br><br>

### Overall Revenue Distribution

The overall revenue distribution is shown in Figure 2. The histogram reveals a strongly right-skewed pattern. Most customers generated between fifty and one hundred twenty dollars. Several noticeable peaks appear near one hundred, one hundred fifty, and one hundred eighty dollars, suggesting multiple product configurations or bundle pricing within the new product line. A small number of customers generated revenue above two hundred dollars, causing a visible right tail. This indicates the presence of higher-value opportunities, especially among customers receiving more personalized outreach.

  
**Figure 2. Overall Revenue Distribution**  
![Revenue Distribution](/Visuals/02_revenue_distribution.png)

<br><br><br><br>

### Revenue by Sales Method

Revenue performance varied significantly across the three sales methods. Figure 3 shows that Email + Call achieved the highest outcomes by a substantial margin, with a median near one hundred eighty-five dollars. The interquartile range is wide, suggesting that this method captures many high-value customers. The Email method produced moderate but consistent results centered around ninety-six dollars. The Call-only method produced the lowest revenue, around forty-nine dollars, and exhibited the least variability.

The clear separation among the three distributions in Figure 3 indicates that the choice of sales method directly influences revenue outcomes. The short follow-up call included in the Email + Call approach appears to have a strong positive effect on customer purchasing behavior.

  
**Figure 3. Revenue by Sales Method**  
![Revenue by Method](/Visuals/03_revenue_by_method.png)

<br><br><br><br>

### Revenue Trends Over Time

Revenue trends across the six-week period are presented in Figure 4. Email + Call consistently delivered the highest average revenue each week and demonstrated steady improvement over time. By week six, average revenue for this method exceeded two hundred dollars. Email grew gradually from around eighty-five dollars in week one to over one hundred twenty dollars by week six. Call-only showed minor improvement but continued to lag behind.

The upward trend in Figure 4 suggests increased customer familiarity with the new product line as the launch progressed. More importantly, the Email + Call pattern implies that combining automated outreach with a brief personal touch has an increasingly positive effect over time.

  
**Figure 4. Average Revenue Over Time by Method**  
![Revenue Over Time](/Visuals/04_revenue_over_time_by_method.png)

<br><br><br><br>

### Additional Customer Characteristics

Customer characteristics including years as a customer and website activity were also compared across methods. Average customer tenure ranged between 4.5 and 5.2 years, with no material differences among the groups. Website visit averages ranged from 24.4 to 26.8 visits, showing only minor variation. These similarities indicate that customer differences do not explain the revenue variation observed; the sales method itself is the primary driver of performance.

---

## Business Metrics

To support ongoing decision-making, two complementary metrics were selected. The first, Average Revenue per Customer (ARC), measures how much revenue each sales method generates on a per-customer basis. The second, Revenue Per Minute of Sales Effort (RPM), incorporates the time required for each method, allowing the business to evaluate not only effectiveness but also efficiency.

### Average Revenue per Customer (ARC)

ARC represents the average revenue generated per customer contacted via a given method. It provides a baseline assessment of revenue performance and is straightforward to monitor across campaigns.

From the cleaned revenue dataset, ARC values were calculated for each sales method. The Call method produced an average revenue of approximately 47.6 dollars per customer. The Email method generated about 97.1 dollars per customer. The Email + Call method yielded the highest revenue, averaging roughly 184 dollars per customer.

### Revenue Per Minute of Sales Effort (RPM)

While ARC reflects effectiveness, it does not account for the cost of salesperson time. The Call method typically requires about thirty minutes per customer, whereas the Email + Call method requires only a short ten-minute call. The Email method requires minimal effort—effectively close to zero minutes for sending automated messages.

To capture efficiency, RPM was defined as:

$$
RPM = \frac{\text{Average Revenue Per Customer}}{\text{Minutes Of Sales Effort Per Customer}}
$$



Using effort assumptions of 30 minutes for Call, 10 minutes for Email + Call, and 1 minute for Email (to represent minimal overhead), the RPM values are:

- Call: approximately 1.59 dollars per minute  
- Email: approximately 97.1 dollars per minute  
- Email + Call: approximately 18.4 dollars per minute  

These values reveal that Email is by far the most efficient method in terms of revenue generated per minute of effort, due to its automated nature and near-zero marginal cost. Email + Call, while requiring more time than Email alone, still produces strong efficiency given its high revenue uplift. Call-only is the least efficient by a wide margin, producing low revenue while consuming the greatest amount of salesperson time.

### Interpreting the Metrics

ARC identifies Email + Call as the most productive method in terms of customer revenue. RPM highlights that Email is the most efficient method due to its negligible time cost. The combination of these findings indicates that Email + Call should be applied selectively to customers who warrant the additional effort, while Email remains the best method for broad, low-cost outreach. Call-only delivers neither strong revenue nor efficiency and therefore should be minimized.


Using effort assumptions of 30 minutes for Call, 10 minutes for Email + Call, and 1 minute for Email (to represent minimal overhead), the RPM values are:

- Call: approximately 1.59 dollars per minute  
- Email: approximately 97.1 dollars per minute  
- Email + Call: approximately 18.4 dollars per minute  

These values reveal that Email is by far the most efficient method in terms of revenue generated per minute of effort, due to its automated nature and near-zero marginal cost. Email + Call, while requiring more time than Email alone, still produces strong efficiency given its high revenue uplift. Call-only is the least efficient by a wide margin, producing low revenue while consuming the greatest amount of salesperson time.

---

## Final Summary and Recommendations

The dataset required several cleaning steps, including standardizing sales methods, removing invalid customer tenure values, and excluding rows where revenue was missing despite positive unit sales. After validation, the cleaned dataset produced clear and consistent patterns.

Revenue was right-skewed overall, and the comparative visuals showed that Email + Call delivered the highest revenue per customer and demonstrated the strongest growth across the launch period. Email generated solid revenue with very wide reach and negligible cost. Call-only performed the poorest while requiring the most time, suggesting it is not an efficient method for this product line.

A key insight from the analysis is that the current Email method includes two emails spaced several weeks apart. The results suggest that replacing the second email with a short follow-up call would significantly increase revenue. The Email + Call method, which uses this combination of automated and personal outreach, produces nearly twice the revenue of Email alone. Meanwhile, the Call-only method, which involves a lengthy phone call without prior email, underperforms both alternatives. This demonstrates that the initial email effectively prepares customers, and the short follow-up call meaningfully strengthens engagement.

Based on these findings, the Email + Call method should be prioritized for customers who show early signs of engagement or high potential. Email-only should continue to be used for broad, low-cost outreach across the entire customer base. The Call-only method appears inefficient and should be used sparingly or redesigned. Monitoring ARC across future campaigns will enable the sales team to optimize effort allocation and focus on the approaches most effective at driving revenue.
