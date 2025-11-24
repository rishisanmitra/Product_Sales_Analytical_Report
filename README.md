# Product Sales Analysis Report

## Data Validation and Cleaning

Before beginning the analysis, I reviewed every column in the dataset to confirm that the information was accurate and ready to use. The dataset includes 15,000 customer records covering the first six weeks of a new product launch.

The `week` column was the first variable I checked. Since it represents the week of purchase relative to launch, I confirmed that all values were between 1 and 6. Everything fell within the expected range, so no adjustments were needed.

When I looked at `sales_method`, I noticed several inconsistent labels such as "email", "Email", "Call", "em + call", and "Email + Call". I standardized these values into the three valid categories: Email, Call, and Email + Call. A distinct value check confirmed that the corrections worked as intended.

Next, I validated the `customer_id` field to make sure each row represented a unique customer interaction. There were 15,000 unique customer IDs for 15,000 rows, which confirmed that the dataset did not contain duplicates.

The `nb_sold` variable records how many units of the new product each customer bought. All values were within a reasonable range for a single purchase. However, I found 1,074 rows where customers had purchased products but the `revenue` column was missing. Since revenue should never be missing when products have been sold, these rows were flagged as data entry issues. I excluded them from any calculation or visualization involving revenue but kept them for non-revenue summaries.

The `revenue` column contained the exact same 1,074 missing entries. Because product pricing cannot be estimated from other variables, I did not attempt to impute these values. Instead, I created a cleaned revenue dataset that includes only the rows with valid revenue information.

I then checked `years_as_customer`. Pens and Printers was founded in 1984, so the longest possible customer relationship is roughly forty years. Two rows contained values of forty-seven and sixty-three years, which are not possible. I removed these rows, and the remaining values looked valid.

The `nb_site_visits` column showed how often customers visited the website in the last six months. Values ranged from twelve to forty-one visits, which seemed reasonable and did not require any adjustments.

Finally, I checked the `state` column. All fifty U.S. states were listed, spelled correctly and consistently formatted, so no cleaning was required.

---

## Exploratory Analysis

The analysis focuses on four key questions: how many customers were contacted using each sales method, how the revenue is distributed, how revenue changed over the six weeks, and which method appears to perform best. Each part of the analysis draws from the cleaned dataset and is supported by visual evidence in Figures 1 through 4.

### Customers by Sales Method

Email was the most widely used approach, with 7,465 customers receiving email outreach. Call reached 4,961 customers, and the Email + Call method reached 2,572 customers. Figure 1 shows this distribution. The broad reach of Email reflects its low effort and automated nature, while the call-based methods were used more selectively due to the additional time required for phone calls.

**Figure 1. Number of Customers by Sales Method**  
![Customers by Method](/Visuals/01_customers_by_method.png)

<br><br><br><br>

### Overall Revenue Distribution

Figure 2 shows the overall distribution of revenue values. The histogram reveals a clear right skew. Most customers generated between fifty and one hundred twenty dollars in revenue. There are also visible peaks around one hundred fifty and one hundred eighty dollars, which likely reflect different product combinations or pricing tiers. A smaller group of customers generated more than two hundred dollars, which creates a noticeable upper tail and highlights the presence of higher value transactions.

**Figure 2. Overall Revenue Distribution**  
![Revenue Distribution](/Visuals/02_revenue_distribution.png)

<br><br><br><br>

### Revenue by Sales Method

Figure 3 compares revenue results across the three sales methods. The Email + Call method stands out with a median revenue of about one hundred eighty-five dollars. Its revenue values also show the greatest spread, which suggests that this method is effective at reaching high-value customers. Email generates moderate revenue centered around ninety-six dollars and shows a more compact distribution. Call-only produces the lowest revenue, with most customers generating around forty-nine dollars and little variation around that value.

These differences illustrate that the method of outreach has a real impact on revenue. The combination of an email followed by a brief phone call seems to encourage stronger purchasing behavior.

**Figure 3. Revenue by Sales Method**  
![Revenue by Method](/Visuals/03_revenue_by_method.png)

<br><br><br><br>

### Revenue Trends Over Time

Figure 4 shows how revenue evolved over the six weeks following the launch. Average revenue increased over time for all three methods, although not at the same rate. Email + Call achieved the highest revenue each week and showed steady growth across the period, surpassing two hundred dollars by week six. Email also increased gradually, rising from around eighty-five dollars to more than one hundred twenty dollars. Call-only showed slight improvement but continued to lag.

These trends suggest that customers became more familiar with the new product line over time and that the brief follow-up call used in Email + Call helped sustain and grow engagement throughout the launch period.

**Figure 4. Average Revenue Over Time by Method**  
![Revenue Over Time](/Visuals/04_revenue_over_time_by_method.png)

<br><br><br><br>

### Additional Customer Characteristics

To determine whether customer characteristics contributed to the differences in revenue, I compared average tenure and website visits across the methods. The ranges were very similar. Customers in all three groups had roughly five years of history with the company and showed comparable numbers of recent website visits. Since these characteristics do not differ meaningfully across methods, the revenue differences appear to be driven primarily by the sales approach itself rather than by customer traits.

---

## Business Metrics

To evaluate the sales methods in a consistent way, I selected two metrics that reflect both revenue performance and the time required from the sales team. The first metric is Average Revenue per Customer (ARC), which measures the typical revenue generated from a customer reached through each method. The second metric is Revenue Per Minute of Sales Effort (RPM), which incorporates the time required for calls and helps capture how efficiently the sales team can generate revenue.

### Average Revenue per Customer (ARC)

ARC provides a clear view of the revenue generated from each customer. Based on the cleaned dataset, the Call method produced an average of about 47.6 dollars per customer. The Email method generated around 97.1 dollars. Email + Call produced the highest value at roughly 184 dollars per customer.

### Revenue Per Minute of Sales Effort (RPM)

ARC does not consider how much salesperson time is required. To capture efficiency, I calculated RPM using estimated time requirements: thirty minutes for Call, ten minutes for Email + Call, and one minute for Email to represent minimal effort.

$$
RPM = \frac{\text{Average Revenue Per Customer}}{\text{Minutes Of Sales Effort Per Customer}}
$$

Using these assumptions, RPM values were:

- Call: about 1.59 dollars per minute  
- Email: about 97.1 dollars per minute  
- Email + Call: about 18.4 dollars per minute  

These results show that Email is the most efficient method by a wide margin because it requires almost no time. Email + Call also performs well from an efficiency perspective, especially considering how much additional revenue it generates over Email alone. Call-only requires the most time and produces the lowest revenue.

### Interpreting the Metrics

Taken together, ARC and RPM offer a balanced view. Email + Call produces the strongest revenue results and should be used when the goal is to maximize the value of individual customer interactions. Email is highly efficient and well suited for broad outreach. Call-only provides neither strong revenue performance nor efficiency and should be handled carefully or rethought.

---

## Final Summary and Recommendations

Several issues needed addressing before analysis could begin, including inconsistent sales method labels, invalid customer tenure entries, and rows where revenue was missing despite units being sold. After these issues were corrected, the cleaned dataset revealed clear and consistent patterns.

Email + Call consistently delivered the highest average revenue and showed the strongest positive trend over time. Email reached the most customers and performed reliably at low cost. Call-only performed the weakest and required the most time, making it the least appealing option based on the data.

One insight from this analysis is that the current Email method sends an initial email followed by a second email several weeks later. The results suggest that replacing that second email with a short follow-up call would likely increase revenue. The Email + Call method, which uses exactly that approach, generated nearly twice the revenue of Email alone. Meanwhile, a long standalone call without an initial email produced the weakest results, showing that the initial email plays an important role in preparing the customer before a follow-up conversation.

Based on the results, Email + Call should be prioritized for customers who show interest or potential, since it generates strong revenue without requiring excessive time. Email should remain the primary method for wide-scale outreach where efficiency is essential. The Call-only method should be limited or redesigned. Monitoring ARC in future launches will help the company track performance and continue optimizing outreach strategies.