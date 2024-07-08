Game of Thrones SQL Database Project

Overview
This project was completed as part of the Code First Girls SQL Certification course. The primary objective was to create a database from scratch using MySQL and Kaggle datasets. The project aimed to demonstrate proficiency in SQL through the creation and manipulation of database structures, including tables, views, joins, subqueries, stored procedures, functions, triggers, and events.

Project Details:
Course: Code First Girls SQL Certification
Tools Used: MySQL, Excel, Kaggle, Tableu
Project Theme: Game of Thrones

Datasets
The project utilized two Excel databases sourced from Kaggle, which were combined and joined to form a comprehensive Game of Thrones dataset.

Key Features
- Table Creation: Constructed various tables to organize the data efficiently.
- Joins: Implemented different types of joins to merge data from multiple tables.
- Views: Created views to simplify complex queries and present data in a meaningful way.
- Subqueries: Utilized subqueries to perform nested queries and enhance data retrieval.
- Stored Procedures: Developed stored procedures for reusable SQL code and encapsulating logic.
- Functions: Created user-defined functions to encapsulate complex logic and calculations.
- Triggers: Implemented triggers to automate actions based on certain events in the database.
- Events: Scheduled events to automate periodic tasks within the database.
- Data Type Changes: Modified data types to ensure optimal storage and data integrity.

Highlights
Fun and Engaging Theme: Leveraged my passion for Game of Thrones to create a fun and engaging project.
Data Insights: Discovered interesting facts such as the faction that lost the most men during the War of the Five Kings.

Getting Started
To run this project, you'll need MySQL installed on your machine. Follow these steps:

Clone the Repository:
bash
Copy code
git clone [repository-url]
cd [repository-directory]

Import the Data:
Import the provided SQL dump file to create the database and populate it with data.

sql
Copy code
mysql -u username -p database_name < got_database.sql

Explore the Database:
Use your preferred MySQL client (e.g., MySQL Workbench) to explore the tables, views, stored procedures, functions, triggers, and events.

Usage
Below are some example queries you can run to interact with the database:

Find the faction that lost the most men during the War of the Five Kings:
sql
Copy code
SELECT faction_name, SUM(losses) AS total_losses
FROM battle_data
WHERE war_name = 'War of the Five Kings'
GROUP BY faction_name
ORDER BY total_losses DESC
LIMIT 1;
View all battles involving House Stark:

sql
Copy code
CREATE VIEW stark_battles AS
SELECT * FROM battle_data
WHERE faction1 = 'House Stark' OR faction2 = 'House Stark';
Calculate the total number of battles fought:

sql
Copy code
SELECT COUNT(*) AS total_battles
FROM battle_data;
Contributing

This project is open to contributions. Feel free to fork the repository and submit pull requests with improvements or additional features.

License
This project is licensed under the MIT License. See the LICENSE file for more details.

Acknowledgements
Code First Girls: For providing the course and guidance.
Kaggle: For the Game of Thrones datasets.
MySQL: For the robust database management system.

Contact
For any questions or suggestions, please feel free to contact me at [ivanaloveraruiz@gmail.com].
