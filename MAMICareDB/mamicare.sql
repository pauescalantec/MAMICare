DROP SCHEMA MAMICARE;
CREATE SCHEMA MAMICARE;
USE MAMICare;

CREATE TABLE SocialWorker (
    id INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    username VARCHAR (255),
    password VARCHAR (255),
    firstName VARCHAR (255),
    lastName VARCHAR (255),
    dateCreated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Address (
    id INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    addressLine1 VARCHAR (255),
    addressLine2 VARCHAR (255),
    city VARCHAR (255),
    state VARCHAR (4),
    country VARCHAR (4),
    zipCode INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Patient (
    id INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    addressId INTEGER,
    FOREIGN KEY (addressId) REFERENCES Address(id),
    firstName VARCHAR(255),
    lastName1 VARCHAR(255),
    lastName2 VARCHAR(255),
    birthDate DATE,
    email VARCHAR (255),
    curp VARCHAR (18),
    comments VARCHAR (3000),
    isActive BOOL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Assessment (
    id INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    pulse INTEGER,
    oxygen INTEGER,
    systolicHeartRate INTEGER,
    diastolicHeartRate INTEGER,
    fetalHeartBeat INTEGER,
    fetalRegion INTEGER,
    urineTest REAL,
    contractionsExist BOOL,
    contractionsTime INTEGER,
    weight REAL,
    fundalHeight REAL,
    basalGlucose INTEGER,
    observations VARCHAR (255),
    isActive BOOL,
    lastModified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Consultation (
    id INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    assessmentID INTEGER NOT NULL,
    FOREIGN KEY (assessmentID) REFERENCES Assessment(id),
    patientID INTEGER NOT NULL,
    FOREIGN KEY (patientID) REFERENCES Patient(id),
    socialWorkerID INTEGER NOT NULL,
    FOREIGN KEY (socialWorkerID) REFERENCES SocialWorker(id),
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    overallScore REAL
);