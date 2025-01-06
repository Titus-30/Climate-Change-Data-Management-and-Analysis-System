--Pluggable database creation
CREATE PLUGGABLE DATABASE tuesday_hawks_climateChangeDataSystem
  ADMIN USER tuesday_hawks IDENTIFIED BY hawks
  ROLES = (DBA)
  FILE_NAME_CONVERT = ('C:\app\PC\product\21c\oradata\XE\pdbseed', 
                       'C:\app\PC\product\21c\oradata\XE\tuesday_hawks_climateChangeDataSystem')
  DEFAULT TABLESPACE users
  DATAFILE 'C:\app\PC\product\21c\oradata\XE\tuesday_hawks_climateChangeDataSystem\users01.dbf' SIZE 250M AUTOEXTEND ON;
  
  Pluggable database created

--Switch to the Root Container:
ALTER SESSION SET CONTAINER = CDB$ROOT;
--Check PDB Status:
SELECT pdb_name, status FROM dba_pdbs;
--Open the PDB:
ALTER PLUGGABLE DATABASE tuesday_hawks_climateChangeDataSystem OPEN;
-- Creating the Region table
CREATE TABLE Region (
    Region_id NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Population NUMBER,
    Climate_zone VARCHAR2(50)
);
table region created

-- Creating the Emission table with a foreign key reference to Region
CREATE TABLE Emission (
    Emission_id NUMBER PRIMARY KEY,
    Region_id NUMBER REFERENCES Region(Region_id),
    Source VARCHAR2(100),
    Data_source VARCHAR2(100)
);
table Emission created

-- Creating the Weather_Data table with a foreign key reference to Region
CREATE TABLE Weather_Data (
    Weather_id NUMBER PRIMARY KEY,
    Region_id NUMBER REFERENCES Region(Region_id),
    Temperature NUMBER,
    Precipitation NUMBER,
    Humidity NUMBER
);
Table weather created

-- Creating the Species table
CREATE TABLE Species (
    Species_id NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Conservation_status VARCHAR2(50),
    Habitat VARCHAR2(100)
);
table species created


-- Creating the Biodiversity_Impact table with foreign keys to Region and Species
CREATE TABLE Biodiversity_Impact (
    Impact_id NUMBER PRIMARY KEY,
    Species_id NUMBER REFERENCES Species(Species_id),
    Region_id NUMBER REFERENCES Region(Region_id),
    Migration_changes VARCHAR2(200)
);
table Biodiversity_Impact created

-- Creating the Mitigation_Efforts table with a foreign key reference to Region
CREATE TABLE Mitigation_Efforts (
    Effort_id NUMBER PRIMARY KEY,
    Region_id NUMBER REFERENCES Region(Region_id),
    Project_name VARCHAR2(100),
    Fundings NUMBER
);
table Mitigation_Efforts created

-- Creating the Climate_Policy table with a foreign key reference to Region
CREATE TABLE Climate_Policy (
    Policy_id NUMBER PRIMARY KEY,
    Policy_name VARCHAR2(100),
    Region_id NUMBER REFERENCES Region(Region_id),
    Status VARCHAR2(50)
);
table Climate_Policy created

-- Creating the Researcher table
CREATE TABLE Researcher (
    Researcher_id NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Role VARCHAR2(50),
    Affiliation VARCHAR2(100)
);
table Researcher created

SQL> -- Adding a new column for "Date_of_implementation" in the Mitigation_Efforts table
SQL> ALTER TABLE Mitigation_Efforts
  2  ADD Date_of_implementation DATE;

Table altered.

SQL>
SQL> -- Adding an index on the "Region_id" column in the Emission table for faster queries
SQL> CREATE INDEX idx_region_id_emission
  2  ON Emission(Region_id);

Index created.

-- insert into region
SQL> INSERT INTO Region (Region_id, Name, Population, Climate_zone) VALUES (1, 'Region_1', 120000, 'Tropical');

1 row created.

SQL> INSERT INTO Region (Region_id, Name, Population, Climate_zone) VALUES (2, 'Region_2', 150000, 'Arid');

1 row created.

SQL> INSERT INTO Region (Region_id, Name, Population, Climate_zone) VALUES (3, 'Region_3', 180000, 'Temperate');

1 row created.

SQL> INSERT INTO Region (Region_id, Name, Population, Climate_zone) VALUES (4, 'Region_4', 200000, 'Polar');

1 row created.

SQL> INSERT INTO Region (Region_id, Name, Population, Climate_zone) VALUES (5, 'Region_5', 140000, 'Mediterranean');

1 row created.

SQL> INSERT INTO Region (Region_id, Name, Population, Climate_zone) VALUES (6, 'Region_6', 160000, 'Savanna');

1 row created.

--insert into weather_data

SQL> INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) VALUES (1, 1, 25.5, 50, 70);


1 row created.

SQL> INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) VALUES (2, 2, 22.0, 55, 65);


1 row created.

SQL> INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) VALUES (3, 3, 27.3, 40, 60);


1 row created.

SQL> INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) VALUES (4, 4, -5.0, 20, 80);


1 row created.

SQL> INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) VALUES (5, 5, 18.0, 60, 75);


1 row created.

SQL> INSERT INTO Weather_Data (Weather_id, Region_id, Temperature, Precipitation, Humidity) VALUES (6, 6, 30.0, 45, 55);


1 row created.

--insert into mitigation_efforts

SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings) VALUES (1, 1, 'Project A', 500000);

1 row created.

SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings) VALUES (2, 2, 'Project B', 750000);

1 row created.

SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings) VALUES (3, 3, 'Project C', 600000);

1 row created.

SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings) VALUES (4, 4, 'Project D', 700000);

1 row created.

SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings) VALUES (5, 5, 'Project E', 800000);

1 row created.

SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings) VALUES (6, 6, 'Project F', 650000);

1 row created.

--insert into researcher

SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation) VALUES (1, 'Alice', 'Data Analyst', 'Organization A');

1 row created.

SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation) VALUES (2, 'Bob', 'Climate Scientist', 'Organization B');

1 row created.

SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation) VALUES (3, 'Charlie', 'Policy Advisor', 'Organization C');

1 row created.

SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation) VALUES (4, 'Diana', 'Data Scientist', 'Organization D');

1 row created.

SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation) VALUES (5, 'Edward', 'Research Assistant', 'Organization E');

1 row created.

SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation) VALUES (6, 'Fiona', 'Environmental Engineer', 'Organization F');

1 row created.

--insert into species

SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat) VALUES (1, 'Species A', 'Endangered', 'Forest');

1 row created.

SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat) VALUES (2, 'Species B', 'Vulnerable', 'Grassland');

1 row created.

SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat) VALUES (3, 'Species C', 'Least Concern', 'Wetlands');

1 row created.

SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat) VALUES (4, 'Species D', 'Critically Endangered', 'Desert');

1 row created.

SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat) VALUES (5, 'Species E', 'Near Threatened', 'Mountain');

1 row created.

SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat) VALUES (6, 'Species F', 'Endangered', 'Ocean');

1 row created.

--insert into climate policy

SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status) VALUES (1, 'Policy A', 1, 'Active');

1 row created.

SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status) VALUES (2, 'Policy B', 2, 'Under Review');

1 row created.

SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status) VALUES (3, 'Policy C', 3, 'Active');

1 row created.

SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status) VALUES (4, 'Policy D', 4, 'Inactive');

1 row created.

SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status) VALUES (5, 'Policy E', 5, 'Under Review');

1 row created.

SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status) VALUES (6, 'Policy F', 6, 'Active');

1 row created.

--insert into biodiversity_impact

SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes) VALUES (1, 1, 1, 'Increased Migration');

1 row created.

SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes) VALUES (2, 2, 2, 'Decreased Migration');

1 row created.

SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes) VALUES (3, 3, 3, 'No Change');

1 row created.

SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes) VALUES (4, 4, 4, 'Changed Patterns');

1 row created.

SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes) VALUES (5, 5, 5, 'Increased Migration');

1 row created.

SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes) VALUES (6, 6, 6, 'Decreased Migration');

1 row created.

-- insert into emission

SQL> INSERT INTO Emission (Emission_id, Region_id, Source, Data_source) VALUES (1, 1, 'Industry', 'Satellite');

1 row created.

SQL> INSERT INTO Emission (Emission_id, Region_id, Source, Data_source) VALUES (2, 2, 'Transportation', 'Ground Measurement');

1 row created.

SQL> INSERT INTO Emission (Emission_id, Region_id, Source, Data_source) VALUES (3, 3, 'Agriculture', 'Satellite');

1 row created.

SQL> INSERT INTO Emission (Emission_id, Region_id, Source, Data_source) VALUES (4, 4, 'Energy', 'Ground Measurement');

1 row created.

SQL> INSERT INTO Emission (Emission_id, Region_id, Source, Data_source) VALUES (5, 5, 'Industry', 'Drone');

1 row created.

SQL> INSERT INTO Emission (Emission_id, Region_id, Source, Data_source) VALUES (6, 6, 'Residential', 'Satellite');

1 row created.
SQL> -- Update population for North America
SQL> UPDATE Region
  2  SET Population = 580000000
  3  WHERE Region_id = 1;

1 row updated.

SQL>
SQL> -- Update the conservation status of the Polar Bear
SQL> UPDATE Species
  2  SET Conservation_status = 'Critically Endangered'
  3  WHERE Species_id = 301;

1 rows updated.
SQL> DELETE FROM Weather_Data WHERE Region_id = 3;

1 row deleted.

SQL> DELETE FROM Emission WHERE Region_id = 3;

1 row deleted.
SQL> -- Select all regions and their populations
SQL> SELECT Name, Population
  2  FROM Region;

NAME
--------------------------------------------------------------------------------
POPULATION
----------
Region_1
 580000000

Region_2
    150000

Region_3
    180000


NAME
--------------------------------------------------------------------------------
POPULATION
----------
Region_4
    200000

Region_5
    140000

Region_6
    160000


6 rows selected.

SQL>
SQL> -- Select emissions sources in a specific region
SQL> SELECT Source, Data_source
  2  FROM Emission
  3  WHERE Region_id = 1;

SOURCE
--------------------------------------------------------------------------------
DATA_SOURCE
--------------------------------------------------------------------------------
Industry
Satellite


SQL>
SQL> -- Select weather data for all regions
SQL> SELECT W.Temperature, W.Precipitation, W.Humidity, R.Name AS Region
  2  FROM Weather_Data W
  3  JOIN Region R ON W.Region_id = R.Region_id;

TEMPERATURE PRECIPITATION   HUMIDITY
----------- ------------- ----------
REGION
--------------------------------------------------------------------------------
       25.5            50         70
Region_1

         22            55         65
Region_2

       27.3            40         60
Region_3


TEMPERATURE PRECIPITATION   HUMIDITY
----------- ------------- ----------
REGION
--------------------------------------------------------------------------------
         -5            20         80
Region_4

         18            60         75
Region_5

         30            45         55
Region_6


6 rows selected.

SQL>
SQL> -- List species with endangered status
SQL> SELECT Name, Conservation_status
  2  FROM Species
  3  WHERE Conservation_status = 'Endangered';

NAME
--------------------------------------------------------------------------------
CONSERVATION_STATUS
--------------------------------------------------
Species A
Endangered

Species F
Endangered


SQL> -- Inner Join: Get emissions sources with region names
SQL> SELECT E.Source, R.Name AS Region
  2  FROM Emission E
  3  INNER JOIN Region R ON E.Region_id = R.Region_id;

SOURCE
--------------------------------------------------------------------------------
REGION
--------------------------------------------------------------------------------
Industry
Region_1

Transportation
Region_2

Agriculture
Region_3


SOURCE
--------------------------------------------------------------------------------
REGION
--------------------------------------------------------------------------------
Energy
Region_4

Industry
Region_5

Residential
Region_6


6 rows selected.
SQL> -- Left Outer Join: Get species and their migration changes (even if no migration data exists)
SQL> SELECT S.Name, B.Migration_changes
  2  FROM Species S
  3  LEFT OUTER JOIN Biodiversity_Impact B ON S.Species_id = B.Species_id;

NAME
--------------------------------------------------------------------------------
MIGRATION_CHANGES
--------------------------------------------------------------------------------
Species A
Increased Migration

Species B
Decreased Migration

Species C
No Change


NAME
--------------------------------------------------------------------------------
MIGRATION_CHANGES
--------------------------------------------------------------------------------
Species D
Changed Patterns

Species E
Increased Migration

Species F
Decreased Migration


6 rows selected.

SQL> -- Find the average temperature across all regions
SQL> SELECT AVG(Temperature) AS Avg_Temperature
  2  FROM Weather_Data;

AVG_TEMPERATURE
---------------
     19.6333333

SQL>
SQL> -- Find the total funding for mitigation efforts
SQL> SELECT SUM(Fundings) AS Total_Fundings
  2  FROM Mitigation_Efforts;

TOTAL_FUNDINGS
--------------
       4000000

SQL> -- Count the number of species in each conservation status
SQL> SELECT Conservation_status, COUNT(*) AS Species_Count
  2  FROM Species
  3  GROUP BY Conservation_status;

CONSERVATION_STATUS                                SPECIES_COUNT
-------------------------------------------------- -------------
Endangered                                                     2
Vulnerable                                                     1
Least Concern                                                  1
Critically Endangered                                          1
Near Threatened                                                1

SQL>
SQL> -- Get the total emissions by source
SQL> SELECT Source, SUM(Emission_id) AS Total_Emissions
  2  FROM Emission
  3  GROUP BY Source;

SOURCE
--------------------------------------------------------------------------------
TOTAL_EMISSIONS
---------------
Industry
              6

Transportation
              2

Agriculture
              3


SOURCE
--------------------------------------------------------------------------------
TOTAL_EMISSIONS
---------------
Energy
              4

Residential
              6


SQL> BEGIN
  2      SAVEPOINT before_update;
  3
  4      -- Update region population in the transaction
  5      UPDATE Region
  6      SET Population = Population + 100000
  7      WHERE Region_id = 1;
  8
  9      -- Update funding for a mitigation effort
 10      UPDATE Mitigation_Efforts
 11      SET Fundings = Fundings + 500000
 12      WHERE Effort_id = 501;
 13
 14      -- Rollback to savepoint if there's an issue
 15      ROLLBACK TO before_update;
 16
 17      -- Commit if all operations are correct
 18      COMMIT;
 19  END;
 20  /

PL/SQL procedure successfully completed.
