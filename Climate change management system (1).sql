 CREATE TABLE Region (
  2      Region_id INT PRIMARY KEY,
  3      Name VARCHAR(50) NOT NULL,
  4      Population INT CHECK (Population >= 0),
  5      Climate_zone VARCHAR(30) NOT NULL
  6  );

Table created.
 CREATE TABLE Emission (
  2      Emission_id INT PRIMARY KEY,
  3      Region_id INT NOT NULL,
  4      Source VARCHAR(50) NOT NULL,
  5      Data_source VARCHAR(50),
  6      FOREIGN KEY (Region_id) REFERENCES Region(Region_id),
  7      CONSTRAINT chk_data_source CHECK (Data_source IN ('Satellite Imaging', 'Ground Monitoring', 'Remote Sensing'))
  8  );

Table created.

SQL> CREATE TABLE Weather_Data (
  2      Weather_id INT PRIMARY KEY,
  3      Region_id INT NOT NULL,
  4      Temperature DECIMAL(5, 2) NOT NULL CHECK (Temperature BETWEEN -100 AND 100),
  5      Precipitation DECIMAL(5, 2) CHECK (Precipitation >= 0),
  6      Humidity DECIMAL(5, 2) CHECK (Humidity BETWEEN 0 AND 100),
  7      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  8  );

Table created.

SQL> CREATE TABLE Biodiversity_Impact (
  2      Impact_id INT PRIMARY KEY,
  3      Species_id INT NOT NULL,
  4      Region_id INT NOT NULL,
  5      Migration_changes VARCHAR(100),
  6      FOREIGN KEY (Species_id) REFERENCES Species(Species_id),
  7      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  8  );
    FOREIGN KEY (Species_id) REFERENCES Species(Species_id),
                                        *
ERROR at line 6:
ORA-00942: table or view does not exist


SQL> CREATE TABLE Species (
  2      Species_id INT PRIMARY KEY,
  3      Name VARCHAR(50) NOT NULL,
  4      Conservation_status VARCHAR(20) CHECK (Conservation_status IN ('Endangered', 'Vulnerable', 'Least Concern')),
  5      Habitat VARCHAR(50)
  6  );

Table created.

SQL> CREATE TABLE Biodiversity_Impact (
  2      Impact_id INT PRIMARY KEY,
  3      Species_id INT NOT NULL,
  4      Region_id INT NOT NULL,
  5      Migration_changes VARCHAR(100),
  6      FOREIGN KEY (Species_id) REFERENCES Species(Species_id),
  7      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  8  );

Table created.

SQL> CREATE TABLE Mitigation_Efforts (
  2      Effort_id INT PRIMARY KEY,
  3      Region_id INT NOT NULL,
  4      Project_name VARCHAR(50) NOT NULL,
  5      Fundings DECIMAL(15, 2) CHECK (Fundings >= 0),
  6      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  7  );

Table created.

SQL> CREATE TABLE Researcher (
  2      Researcher_id INT PRIMARY KEY,
  3      Name VARCHAR(50) NOT NULL,
  4      Role VARCHAR(50) NOT NULL,
  5      Affiliation VARCHAR(100)
  6  );

Table created.

SQL> CREATE TABLE Climate_Policy (
  2      Policy_id INT PRIMARY KEY,
  3      Policy_name VARCHAR(50) NOT NULL,
  4      Region_id INT NOT NULL,
  5      Status VARCHAR(20) CHECK (Status IN ('Active', 'Under Review', 'Implemented')),
  6      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  7  );

Table created.
 CREATE TABLE Emission (
  2      Emission_id INT PRIMARY KEY,
  3      Region_id INT NOT NULL,
  4      Source VARCHAR(50) NOT NULL,
  5      Data_source VARCHAR(50),
  6      FOREIGN KEY (Region_id) REFERENCES Region(Region_id),
  7      CONSTRAINT chk_data_source CHECK (Data_source IN ('Satellite Imaging', 'Ground Monitoring', 'Remote Sensing'))
  8  );

Table created.

SQL> CREATE TABLE Weather_Data (
  2      Weather_id INT PRIMARY KEY,
  3      Region_id INT NOT NULL,
  4      Temperature DECIMAL(5, 2) NOT NULL CHECK (Temperature BETWEEN -100 AND 100),
  5      Precipitation DECIMAL(5, 2) CHECK (Precipitation >= 0),
  6      Humidity DECIMAL(5, 2) CHECK (Humidity BETWEEN 0 AND 100),
  7      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  8  );

Table created.

SQL> CREATE TABLE Biodiversity_Impact (
  2      Impact_id INT PRIMARY KEY,
  3      Species_id INT NOT NULL,
  4      Region_id INT NOT NULL,
  5      Migration_changes VARCHAR(100),
  6      FOREIGN KEY (Species_id) REFERENCES Species(Species_id),
  7      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  8  );
    FOREIGN KEY (Species_id) REFERENCES Species(Species_id),
                                        *
ERROR at line 6:
ORA-00942: table or view does not exist


SQL> CREATE TABLE Species (
  2      Species_id INT PRIMARY KEY,
  3      Name VARCHAR(50) NOT NULL,
  4      Conservation_status VARCHAR(20) CHECK (Conservation_status IN ('Endangered', 'Vulnerable', 'Least Concern')),
  5      Habitat VARCHAR(50)
  6  );

Table created.

SQL> CREATE TABLE Biodiversity_Impact (
  2      Impact_id INT PRIMARY KEY,
  3      Species_id INT NOT NULL,
  4      Region_id INT NOT NULL,
  5      Migration_changes VARCHAR(100),
  6      FOREIGN KEY (Species_id) REFERENCES Species(Species_id),
  7      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  8  );

Table created.

SQL> CREATE TABLE Mitigation_Efforts (
  2      Effort_id INT PRIMARY KEY,
  3      Region_id INT NOT NULL,
  4      Project_name VARCHAR(50) NOT NULL,
  5      Fundings DECIMAL(15, 2) CHECK (Fundings >= 0),
  6      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  7  );

Table created.

SQL> CREATE TABLE Researcher (
  2      Researcher_id INT PRIMARY KEY,
  3      Name VARCHAR(50) NOT NULL,
  4      Role VARCHAR(50) NOT NULL,
  5      Affiliation VARCHAR(100)
  6  );

Table created.

SQL> CREATE TABLE Climate_Policy (
  2      Policy_id INT PRIMARY KEY,
  3      Policy_name VARCHAR(50) NOT NULL,
  4      Region_id INT NOT NULL,
  5      Status VARCHAR(20) CHECK (Status IN ('Active', 'Under Review', 'Implemented')),
  6      FOREIGN KEY (Region_id) REFERENCES Region(Region_id)
  7  );

Table created.
 INSERT INTO Species (Species_id, Name, Conservation_status, Habitat)
  2  VALUES (1, 'Amazon Parrot', 'Endangered', 'Rainforest');

1 row created.

SQL>
SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat)
  2  VALUES (2, 'Polar Bear', 'Vulnerable', 'Arctic');

1 row created.

SQL>
SQL> INSERT INTO Species (Species_id, Name, Conservation_status, Habitat)
  2  VALUES (3, 'Sahara Gazelle', 'Endangered', 'Desert');

1 row created.

SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes)
  2  VALUES (1, 1, 1, 'Decreased migration due to habitat loss');

1 row created.

SQL>
SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes)
  2  VALUES (2, 2, 2, 'Increased migration due to warming temperatures');

1 row created.

SQL>
SQL> INSERT INTO Biodiversity_Impact (Impact_id, Species_id, Region_id, Migration_changes)
  2  VALUES (3, 3, 3, 'Migration affected by drought conditions');

1 row created.

SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings)
  2  VALUES (1, 1, 'Reforestation Initiative', 500000.00);

1 row created.

SQL>
SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings)
  2  VALUES (2, 2, 'Arctic Preservation', 750000.00);

1 row created.

SQL>
SQL> INSERT INTO Mitigation_Efforts (Effort_id, Region_id, Project_name, Fundings)
  2  VALUES (3, 3, 'Desertification Control', 300000.00);

1 row created.

SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation)
  2  VALUES (1, 'Dr. Emily Stone', 'Climate Scientist', 'National Climate Institute');

1 row created.

SQL>
SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation)
  2  VALUES (2, 'Dr. Alex Cho', 'Data Analyst', 'Green Earth Org');

1 row created.

SQL>
SQL> INSERT INTO Researcher (Researcher_id, Name, Role, Affiliation)
  2  VALUES (3, 'Dr. Sara Wu', 'Biodiversity Expert', 'World Wildlife Fund');

1 row created.

SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status)
  2  VALUES (1, 'Amazon Preservation Act', 1, 'Active');

1 row created.

SQL>
SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status)
  2  VALUES (2, 'Arctic Conservation Treaty', 2, 'Under Review');

1 row created.

SQL>
SQL> INSERT INTO Climate_Policy (Policy_id, Policy_name, Region_id, Status)
  2  VALUES (3, 'Sahara Ecosystem Restoration', 3, 'Implemented');

1 row created.

SQL>