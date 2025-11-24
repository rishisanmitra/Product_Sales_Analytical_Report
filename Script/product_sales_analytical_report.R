library(caret)
library(tidyverse)

data <- read.csv("product_sales.csv")

summary(data)
colSums(is.na(data))

data %>% summarise(min_week = min(week, na.rm = TRUE),
                   max_week = max(week, na.rm = TRUE)) 		  #Check value of week > 6, since launch was 6 weeks ago

data %>% distinct(sales_method) 						            	  #Sanity check to see if there are more that 3 sales methods

data <- data %>%
  mutate(sales_method = case_when(
    sales_method %in% c('em + call', 'Email + Call') ~ 'Email + Call',
    sales_method %in% c('Email', 'email') ~ 'Email',
    sales_method == 'Call' ~ 'Call'
  ))														                            #Fix inconsistencies in the sales method

data %>% distinct(sales_method)								              #Check if the inconsistencies are fixed in the sales method

data %>% distinct(customer_id) %>% nrow() 					        #Check customer ID is unique or not for all 15000 records.

data %>% filter(is.na(revenue) & nb_sold != 0) %>% nrow() 	#Flag values where revenue is NA but the quantity is not 0

data <- data %>%
  filter(years_as_customer <= 41) 							            #Sanity check on years as a customer - current year (2025) 
                                                            #2 customers years > 41, not valid since current year(2025)

data %>% distinct(state)									                  #Checked for state name inconsistencies 

data %>% count(sales_method, name = "n_customers")

p1 <- ggplot(data, aes(sales_method)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Number of Customers by Sales Method",
       x = "Sales Method", y = "Count")						          #Plot number of customer grouped by sales method
p1
ggsave("01_customers_by_method.png", p1, width = 7, height = 5, dpi = 300) 		    	#Save the plot

data_rev <- data %>% filter(!is.na(revenue))				        #Filter the data with NA's removed in revenue

p2 <- ggplot(data_rev, aes(revenue)) +
  geom_histogram(bins=30, fill="steelblue") +
  labs(title="Overall Revenue Distribution", 
       x="Revenue", y="Count")								              #Plot overall revenue distribution using histogram
p2 
ggsave("02_revenue_distribution.png", p2, width = 7, height = 5, dpi = 300) 	    	#Save the plot

p3 <- ggplot(data_rev, aes(x = sales_method, y = revenue)) +
  geom_boxplot(fill="lightgray") +
  labs(title="Revenue by Sales Method",
       x = "Sales Method", y = "Revenue")					          #Plot revenue distribution grouped by sales method
p3
ggsave("03_revenue_by_method.png", p3, width = 7, height = 5, dpi = 300) 			      #Save the plot

rev_over_time <- data_rev %>%
  group_by(week, sales_method) %>%
  summarise(mean_revenue = mean(revenue), .groups = "drop")	#Create dataframe to capture revenue over time(weeks)

p4 <- ggplot(rev_over_time, aes(week, mean_revenue, color = sales_method)) +
  geom_line(size=1.2) +
  geom_point() +
  labs(title="Average Revenue Over Time by Method",
       x="Week Since Launch", y="Avg Revenue")				      #Plot the revenue over time(weeks)
p4
ggsave("04_revenue_over_time_by_method.png", p4, width = 7, height = 5, dpi = 300) 	#Save the plot

arc_table <- data_rev %>%
  group_by(sales_method) %>%
  summarise(avg_revenue = mean(revenue),
            median_revenue = median(revenue),
            n = n(), 
            total_revenue = avg_revenue * n)				
arc_table 													                        #See which sales method yields what avg&median revenue

time_effort <- tibble(
  sales_method = c("Email", "Email + Call", "Call"),
  minutes = c(1, 10, 30)
)															                              # Define time effort per method

rpm_table <- arc_table %>%
  left_join(time_effort, by = "sales_method") %>%
  mutate(
    rpm = avg_revenue / minutes
  )															                            # Join with time effort and compute RPM

rpm_table

data %>%
  group_by(sales_method) %>%
  summarise(
    avg_years = mean(years_as_customer),
    avg_visits = mean(nb_site_visits)
  )															                            #To check if any more diff between cust on sales_method
