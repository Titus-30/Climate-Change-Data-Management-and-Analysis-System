# Climate Data Collection, Analysis, and Reporting
## **PHASE 2**
## Project Overview
### 
#### This project focuses on developing a comprehensive climate data management system to support data collection, validation, storage, analysis, and reporting. The aim is to provide actionable climate-related insights to assist policymakers, researchers, and environmental organizations in making data-driven decisions to mitigate climate change impacts.

## Objectives
#### 
- **Centralized Climate Data Repository**: Establish a secure, structured database to store climate data, such as greenhouse gas emissions, temperature variations, biodiversity, and mitigation activities.
- **Data Validation**: Implement structured validation processes to maintain data integrity and accuracy.
- **Data Analysis and Prediction**: Leverage PL/SQL procedures and analytical tools to identify trends and make climate predictions.
- **Customized Reporting**: Enable stakeholders to generate tailored reports by location, timeframe, or data type.
- **User-Friendly Interface**: Develop an accessible interface to support data querying, trend visualization, and report generation.
## Installation
#### 
1. **Clonehe the Repository**: Clone the GitHub repository using the command: `git clone <repository-url>`.
2. **Database Setup**: Configure the database with required tables and constraints. Sample SQL scripts are provided in the `/scripts` folder.
3. **Dependencies**: Install dependencies listed in the `requirements.txt` file by running `pip install -r requirements.txt`.
4. **Environment Configuration**: Set up environment variables and configurations as specified in the `.env.example` file.
## Usage
####
To start the application, run `python app.py` from the command line. This will initialize the user interface for accessing the climate data. Use the interface to input new data, run analysis reports, and visualize climate trends.

**Key Functions**:
- **Data Entry**: Add climate data records manually or via file upload.
- **Data Validation**: Check for data quality and integrity before committing entries.
- **Report Generation**: Generate reports based on specific filters, such as date range, geographic region, or emission levels.
## Project Scope
### Business Process
####
The climate data lifecycle supported in this system includes:
1. **Data Collection**
2. **Data Validation**
3. **Data Storage**
4. **Data Analysis and Forecasting**
5. **Report Generation**
6. **Decision-Making and Policy Development**
### MIS Relevance
#### 
This project applies MIS principles to manage climate data effectively. MIS ensures structured data handling, from secure storage to accessible data retrieval, supporting informed climate research and policy development.
### Expected Outcomes
####
- **Accurate Data Reporting**
- **Enhanced Decision-Making**
- **Improved Data Accessibility**
### Contributions and Task Tracking
####
Each team member’s contributions are tracked on GitHub. Project boards are updated with tasks and progress indicators. Screenshots, reports, and updates showcase work using tools like Draw.io and Lucidchart for model creation.
### Future Enhancements
####
- **Machine Learning Integration**: Apply machine learning models to improve trend prediction accuracy.
- **Enhanced Visualization**: Develop more advanced visual tools for stakeholders.
- **Automated Data Collection**: Implement automated data fetching from external climate sources.
### Tools and Technologies
####
- **Database**: PL/SQL for data analysis
- **Modeling Tools**: Draw.io, Lucidchart for diagrams
- **GitHub**: Project tracking and version control

## Screenshots
![image](https://github.com/user-attachments/assets/17d8600a-79f9-4c1d-97fb-e129675ee9ce)
![image](https://github.com/user-attachments/assets/9e0b4e9a-d80d-426f-9e4b-03c3b54a8756)
![image](https://github.com/user-attachments/assets/0a7a187e-7f9e-4f48-8c5d-a6db3ec61f61)


## **PHASE 3**
## Database Design
### Entities and Attributes
#### 
The database includes the following entities, each with key attributes and constraints:

**1.	Emission:**

o	Emission_id: Primary Key

o	Region_id: Foreign Key

o	Attributes: Source, Data_source

o	Constraints: NOT NULL on Emission_id and Region_id

**2.	Weather_Data:**

o	Weather_id: Primary Key

o	Region_id: Foreign Key

o	Attributes: Temperature, Precipitation, Humidity

o	Constraints: NOT NULL on Weather_id and Region_id

**3.	Region:**

o	Region_id: Primary Key

o	Attributes: Name, Population, Climate_zone

o	Constraints: NOT NULL on Region_id

**4.	Biodiversity_Impact:**

o	Impact_id: Primary Key

o	Species_id: Foreign Key

o	Region_id: Foreign Key

o	Attributes: Migration_changes

o	Constraints: NOT NULL on Impact_id, Species_id, and 
Region_id

**5.	Mitigation_Efforts:**

o	Effort_id: Primary Key

o	Region_id: Foreign Key

o	Attributes: Project_name, Fundings

o	Constraints: NOT NULL on Effort_id and Region_id

**6.	Researcher:**

o	Researcher_id: Primary Key

o	Attributes: Name, Role, Affiliation

o	Constraints: NOT NULL on Researcher_id

**7.	Species:**

o	Species_id: Primary Key

o	Attributes: Name, Conservation_status, Habitat

o	Constraints: NOT NULL on Species_id

**8.	Climate_Policy:**

o	Policy_id: Primary Key

o	Region_id: Foreign Key

o	Attributes: Policy_name, Status

o	Constraints: NOT NULL on Policy_id and Region_id
###
**Relationships**
#### 
•	Region has a one-to-many relationship with Weather_Data and Emission.

•	Biodiversity_Impact has a many-to-many relationship with Species.

•	Region has one-to-many relationships with Mitigation_Efforts and Climate_Policy.

## Constraints
####
•	Primary Keys: Unique identifiers for each record in an entity.

•	Foreign Keys: Link related records across entities to enforce relational integrity.

•	Data Integrity: NOT NULL constraints on essential attributes to ensure data completeness.
## Usage
#### 
This system is designed to handle large datasets, with tools for validating, storing, and retrieving climate-related information. It supports reporting on:

•	Climate trends and predictions

•	Biodiversity impacts across regions

•	Status and funding of mitigation efforts

•	Active and pending climate policies
## Tools and Technologies
####
•	Database: PL/SQL procedures and functions for analysis.

•	ER Diagram Tools: Draw.io, Lucidchart for designing data relationships.

•	GitHub: Project tracking and version control.
## Contributing
####
1.	Fork this repository.
2.	Create a feature branch (git checkout -b feature/YourFeature).
3.	Commit your changes (git commit -m 'Add new feature').
4.	Push to the branch (git push origin feature/YourFeature).
5.	Open a pull request.

## Screenshort
![image](https://github.com/user-attachments/assets/a4bfa391-485f-4c87-9093-3bbcc8ce6a48)
## Database Schema

The system consists of the following tables:

### Core Tables
- **Region**: Stores geographical region data with climate zones
- **Weather_Data**: Records temperature, precipitation, and humidity data
- **Emission**: Tracks emission data from various sources
- **Species**: Maintains information about different species and their conservation status
- **Biodiversity_Impact**: Records the impact of climate change on species migration

### Management Tables
- **Mitigation_Efforts**: Tracks climate change mitigation projects and their funding
- **Climate_Policy**: Manages climate-related policies and their implementation status
- **Researcher**: Stores information about researchers and experts

## Features

- **Data Validation**: Includes comprehensive check constraints for data integrity
  - Temperature range: -100°C to 100°C
  - Humidity range: 0% to 100%
  - Non-negative values for population and funding
  - Standardized conservation status categories
  - Validated policy status tracking

- **Data Source Tracking**: Supports multiple data collection methods
  - Satellite Imaging
  - Ground Monitoring
  - Remote Sensing

- **Relationship Management**: Implements foreign key constraints to maintain data consistency across tables

## Schema Details

### Region Table
```sql
CREATE TABLE Region (
    Region_id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Population INT CHECK (Population >= 0),
    Climate_zone VARCHAR(30) NOT NULL
);
```

### Weather_Data Table
```sql
CREATE TABLE Weather_Data (
    Weather_id INT PRIMARY KEY,
    Region_id INT NOT NULL,
    Temperature DECIMAL(5, 2) NOT NULL CHECK (Temperature BETWEEN -100 AND 100),
    Precipitation DECIMAL(5, 2) CHECK (Precipitation >= 0),
    Humidity DECIMAL(5, 2) CHECK (Humidity BETWEEN 0 AND 100),
    FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
);
```

### Species Table
```sql
CREATE TABLE Species (
    Species_id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Conservation_status VARCHAR(20) CHECK (Conservation_status IN ('Endangered', 'Vulnerable', 'Least Concern')),
    Habitat VARCHAR(50)
);
```

## Sample Data

The system comes with sample data including:
- Three species (Amazon Parrot, Polar Bear, Sahara Gazelle)
- Three mitigation projects with different funding levels
- Three researchers from different organizations
- Three climate policies in various implementation stages

## Prerequisites

- Oracle Database (The system uses Oracle-specific SQL syntax)
- Sufficient database privileges to create tables and constraints

## Installation

1. Execute the table creation scripts in the following order:
   - Region
   - Species
   - Weather_Data
   - Emission
   - Biodiversity_Impact
   - Mitigation_Efforts
   - Researcher
   - Climate_Policy

2. Run the sample data insertion scripts if you want to populate the database with example data.

## Usage Examples

### Track Species Migration
```sql
SELECT s.Name, s.Conservation_status, bi.Migration_changes
FROM Species s
JOIN Biodiversity_Impact bi ON s.Species_id = bi.Species_id;
```

### Monitor Mitigation Efforts
```sql
SELECT me.Project_name, me.Fundings, r.Name as Region
FROM Mitigation_Efforts me
JOIN Region r ON me.Region_id = r.Region_id;
```
## **PHASE 4,5 and 6**
## 🗂️ Database Creation Process

### 1. Pluggable Database Creation
```sql
CREATE PLUGGABLE DATABASE tuesday_hawks_climateChangeDataSystem
  ADMIN USER tuesday_hawks IDENTIFIED BY hawks
  ROLES = (DBA)
  FILE_NAME_CONVERT = ('C:\app\PC\product\21c\oradata\XE\pdbseed', 
                       'C:\app\PC\product\21c\oradata\XE\tuesday_hawks_climateChangeDataSystem')
  DEFAULT TABLESPACE users
  DATAFILE 'C:\app\PC\product\21c\oradata\XE\tuesday_hawks_climateChangeDataSystem\users01.dbf' SIZE 250M AUTOEXTEND ON;
```
**Description**: 
- Creates a new Pluggable Database (PDB) named `tuesday_hawks_climateChangeDataSystem`
- Sets up an admin user with specific credentials
- Defines file conversion paths for database storage
- Establishes a default tablespace
- Creates a data file with 250MB initial size and auto-extension

![Pluggable Database Creation](images/pluggable_db_creation.png)

### 2. Container Management
```sql
ALTER SESSION SET CONTAINER = CDB$ROOT;
SELECT pdb_name, status FROM dba_pdbs;
ALTER PLUGGABLE DATABASE tuesday_hawks_climateChangeDataSystem OPEN;
```
**Description**:
- Switches to the Root Container
- Checks the status of Pluggable Databases
- Opens the newly created database

## 🏗️ Database Schema Design

### Table Creation Process

#### 2.1 Region Table
```sql
CREATE TABLE Region (
    Region_id NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Population NUMBER,
    Climate_zone VARCHAR2(50)
);
```
**Purpose**: 
- Stores geographical region information
- Primary key: `Region_id`
- Tracks region name, population, and climate zone

#### 2.2 Emission Table
```sql
CREATE TABLE Emission (
    Emission_id NUMBER PRIMARY KEY,
    Region_id NUMBER REFERENCES Region(Region_id),
    Source VARCHAR2(100),
    Data_source VARCHAR2(100)
);
```
**Purpose**:
- Tracks emissions data for each region
- Foreign key link to Region table
- Captures emission sources and data collection methods

#### 2.3 Weather Data Table
```sql
CREATE TABLE Weather_Data (
    Weather_id NUMBER PRIMARY KEY,
    Region_id NUMBER REFERENCES Region(Region_id),
    Temperature NUMBER,
    Precipitation NUMBER,
    Humidity NUMBER
);
```
**Purpose**:
- Stores meteorological information
- Links to specific regions
- Tracks temperature, precipitation, and humidity

#### 2.4 Species Table
```sql
CREATE TABLE Species (
    Species_id NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Conservation_status VARCHAR2(50),
    Habitat VARCHAR2(100)
);
```
**Purpose**:
- Maintains species information
- Tracks conservation status and primary habitat

#### 2.5 Biodiversity Impact Table
```sql
CREATE TABLE Biodiversity_Impact (
    Impact_id NUMBER PRIMARY KEY,
    Species_id NUMBER REFERENCES Species(Species_id),
    Region_id NUMBER REFERENCES Region(Region_id),
    Migration_changes VARCHAR2(200)
);
```
**Purpose**:
- Tracks climate change impacts on species
- Links species and regions
- Documents migration pattern changes

#### 2.6 Mitigation Efforts Table
```sql
CREATE TABLE Mitigation_Efforts (
    Effort_id NUMBER PRIMARY KEY,
    Region_id NUMBER REFERENCES Region(Region_id),
    Project_name VARCHAR2(100),
    Fundings NUMBER,
    Date_of_implementation DATE
);
```
**Purpose**:
- Records climate change mitigation projects
- Links to specific regions
- Tracks project funding and implementation date

#### 2.7 Climate Policy Table
```sql
CREATE TABLE Climate_Policy (
    Policy_id NUMBER PRIMARY KEY,
    Policy_name VARCHAR2(100),
    Region_id NUMBER REFERENCES Region(Region_id),
    Status VARCHAR2(50)
);
```
**Purpose**:
- Stores information about climate-related policies
- Links policies to specific regions
- Tracks policy status

  ## 🖥️ Oracle Enterprise Manager (OEM) Overview

### What is Oracle Enterprise Manager?
Oracle Enterprise Manager (OEM) is a comprehensive management platform for Oracle databases, providing a unified console for monitoring, managing, and administering database environments.

### Key Features in Database Management

#### 1. Comprehensive Monitoring
- Real-time performance tracking
- System health dashboards
- Resource utilization metrics
- Proactive alert systems

#### 2. Performance Optimization
- SQL performance analysis
- Automatic diagnostic and tuning recommendations
- Detailed query execution plans
- Memory and storage optimization insights

#### 3. Security Management
- User access control
- Patch management
- Security vulnerability scanning
- Compliance monitoring

#### 4. Backup and Recovery
- Automated backup scheduling
- Point-in-time recovery tools
- Disaster recovery planning
- Data protection strategies

### OEM Functionality for Our Climate Change Database

#### Database Monitoring
- Track `tuesday_hawks_climateChangeDataSystem` performance
- Monitor resource consumption
- Set up custom alerts for critical metrics

#### Performance Tuning
- Analyze query performance on:
  - Region table joins
  - Emission source aggregations
  - Weather data correlations

#### Security Configuration
- Manage `tuesday_hawks` admin user
- Configure role-based access
- Implement data protection policies

### Accessing OEM
1. Launch Oracle Enterprise Manager
2. Connect using database credentials
3. Navigate to Pluggable Database section
4. Select `tuesday_hawks_climateChangeDataSystem`

### Recommended OEM Dashboards
- Performance Home
- Database Home
- Targets Overview
- SQL Performance Analyzer

### Best Practices
- Regularly review performance metrics
- Set up proactive monitoring alerts
- Periodically optimize database configuration
- Maintain comprehensive backup strategies

## Benefits for Climate Research Database
- Ensure data integrity
- Optimize query performance
- Maintain robust security
- Streamline database management

![image](https://github.com/user-attachments/assets/5ce7e071-cdb0-4cc8-b17e-777d05cb5680)


## 📊 Data Manipulation Examples

### Inserting Data
```sql
-- Insert into Region
INSERT INTO Region (Region_id, Name, Population, Climate_zone)
VALUES (1, 'Region_1', 120000, 'Tropical');

-- Insert into Weather Data
INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) 
VALUES (1, 1, 25.5, 50, 70);
```


### Weather Data Table
```sql
INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) VALUES 
(1, 1, 25.5, 50, 70),
(2, 2, 22.0, 55, 65),
(3, 3, 27.3, 40, 60),
(4, 4, -5.0, 20, 80),
(5, 5, 18.0, 60, 75),
(6, 6, 30.0, 45, 55);
```

### Mitigation Efforts Table
```sql
INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings) VALUES 
(1, 1, 'Project A', 500000),
(2, 2, 'Project B', 750000),
(3, 3, 'Project C', 600000),
(4, 4, 'Project D', 700000),
(5, 5, 'Project E', 800000),
(6, 6, 'Project F', 650000);
```

### Researcher Table
```sql
INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation) VALUES 
(1, 'Alice', 'Data Analyst', 'Organization A'),
(2, 'Bob', 'Climate Scientist', 'Organization B'),
(3, 'Charlie', 'Policy Advisor', 'Organization C'),
(4, 'Diana', 'Data Scientist', 'Organization D'),
(5, 'Edward', 'Research Assistant', 'Organization E'),
(6, 'Fiona', 'Environmental Engineer', 'Organization F');
```

### Species Table
```sql
INSERT INTO Species (Species_id, Name, Conservation_status, Habitat) VALUES 
(1, 'Species A', 'Endangered', 'Forest'),
(2, 'Species B', 'Vulnerable', 'Grassland'),
(3, 'Species C', 'Least Concern', 'Wetlands'),
(4, 'Species D', 'Critically Endangered', 'Desert'),
(5, 'Species E', 'Near Threatened', 'Mountain'),
(6, 'Species F', 'Endangered', 'Ocean');
```

### Climate Policy Table
```sql
INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status) VALUES 
(1, 'Policy A', 1, 'Active'),
(2, 'Policy B', 2, 'Under Review'),
(3, 'Policy C', 3, 'Active'),
(4, 'Policy D', 4, 'Inactive'),
(5, 'Policy E', 5, 'Under Review'),
(6, 'Policy F', 6, 'Active');
```

### Biodiversity Impact Table
```sql
INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes) VALUES 
(1, 1, 1, 'Increased Migration'),
(2, 2, 2, 'Decreased Migration'),
(3, 3, 3, 'No Change'),
(4, 4, 4, 'Changed Patterns'),
(5, 5, 5, 'Increased Migration'),
(6, 6, 6, 'Decreased Migration');
```

### Emission Table
```sql
INSERT INTO Emission (Emission_id, Region_id, Source, Data_source) VALUES 
(1, 1, 'Industry', 'Satellite'),
(2, 2, 'Transportation', 'Ground Measurement'),
(3, 3, 'Agriculture', 'Satellite'),
(4, 4, 'Energy', 'Ground Measurement'),
(5, 5, 'Industry', 'Drone'),
(6, 6, 'Residential', 'Satellite');
```

## 📈 Sample Queries and Their Results

### Region Population Query
```sql
SELECT Name, Population FROM Region;
```
**Result**:
- Region_1: 580,000,000
- Region_2: 150,000
- Region_3: 180,000
- Region_4: 200,000
- Region_5: 140,000
- Region_6: 160,000

### Emissions Sources Query
```sql
SELECT Source, Data_source FROM Emission WHERE Region_id = 1;
```
**Result**:
- Source: Industry
- Data Source: Satellite

### Weather Data with Regions
```sql
SELECT Temperature, Precipitation, Humidity, R.Name AS Region
FROM Weather_Data W
JOIN Region R ON W.Region_id = R.Region_id;
```
**Result**:
- Temperature: 25.5, Precipitation: 50, Humidity: 70 (Region_1)
- Temperature: 22.0, Precipitation: 55, Humidity: 65 (Region_2)
- Temperature: -5.0, Precipitation: 20, Humidity: 80 (Region_4)
- Temperature: 18.0, Precipitation: 60, Humidity: 75 (Region_5)
- Temperature: 30.0, Precipitation: 45, Humidity: 55 (Region_6)

### Endangered Species
```sql
SELECT Name, Conservation_status
FROM Species
WHERE Conservation_status = 'Endangered';
```
**Result**:
- Species A
- Species F

## 🔍 Additional Database Insights

### Emissions by Source
```sql
SELECT Source, SUM(Emission_id) AS Total_Emissions
FROM Emission
GROUP BY Source;
```
**Result**:
- Industry: 6
- Transportation: 2
- Agriculture: 3
- Energy: 4
- Residential: 6

### Species Conservation Status
```sql
SELECT Conservation_status, COUNT(*) AS Species_Count
FROM Species
GROUP BY Conservation_status;
```
**Result**:
- Endangered: 2
- Vulnerable: 1
- Least Concern: 1
- Critically Endangered: 1
- Near Threatened: 1

## 🚀 Database Performance Optimization
- Created an index on `Region_id` in the Emission table
- Implemented foreign key relationships
- Structured for efficient querying and data retrieval


### Updating Data
```sql
-- Update population for a region
UPDATE Region
SET Population = 580000000
WHERE Region_id = 1;

-- Update conservation status
UPDATE Species
SET Conservation_status = 'Critically Endangered'
WHERE Species_id = 301;
```
**Description**:
- Shows how to update existing records
- Modifies data based on specific conditions

### Querying Data
```sql
-- Select regions and populations
SELECT Name, Population FROM Region;

-- Join Weather Data with Regions
SELECT W.Temperature, W.Precipitation, W.Humidity, R.Name AS Region
FROM Weather_Data W
JOIN Region R ON W.Region_id = R.Region_id;
```
**Description**:
- Demonstrates simple SELECT queries
- Shows how to perform JOIN operations between tables

## 🔍 Advanced Database Operations

### Transaction Management
```sql
BEGIN
    SAVEPOINT before_update;
    
    UPDATE Region
    SET Population = Population + 100000
    WHERE Region_id = 1;
    
    UPDATE Mitigation_Efforts
    SET Fundings = Fundings + 500000
    WHERE Effort_id = 501;
    
    ROLLBACK TO before_update;
    COMMIT;
END;
```
**Description**:
- Demonstrates transaction control
- Uses SAVEPOINT to create a rollback point
- Shows how to manage complex database updates

## 🚀 Key Features
- Comprehensive climate change data tracking
- Relational database design
- Complex querying capabilities
- Scalable schema for environmental research

## 📝 Setup Instructions
1. Ensure Oracle Database 21c is installed
2. Create the pluggable database
3. Run the table creation scripts
4. Insert initial data
5. Verify data integrity

## 🤝 Contributing
-we created Fork the repository
- we Created your feature branch
- we Committed our changes
- we Pushed to the branch
- weCreated a new Pull Request

## **PHASE 7**
## Overview
This project implements a robust PL/SQL-based system for managing climate-related data, focusing on data integrity, secure tracking, and scalable processing of climate information.

## Problem Statement
The system addresses critical needs in climate data management, including:
- Automated enforcement of data integrity
- Secure tracking of user activities
- Modular functions for scalable processing
- Comprehensive auditing of critical changes

## Detailed Code Implementations

### 1. Triggers

#### 1.1 Simple Update Logging Trigger
```sql
CREATE OR REPLACE TRIGGER log_data_updates
AFTER UPDATE ON climate_data
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, old_value, new_value, updated_by, update_time)
    VALUES ('climate_data', :OLD.data_value, :NEW.data_value, USER, SYSDATE);
END;
```
**Description:** This trigger automatically logs any updates made to the `climate_data` table. It captures:
- The table name being modified
- Old and new values of the updated data
- User who made the update
- Timestamp of the update

#### 1.2 Compound Trigger for Bulk Update Restriction
```sql
CREATE OR REPLACE TRIGGER restrict_bulk_updates
FOR UPDATE ON climate_data
COMPOUND TRIGGER
    row_count INTEGER := 0;

    BEFORE EACH ROW IS
    BEGIN
        row_count := row_count + 1;
        IF row_count > 5 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Bulk updates exceeding 5 rows are not allowed!');
        END IF;
    END BEFORE EACH ROW;

END restrict_bulk_updates;
```
**Description:** This compound trigger prevents users from updating more than five rows simultaneously in the `climate_data` table, helping to:
- Control the scope of data modifications
- Prevent accidental mass updates
- Ensure more controlled data management

### 2. Cursor Usage for Regional Climate Reporting
```sql
DECLARE
    CURSOR climate_cursor IS
        SELECT region, AVG(temperature) AS avg_temp
        FROM climate_data
        GROUP BY region;
    region_data climate_cursor%ROWTYPE;
BEGIN
    OPEN climate_cursor;
    LOOP
        FETCH climate_cursor INTO region_data;
        EXIT WHEN climate_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Region: ' || region_data.region || ' - Avg Temp: ' || region_data.avg_temp);
    END LOOP;
    CLOSE climate_cursor;
END;
```
**Description:** This cursor-based block:
- Fetches average temperatures grouped by region
- Processes records row by row
- Outputs detailed regional temperature information

### 3. Attributes and Functions

#### 3.1 %TYPE Attribute Example
```sql
DECLARE
    temp climate_data.temperature%TYPE;
BEGIN
    SELECT temperature INTO temp FROM climate_data WHERE id = 1;
    DBMS_OUTPUT.PUT_LINE('Temperature: ' || temp);
END;
```
**Description:** Uses the `%TYPE` attribute to:
- Dynamically inherit the data type of the `temperature` column
- Ensure type consistency with the source table

#### 3.2 %ROWTYPE Attribute Example
```sql
DECLARE
    record climate_data%ROWTYPE;
BEGIN
    SELECT * INTO record FROM climate_data WHERE id = 1;
    DBMS_OUTPUT.PUT_LINE('Region: ' || record.region || ', Temp: ' || record.temperature);
END;
```
**Description:** Uses the `%ROWTYPE` attribute to:
- Create a record variable that matches the entire structure of the `climate_data` table
- Easily retrieve and work with full row data

#### 3.3 Temperature Trend Calculation Function
```sql
CREATE OR REPLACE FUNCTION calculate_trend(year IN NUMBER)
RETURN NUMBER IS
    avg_temp NUMBER;
BEGIN
    SELECT AVG(temperature) INTO avg_temp 
    FROM climate_data 
    WHERE EXTRACT(YEAR FROM date_collected) = year;
    RETURN avg_temp;
END;
```
**Description:** A function that:
- Calculates average temperature for a specific year
- Uses `EXTRACT` to filter data by year
- Returns the computed average temperature

### 4. Package Development
```sql
CREATE OR REPLACE PACKAGE ClimateAuditPkg IS
    PROCEDURE log_changes(table_name VARCHAR2, user_action VARCHAR2);
    FUNCTION calculate_trend(year IN NUMBER) RETURN NUMBER;
END ClimateAuditPkg;
/

CREATE OR REPLACE PACKAGE BODY ClimateAuditPkg IS
    PROCEDURE log_changes(table_name VARCHAR2, user_action VARCHAR2) IS
    BEGIN
        INSERT INTO audit_log (table_name, action, performed_by, action_time)
        VALUES (table_name, user_action, USER, SYSDATE);
    END;

    FUNCTION calculate_trend(year IN NUMBER) RETURN NUMBER IS
        avg_temp NUMBER;
    BEGIN
        SELECT AVG(temperature) INTO avg_temp 
        FROM climate_data 
        WHERE EXTRACT(YEAR FROM date_collected) = year;
        RETURN avg_temp;
    END;
END ClimateAuditPkg;
```
**Description:** A package that:
- Encapsulates related functions and procedures
- Provides a `log_changes` procedure for auditing
- Includes a `calculate_trend` function for temperature analysis

### 5. Auditing and Access Control

#### 5.1 Deletion Logging Trigger
```sql
CREATE OR REPLACE TRIGGER log_deletions
AFTER DELETE ON climate_data
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, action, performed_by, action_time)
    VALUES ('climate_data', 'DELETE', USER, SYSDATE);
END;
```
**Description:** Logs all deletion activities on the `climate_data` table

#### 5.2 Admin Access Restriction
```sql
CREATE OR REPLACE FUNCTION is_admin_user
RETURN BOOLEAN IS
BEGIN
    IF USER IN ('ADMIN') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;

CREATE OR REPLACE TRIGGER restrict_access
BEFORE INSERT OR UPDATE OR DELETE ON climate_data
FOR EACH ROW
BEGIN
    IF NOT is_admin_user() THEN
        RAISE_APPLICATION_ERROR(-20002, 'Only admins can modify data!');
    END IF;
END;
```
**Description:** Implements strict access control:
- Checks if the current user is an admin
- Prevents non-admin users from modifying climate data

## Limitations and Considerations
- Performance overhead with extensive trigger usage
- Potential complexity in debugging multiple triggers
- Scalability challenges with large datasets
- Strict user access controls

## Installation Requirements
- Oracle Database
- PL/SQL Developer or compatible SQL client
- Access to climate_data and audit_log tables

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License
Distributed under the MIT License. See `LICENSE` for more information.



## 👥 Contributor

###   Titus Irimaso Mucyo







