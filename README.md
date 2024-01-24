# sql-challenge

The purpose of this assignment is to examine company data in the form of .csv files using SQL. The data being analyzed is contained in 6 .csv files that are contained in the 'data' folder in this repository.

Schema.sql contains the table creation SQL code that the data from the .csv files will be imported into. Queries.sql contains the data engineering portion of the assignment, where the tables (with the data from the .csv files already imported) to answer questions about the data.

To run: The schema.sql file will need to be ran first to create all of the tables that will be used. Then, the data must be manually imported using the PostgreSQL import/export function in the order in which the tables are declared in the schema.sql file. Once all of the data is imported into the tables from the .csv files, you can then run the queries.sql file. Each query needs to be ran separately because only one table will show up at a time. 