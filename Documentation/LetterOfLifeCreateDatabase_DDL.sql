
/* 
File:        LetterOfLifeCreateDatabase_DDL.sql
Version:     1.0 
Created:     June 17, 2020
Description: This is the database creation script for the Letter of Life application.
			 The script first drops then create database tables and populates them with some sample data. 
Author:		 Augustin Mwamba & Team EMSPlus
			 SWEN670, Summer 2020
			 University of Maryland Global Campus (UMGC) 
*/
-- Drop database tables statements.
DROP TABLE IF EXISTS patient_illness ;
DROP TABLE IF EXISTS patient_medication;
DROP TABLE IF EXISTS patient_allergy;
DROP TABLE IF EXISTS illness;
DROP TABLE IF EXISTS medication;
DROP TABLE IF EXISTS allergy;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS zipcode;
DROP TABLE IF EXISTS appuser_role;
DROP TABLE IF EXISTS approle;
DROP TABLE IF EXISTS appuser;

-- Create database tables statements.
CREATE TABLE allergy ( 
    Allergy_Id    INT NOT NULL COMMENT 'The unique ID for an allergy', 
    Allergy_Name  VARCHAR(50) NOT NULL COMMENT 'The allergy name.'
) COMMENT='The information table for allergies.';

ALTER TABLE allergy ADD CONSTRAINT allergy_pk PRIMARY KEY ( Allergy_Id );

CREATE TABLE doctor ( 
    Doctor_Id     INT NOT NULL COMMENT 'The unique ID for a doctor.', 
    Doctor_Name   VARCHAR(50) NOT NULL COMMENT 'The doctor''s name.', 
    Doctor_Phone  VARCHAR(15) NOT NULL COMMENT 'The doctor''s phone number.'
) COMMENT='Profile information table for doctors';

ALTER TABLE doctor ADD CONSTRAINT dr_pk PRIMARY KEY ( Doctor_Id );

CREATE TABLE illness ( 
    Illness_Id    INT NOT NULL COMMENT 'The unique ID for an illness.', 
    Illness_Name  VARCHAR(50) NOT NULL COMMENT 'The illness''s name.'
) COMMENT='The information table for illnesses.';

ALTER TABLE illness ADD CONSTRAINT ill_pk PRIMARY KEY ( Illness_Id );

CREATE TABLE medication ( 
    Medication_Id    INT NOT NULL COMMENT 'The unique ID for a medication.', 
    Medication_Name  VARCHAR(50) NOT NULL COMMENT 'The medication name.'
) COMMENT='The information table medications.';

ALTER TABLE medication ADD CONSTRAINT med_pk PRIMARY KEY ( Medication_Id );

  /--  Profile information for a patient..
CREATE TABLE patient ( 
    Patient_Id          INT NOT NULL COMMENT 'The unique ID for a patient.', 
    First_Name          VARCHAR(32) COMMENT 'The patient''s name.', 
    Last_Name           VARCHAR(50) NOT NULL COMMENT 'The patient''s last name.', 
    Dob                 DATE NOT NULL COMMENT 'The patient''s date of birth.', 
    Ssn                 VARCHAR(11) NOT NULL COMMENT 'The patient''s social security number.', 
    InsurCompany_Name   VARCHAR(50) COMMENT 'The patient''s medical insurance company name.',
    InsurPolicy_No		VARCHAR(32) COMMENT 'The patient''s medical insurance policy number.',
    Zip                 VARCHAR(5) NOT NULL COMMENT 'The patient''S zip code number.', 
    Doctor_Id           INT COMMENT 'The patient''s primary care physician.',
    Ekg					BIT NOT NULL DEFAULT 0 COMMENT 'Is the patient''s electrocardiogram record available?',
    Advanced_Directive 	BIT NOT NULL DEFAULT 0 COMMENT 'Is the patient''s advanced directive record available?'
) COMMENT = 'The information table for patients.';

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( patient_id );

CREATE TABLE patient_allergy ( 
    Patient_Id  INT NOT NULL COMMENT 'The unique ID for a patient.', 
    Allergy_Id  INT NOT NULL COMMENT 'The unique ID for an allergy.'
) COMMENT = 'The information table for the patient''s allergies.';

ALTER TABLE patient_allergy ADD CONSTRAINT pat_alrg_pk PRIMARY KEY ( Patient_Id, Allergy_Id );
CREATE TABLE patient_illness ( 
    Illness_Id  INT NOT NULL COMMENT 'The unique ID for the patient''s illness.', 
    Patient_Id  INT NOT NULL COMMENT 'The patient''s unique ID.'
) COMMENT = 'Information about the patient''s illnesses.';

ALTER TABLE patient_illness ADD CONSTRAINT pat_ill_pk PRIMARY KEY ( Illness_Id, Patient_Id );

CREATE TABLE patient_medication ( 
    Medication_Id INT NOT NULL COMMENT 'The medication unique ID.', 
    Patient_Id     INT NOT NULL COMMENT 'The patient''s unique ID',
    Dosage         VARCHAR(32) NOT NULL COMMENT 'The amount of medication taken.',
    Frequency      VARCHAR(32) NOT NULL COMMENT 'How often the medication is taken (once, twice daily, etc.)'
) COMMENT = 'The information table for a patient medication.';

ALTER TABLE patient_medication ADD CONSTRAINT patmed_pk PRIMARY KEY ( Medication_Id, Patient_Id );

CREATE TABLE zipcode ( 
    Zip    VARCHAR(5) NOT NULL COMMENT 'The zip code number, unique for a city and state.', 
    City   VARCHAR(25) COMMENT 'The patient''s city.', 
    State  VARCHAR(2) COMMENT 'The patient''s state.'
) COMMENT = 'City, state and zip code information.';

ALTER TABLE zipcode ADD CONSTRAINT zip_pk PRIMARY KEY ( Zip );

CREATE TABLE approle (
	Role_Id INT NOT NULL COMMENT 'The user''s role unique ID.',
    Role_Level INT NOT NULL COMMENT 'The user''s role level.',
    Role_Title VARCHAR(32) NOT NULL COMMENT 'The title for this database user role',
    Role_Description VARCHAR(512) COMMENT 'The description for this database user role'
) COMMENT = 'The database user role table';
ALTER TABLE approle ADD CONSTRAINT approle_pk PRIMARY KEY ( Role_Id );

CREATE TABLE appuser (
	User_Id INT NOT NULL COMMENT 'The database user unique ID.',
    First_Name VARCHAR(32) COMMENT 'The application user first name',
    Last_Name VARCHAR(50) NOT NULL COMMENT 'The application user last name',
    Username VARCHAR(256) NOT NULL COMMENT 'The name that uniquely identifies the user in the database',
    Nickname VARCHAR(45) COMMENT 'The database user alias or alternate name',
    Email VARCHAR(256) COMMENT 'The database user email address.',
    DateCreated DATETIME NOT NULL COMMENT 'The creation date for this database user account',
    LastLogin DATETIME NOT NULL COMMENT 'The timestamp the user last login attempt into the database.',
    PasswordHash VARCHAR(128) NOT NULL COMMENT 'The uniquely generated hash value for the user password',
    Is_Locked BIT NOT NULL DEFAULT 0 COMMENT 'Is the database user''s account locked?',
    Is_Active BIT NOT NULL DEFAULT 0 COMMENT 'Is the database user''s account active?',
    Security_Question VARCHAR(256) NOT NULL COMMENT 'Question enabling the database user to re-set a forgotten password.',
    SecQuest_AnswerHash VARCHAR(128) NOT NULL COMMENT 'The uniquely generated hash value for the user question.',
    UserAccount_Comment VARCHAR(512) COMMENT 'The database user account description.'   
    ) COMMENT = 'The database user profile table';

ALTER TABLE appuser ADD CONSTRAINT appuser_pk PRIMARY KEY ( User_Id );
ALTER TABLE appuser ADD CONSTRAINT appuser_uq_username UNIQUE ( Username );
ALTER TABLE appuser ADD CONSTRAINT appuser_uq_email UNIQUE ( Email );

CREATE TABLE appuser_role (
	User_Id INT NOT NULL COMMENT 'The database user unique ID',
    Role_Id INT NOT NULL COMMENT 'The database user''s role unique ID'
) COMMENT = 'The specific roles assigned to this user user in the database.';

ALTER TABLE appuser_role ADD CONSTRAINT appuserole_pk PRIMARY KEY ( User_Id, Role_Id );

-- Create foreign key constraints on tables
ALTER TABLE patient
    ADD CONSTRAINT pat_dr_fk FOREIGN KEY ( Doctor_Id )
        REFERENCES doctor ( Doctor_Id );

ALTER TABLE patient
    ADD CONSTRAINT pat_zip_fk FOREIGN KEY ( Zip )
        REFERENCES zipcode ( Zip );

ALTER TABLE patient_allergy
    ADD CONSTRAINT patalrg_alrg_fk FOREIGN KEY ( Allergy_Id )
        REFERENCES allergy ( Allergy_Id );

ALTER TABLE patient_allergy
    ADD CONSTRAINT patalrg_pat_fk FOREIGN KEY ( Patient_Id )
        REFERENCES patient ( Patient_Id );

ALTER TABLE patient_illness
    ADD CONSTRAINT patill_ill_fk FOREIGN KEY ( Illness_Id )
        REFERENCES illness ( Illness_Id );

ALTER TABLE patient_illness
    ADD CONSTRAINT patill_pat_fk FOREIGN KEY ( Patient_Id )
        REFERENCES patient ( Patient_Id );

ALTER TABLE patient_medication
    ADD CONSTRAINT patmed_med_fk FOREIGN KEY ( Medication_Id )
        REFERENCES medication ( Medication_Id );

ALTER TABLE patient_medication
    ADD CONSTRAINT patmed_pat_fk FOREIGN KEY ( Patient_Id )
        REFERENCES patient ( Patient_Id );

ALTER TABLE appuser_role
    ADD CONSTRAINT appuserole_appuser_fk FOREIGN KEY ( User_Id )
        REFERENCES appuser ( User_Id );
        
ALTER TABLE appuser_role
    ADD CONSTRAINT appuserole_approle_fk FOREIGN KEY ( Role_Id )
        REFERENCES approle ( Role_Id );
        
-- Insert statements for the allergy table.
INSERT INTO allergy VALUES ('101', 'Aspirine');
INSERT INTO allergy VALUES ('102', 'Barbiturate');
INSERT INTO allergy VALUES ('103', 'Codeine');
INSERT INTO allergy VALUES ('104', 'Lidocaine');
INSERT INTO allergy VALUES ('105', 'Latex');
INSERT INTO allergy VALUES ('106', 'Morphine');
INSERT INTO allergy VALUES ('107', 'Penicillin');

-- Insert statements for the illness table.
INSERT INTO illness VALUES ('301', 'Asthma');
INSERT INTO illness VALUES ('302', 'Bleeding Disorder');
INSERT INTO illness VALUES ('303', 'Cancer');
INSERT INTO illness VALUES ('304', 'Cardiac');
INSERT INTO illness VALUES ('305', 'COPD');
INSERT INTO illness VALUES ('306', 'Dementia');
INSERT INTO illness VALUES ('307', 'Diabetes');
INSERT INTO illness VALUES ('308', 'Hepatitis');
INSERT INTO illness VALUES ('309', 'Hypertension');
INSERT INTO illness VALUES ('310', 'Seizure Disorder');
INSERT INTO illness VALUES ('311', 'Pacemaker');
INSERT INTO illness VALUES ('312', 'Stroke'); 

-- Insert statements for the medication table.
INSERT INTO medication VALUES ('501', 'Amoxicillin');
INSERT INTO medication VALUES ('502', 'Ibuprofen');
INSERT INTO medication VALUES ('503', 'Zoloft');
INSERT INTO medication VALUES ('504', 'Amlodipine');
INSERT INTO medication VALUES ('505', 'Flomax');

-- Instert statement for the zipcode table.
INSERT INTO zipcode VALUES ('55551', 'Indian Summer town', 'MD');
INSERT INTO zipcode VALUES ('55552', 'Indian Summer town', 'MD');
INSERT INTO zipcode VALUES ('55553', 'Rome', 'MD');
INSERT INTO zipcode VALUES ('55554', 'Rocky hill', 'MD');
INSERT INTO zipcode VALUES ('55555', 'Rocky hill', 'MD');

-- Instert statements for the doctor table.
INSERT INTO doctor VALUES ('1001', 'Dr. Jenkins', '647-001-0031');
INSERT INTO doctor VALUES ('1002', 'Dr. Lowe', '647-001-0032');
INSERT INTO doctor VALUES ('1003', 'Dr. Wazaka', '647-001-0033');
INSERT INTO doctor VALUES ('1004', 'Dr. Rivera', '674-001-0034');
INSERT INTO doctor VALUES ('1005', 'Dr. Alfani', '647-001-0035');

-- Instert statements for the patient table.
INSERT INTO patient VALUES ('10001', 'Edmund', 'Burns', '1950-1-01', '222-22-2222', 'Medicare', 'AZ900500', '55551', '1001', 1, 1);
INSERT INTO patient VALUES ('10002', 'Katrina', 'Oyl', '1945-2-02', '333-33-3333', 'Medicare', 'CR600100', '55551', '1003', 0, 0);
INSERT INTO patient VALUES ('10003', 'Elaine', 'Fudd', '1960-11-01', '777-77-7777', 'CareFirst', 'HX500300', '55551', '1001', 1, 1);
INSERT INTO patient (Patient_Id,First_Name,Last_Name,Dob,Ssn,Zip,Advanced_Directive) 
VALUES ('10004', 'Homer', 'Cartman', '1961-5-05', '111-11-1111','55555', 1);
INSERT INTO patient VALUES ('10005', 'David', 'Biggs', '1953-3-03', '444-44-4444', 'Medicare', 'LP100700', '55552', '1004', 1, 0);

-- Insert statements for the patient_illness table.
INSERT INTO patient_illness VALUES ('301', '10005');
INSERT INTO patient_illness VALUES ('312', '10001');
INSERT INTO patient_illness VALUES ('309', '10003');
INSERT INTO patient_illness VALUES ('305', '10002');
INSERT INTO patient_illness VALUES ('311', '10004');

-- Insert statements for the patient_allergy table. 
INSERT INTO patient_allergy VALUES ('10001', '101');
INSERT INTO patient_allergy VALUES ('10001', '107');
INSERT INTO patient_allergy VALUES ('10002', '102');
INSERT INTO patient_allergy VALUES ('10003', '101');
INSERT INTO patient_allergy VALUES ('10005', '106');
INSERT INTO patient_allergy VALUES ('10004', '103');

-- Insert statements for the patient_medication table.
INSERT INTO patient_medication VALUES ('501', '10001', '500mg ', 'Three times a day');
INSERT INTO patient_medication VALUES ('502', '10002', '400mg', 'Three to four times a day');
INSERT INTO patient_medication VALUES ('504', '10005', '10mg', 'Once a day');

-- Insert statements for the role table.
INSERT INTO approle VALUES ('11', '1', 'guest','Unauthenticated and unauthorized application user who want to learn about the system and can create a new personal account.');
INSERT INTO approle VALUES ('12', '2', 'medical_serv_prov','Registered, authenticated, and authorized Medical Services Provider who wants only to view patients'' information.');
INSERT INTO approle VALUES ('13', '3', 'patient_agent','Registered, authenticated, and authorized agent acting on behalf on the patient''s interests.');
INSERT INTO approle VALUES ('14', '4', 'prog_participant','Registered, authenticated, and authorized Program Participant');
INSERT INTO approle VALUES ('15', '5', 'sys_admin','The application superuser, can register new users, add, delete, or application user information, etc.');

-- Insert statements for the user table.
INSERT INTO appuser VALUES ('20001','Shaggy','Martian','smartian2020','smart','smart2020@swen670.com','2020-06-17 19:11:40','2020-06-17 23:20:17',
'7db3c4764aaec6222479923113cca4116cc217c260',1,1,'Who was your best teacher in high school?','5092fd52e40132a41ac06c3209b74fc4de1b3f9502',
'Advocate for patient Katrina Oyl');

-- Insert statements for the user_role table
INSERT INTO appuser_role VALUES ('20001','13');

 



