Microsoft Windows [Version 10.0.22631.4460]
(c) Microsoft Corporation. All rights reserved.

C:\Users\PC>sqlplus

SQL*Plus: Release 21.0.0.0.0 - Production on Mon Dec 2 16:56:13 2024
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: system
Enter password:
Last Successful login time: Thu Nov 21 2024 18:18:46 -08:00

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0
SQL> CREATE TABLE Locations (
  2      LocationID NUMBER PRIMARY KEY,
  3      LocationName VARCHAR2(100),
  4      Country VARCHAR2(50)
  5  );

Table created.

SQL> CREATE TABLE ClimateData (
  2      DataID NUMBER PRIMARY KEY,
  3      LocationID NUMBER,
  4      Temperature NUMBER,
  5      Humidity NUMBER,
  6      Pressure NUMBER,
  7      Timestamp TIMESTAMP,
  8      FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
  9  );

Table created.

SQL> CREATE TABLE ClimateDataAnalysis (
  2      AnalysisID NUMBER PRIMARY KEY,
  3      DataID NUMBER,
  4      AnalysisType VARCHAR2(50),
  5      Result VARCHAR2(200),
  6      FOREIGN KEY (DataID) REFERENCES ClimateData(DataID)
  7  );

Table created.

SQL> CREATE TABLE UserActivityAudit (
  2      AuditID NUMBER PRIMARY KEY,
  3      UserName VARCHAR2(100),
  4      Action VARCHAR2(100),
  5      TableName VARCHAR2(50),
  6      Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  7  );

Table created.

SQL> CREATE OR REPLACE FUNCTION CalculateAverageTemperature(p_LocationID IN Locations.LocationID%TYPE, p_StartDate IN TIMESTAMP, p_EndDate IN TIMESTAMP)
  2  RETURN NUMBER IS
  3      v_AvgTemperature NUMBER;
  4  BEGIN
  5      SELECT AVG(Temperature)
  6      INTO v_AvgTemperature
  7      FROM ClimateData
  8      WHERE LocationID = p_LocationID
  9      AND Timestamp BETWEEN p_StartDate AND p_EndDate;
 10
 11      RETURN v_AvgTemperature;
 12  END;
 13  /

Function created.

SQL> CREATE OR REPLACE FUNCTION CheckAnomalousData(p_LocationID IN Locations.LocationID%TYPE, p_TemperatureThreshold IN NUMBER)
  2  RETURN VARCHAR2 IS
  3      v_Temperature NUMBER;
  4  BEGIN
  5      SELECT Temperature
  6      INTO v_Temperature
  7      FROM ClimateData
  8      WHERE LocationID = p_LocationID
  9      AND Temperature > p_TemperatureThreshold
 10      AND ROWNUM = 1;
 11
 12      IF v_Temperature IS NOT NULL THEN
 13          RETURN 'Anomalous Data Detected';
 14      ELSE
 15          RETURN 'No Anomalies';
 16      END IF;
 17  END;
 18  /

Function created.

SQL> CREATE OR REPLACE PROCEDURE RecordClimateData(
  2      p_LocationID IN Locations.LocationID%TYPE,
  3      p_Temperature IN NUMBER,
  4      p_Humidity IN NUMBER,
  5      p_Pressure IN NUMBER,
  6      p_Timestamp IN TIMESTAMP
  7  ) AS
  8  BEGIN
  9      INSERT INTO ClimateData (LocationID, Temperature, Humidity, Pressure, Timestamp)
 10      VALUES (p_LocationID, p_Temperature, p_Humidity, p_Pressure, p_Timestamp);
 11  END;
 12  /

Procedure created.

SQL> CREATE OR REPLACE TRIGGER LogUserActivity
  2  AFTER INSERT OR UPDATE OR DELETE ON ClimateData
  3  FOR EACH ROW
  4  BEGIN
  5      INSERT INTO UserActivityAudit (UserName, Action, TableName)
  6      VALUES (USER,
  7              CASE WHEN INSERTING THEN 'INSERT'
  8                   WHEN UPDATING THEN 'UPDATE'
  9                   WHEN DELETING THEN 'DELETE'
 10              END,
 11              'ClimateData');
 12  END;
 13  /

Warning: Trigger created with compilation errors.

SQL> CREATE OR REPLACE TRIGGER AuditClimateDataChanges
  2  AFTER UPDATE OR DELETE ON ClimateData
  3  FOR EACH ROW
  4  BEGIN
  5      INSERT INTO AuditLog (
  6          AuditID, TableName, Action, ChangedBy, OldData, NewData
  7      )
  8      VALUES (
  9          AuditLog_seq.NEXTVAL,
 10          'ClimateData',
 11          CASE WHEN UPDATING THEN 'UPDATE' ELSE 'DELETE' END,

 12          USER, -- The current database user
 13          JSON_OBJECT(
 14              'DataID' VALUE :OLD.DataID,
 15              'Temperature' VALUE :OLD.Temperature,
 16              'Humidity' VALUE :OLD.Humidity,
 17              'Pressure' VALUE :OLD.Pressure
 18          ),
 19          CASE
 20              WHEN UPDATING THEN JSON_OBJECT(
 21                  'DataID' VALUE :NEW.DataID,
 22                  'Temperature' VALUE :NEW.Temperature,
 23                  'Humidity' VALUE :NEW.Humidity,
 24                  'Pressure' VALUE :NEW.Pressure
 25              )
 26              ELSE NULL
 27          END
 28      );
 29  END;
 30  /

Warning: Trigger created with compilation errors.

SQL> CREATE OR REPLACE PACKAGE ClimateData_Pkg AS
  2      FUNCTION CalculateAverageTemperature(p_LocationID IN Locations.LocationID%TYPE, p_StartDate IN TIMESTAMP, p_EndDate IN TIMESTAMP) RETURN NUMBER;
  3      FUNCTION CheckAnomalousData(p_LocationID IN Locations.LocationID%TYPE, p_TemperatureThreshold IN NUMBER) RETURN VARCHAR2;
  4      PROCEDURE RecordClimateData(p_LocationID IN Locations.LocationID%TYPE, p_Temperature IN NUMBER, p_Humidity IN NUMBER, p_Pressure IN NUMBER, p_Timestamp IN TIMESTAMP);
  5      PROCEDURE AnalyzeClimateData(p_DataID IN ClimateData.DataID%TYPE, p_AnalysisType IN VARCHAR2, p_Result OUT VARCHAR2);
  6  END ClimateData_Pkg;
  7  /

Package created.

SQL> CREATE OR REPLACE PACKAGE BODY ClimateData_Pkg AS
  2
  3      FUNCTION CalculateAverageTemperature(p_LocationID IN Locations.LocationID%TYPE, p_StartDate IN TIMESTAMP, p_EndDate IN TIMESTAMP) RETURN NUMBER IS
  4          v_AvgTemperature NUMBER;
  5      BEGIN
  6          SELECT AVG(Temperature)
  7          INTO v_AvgTemperature
  8          FROM ClimateData
  9          WHERE LocationID = p_LocationID
 10          AND Timestamp BETWEEN p_StartDate AND p_EndDate;
 11
 12          RETURN v_AvgTemperature;
 13      END CalculateAverageTemperature;
 14
 15      FUNCTION CheckAnomalousData(p_LocationID IN Locations.LocationID%TYPE, p_TemperatureThreshold IN NUMBER) RETURN VARCHAR2 IS
 16          v_Temperature NUMBER;
 17      BEGIN
 18          SELECT Temperature
 19          INTO v_Temperature
 20          FROM ClimateData
 21          WHERE LocationID = p_LocationID
 22          AND Temperature > p_TemperatureThreshold
 23          AND ROWNUM = 1;
 24
 25          IF v_Temperature IS NOT NULL THEN
 26              RETURN 'Anomalous Data Detected';
 27          ELSE
 28              RETURN 'No Anomalies';
 29          END IF;
 30      END CheckAnomalousData;
 31
 32      PROCEDURE RecordClimateData(p_LocationID IN Locations.LocationID%TYPE, p_Temperature IN NUMBER, p_Humidity IN NUMBER, p_Pressure IN NUMBER, p_Timestamp IN TIMESTAMP) AS
 33      BEGIN
 34          INSERT INTO ClimateData (LocationID, Temperature, Humidity, Pressure, Timestamp)
 35          VALUES (p_LocationID, p_Temperature, p_Humidity, p_Pressure, p_Timestamp);
 36      END;
 37
 38      PROCEDURE AnalyzeClimateData(p_DataID IN ClimateData.DataID%TYPE, p_AnalysisType IN VARCHAR2, p_Result OUT VARCHAR2) AS

 39      BEGIN
 40          -- Perform analysis based on the type
 41          IF p_AnalysisType = 'TemperatureAnomaly' THEN
 42              SELECT CASE
 43                  WHEN MAX(Temperature) > 40 THEN 'Anomaly Detected'
 44                  ELSE 'Normal'
 45              END
 46              INTO p_Result
 47              FROM ClimateData
 48              WHERE DataID = p_DataID;
 49          END IF;
 50
 51          -- Insert result into analysis table
 52          INSERT INTO ClimateDataAnalysis (DataID, AnalysisType, Result)
 53          VALUES (p_DataID, p_AnalysisType, p_Result);
 54      END;
 55
 56  END ClimateData_Pkg;
 57  /

Package body created.

SQL> CREATE OR REPLACE TRIGGER ValidateClimateData
  2  BEFORE INSERT OR UPDATE ON ClimateData     -- Using Simple trigger BEFORE
  3  FOR EACH ROW
  4  BEGIN
  5      IF :NEW.Temperature < -50 OR :NEW.Temperature > 60 THEN

  6          RAISE_APPLICATION_ERROR(-20001, 'Invalid temperature value. It must be between -50 and 60.');
  7      END IF;
  8
  9      IF :NEW.Humidity < 0 OR :NEW.Humidity > 100 THEN
 10          RAISE_APPLICATION_ERROR(-20002, 'Invalid humidity value. It must be between 0 and 100.');
 11      END IF;
 12  END;
 13  /

Trigger created.
