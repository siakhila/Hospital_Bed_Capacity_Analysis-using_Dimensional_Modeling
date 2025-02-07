# Hospital_Bed_Capacity_Analysis-using_Dimensional_Modeling

**Title:**  
Hospital Bed Capacity Analysis using Dimensional Modeling  

**Description:**  
This project focuses on analyzing hospital bed capacity across various healthcare facilities by creating a structured database using dimensional modeling. The database includes critical information related to licensed, census, and staffed beds within hospitals. The project utilizes a star schema with a fact table and dimension tables to facilitate efficient data querying and analysis. The goal is to derive insights into hospital capacity, staffing levels, and resource allocation to support improved decision-making in healthcare management.

**Key Features:**  
- **Star Schema Design:** Utilizes a star schema with a central fact table (`bed_fact`) and two dimension tables (`business` and `bed_type`) to organize and analyze hospital bed data.
- **SQL Database Implementation:** The database is implemented using SQL, with tables created and populated using CSV data.
- **Data Analysis:** SQL queries are used to analyze key metrics such as licensed beds, census beds, and staffed beds, with a focus on ICU and SICU beds.
- **ERD Visualization:** An Entity-Relationship Diagram (ERD) is created using ERDPlus to visualize the relationships between the tables in the database.

**Requirements:**  
- **Tools:** SQL, ERDPlus, MySQL Workbench.
- **Data Files:**  
  - `business.csv`  
  - `bed_type.csv`  
  - `bed_fact.csv`  
- **Documentation:**  
  - `Dimensional_Modelling.docx` (Project report)  
  - `Dimensional_Modelling.sql` (SQL script for database creation and queries)

**Results:**  
- **Top Hospitals by Licensed Beds:** Saint Marys Hospital ranked highest with 360 licensed ICU beds and 19 SICU beds.
- **Top Hospitals by Census Beds:** Saint Marys Hospital also led in census beds with 193 ICU beds and 12 SICU beds actively available.
- **Top Hospitals by Staffed Beds:** Saint Marys Hospital had the highest number of staffed beds, with 284 ICU beds and 16 SICU beds staffed by healthcare professionals.

**Conclusion:**  
This project successfully created a comprehensive database to analyze hospital bed capacity using dimensional modeling. The star schema design allowed for efficient data querying and analysis, providing valuable insights into hospital capacity and staffing levels. The project highlighted the importance of licensed, census, and staffed beds in managing hospital resources effectively. Future improvements could include advanced SQL techniques and data visualization tools for deeper analysis.

**Contributors:**  
- **Akhila Singaraju** 

