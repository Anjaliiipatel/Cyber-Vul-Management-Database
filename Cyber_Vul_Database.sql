CREATE DATABASE VUL_DATABASE;

USE VUL_DATABASE;

#Created all the tables for database 
CREATE TABLE Vulnerability (
    VulnerabilityID VARCHAR(4),
    CVE VARCHAR(20),
    VulnerabilityName VARCHAR(100),
    Severity VARCHAR(20),
    CVSSScore DECIMAL(3,1),
    DiscoveryDate DATE,
    Status VARCHAR(20),
    CONSTRAINT Vulnerability_VulnerabilityID_PK PRIMARY KEY (VulnerabilityID)
);

CREATE TABLE Asset (
    AssetID VARCHAR(4),
    Hostname VARCHAR(50),
    AssetType VARCHAR(50),
    Department VARCHAR(50),
    CriticalityLevel VARCHAR(20),
    CONSTRAINT Asset_AssetID_PK PRIMARY KEY (AssetID)
);

CREATE TABLE Analyst (
    AnalystID VARCHAR(4),
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Team VARCHAR(50),
    Certification VARCHAR(50),
    CONSTRAINT Analyst_AnalystID_PK PRIMARY KEY (AnalystID)
);

CREATE TABLE VulnerabilityAsset (
    VulnerabilityID VARCHAR(4),
    AssetID VARCHAR(4),
    CONSTRAINT VulnerabilityAsset_VulnerabilityID_AssetID_PK 
        PRIMARY KEY (VulnerabilityID, AssetID),
    CONSTRAINT VulnerabilityAsset_VulnerabilityID_FK 
        FOREIGN KEY (VulnerabilityID) REFERENCES Vulnerability(VulnerabilityID),
    CONSTRAINT VulnerabilityAsset_AssetID_FK 
        FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
);

CREATE TABLE VulnerabilityAssignment (
    VulnerabilityID VARCHAR(4),
    AnalystID VARCHAR(4),
    AssignedDate DATE,
    CONSTRAINT VulnerabilityAssignment_VulnerabilityID_AnalystID_PK 
        PRIMARY KEY (VulnerabilityID, AnalystID),
    CONSTRAINT VulnerabilityAssignment_VulnerabilityID_FK 
        FOREIGN KEY (VulnerabilityID) REFERENCES Vulnerability(VulnerabilityID),
    CONSTRAINT VulnerabilityAssignment_AnalystID_FK 
        FOREIGN KEY (AnalystID) REFERENCES Analyst(AnalystID)
);

CREATE TABLE Patch (
    PatchID VARCHAR(4),
    VulnerabilityID VARCHAR(4),
    PatchDate DATE,
    PatchStatus VARCHAR(20),
    PatchNotes VARCHAR(150),
    CONSTRAINT Patch_PatchID_PK PRIMARY KEY (PatchID),
    CONSTRAINT Patch_VulnerabilityID_FK 
        FOREIGN KEY (VulnerabilityID) REFERENCES Vulnerability(VulnerabilityID)
);

#Data provided for Vulnerability Records
INSERT INTO Vulnerability VALUES
('V001','CVE-2025-1001','Remote Code Execution','Critical',9.8,'2026-01-03','Open'),
('V002','CVE-2025-1002','SQL Injection','High',8.9,'2026-01-05','Open'),
('V003','CVE-2025-1003','Cross Site Scripting','Medium',6.5,'2026-01-08','Open'),
('V004','CVE-2025-1004','Privilege Escalation','Critical',9.5,'2026-01-12','Open'),
('V005','CVE-2025-1005','Buffer Overflow','High',8.1,'2026-01-15','Open'),
('V006','CVE-2025-1006','Directory Traversal','Medium',6.8,'2026-01-18','Closed'),
('V007','CVE-2025-1007','Weak Authentication','High',7.8,'2026-01-20','Open'),
('V008','CVE-2025-1008','Improper Access Control','Medium',6.9,'2026-01-22','Closed'),
('V009','CVE-2025-1009','Command Injection','Critical',9.7,'2026-01-25','Open'),
('V010','CVE-2025-1010','Credential Exposure','High',8.4,'2026-01-28','Open'),
('V011','CVE-2025-1011','Insecure API','High',8.0,'2026-02-01','Open'),
('V012','CVE-2025-1012','Path Injection','Medium',5.9,'2026-02-04','Closed'),
('V013','CVE-2025-1013','Broken Session Management','High',8.2,'2026-02-07','Open'),
('V014','CVE-2025-1014','XML Injection','Medium',6.1,'2026-02-10','Open'),
('V015','CVE-2025-1015','Information Disclosure','Low',4.3,'2026-02-13','Closed'),
('V016','CVE-2025-1016','Authentication Bypass','Critical',9.6,'2026-02-15','Open'),
('V017','CVE-2025-1017','Weak Encryption','Medium',6.4,'2026-02-18','Open'),
('V018','CVE-2025-1018','Cross Site Request Forgery','Medium',6.7,'2026-02-20','Closed'),
('V019','CVE-2025-1019','DNS Spoofing','High',8.5,'2026-02-23','Open'),
('V020','CVE-2025-1020','ARP Poisoning','High',8.3,'2026-02-26','Open'),
('V021','CVE-2025-1021','Malicious File Upload','Critical',9.1,'2026-03-01','Open'),
('V022','CVE-2025-1022','Server Misconfiguration','Medium',5.8,'2026-03-04','Closed'),
('V023','CVE-2025-1023','Open Redirect','Low',4.7,'2026-03-06','Closed'),
('V024','CVE-2025-1024','Code Injection','Critical',9.4,'2026-03-08','Open'),
('V025','CVE-2025-1025','Deserialization Attack','High',8.8,'2026-03-11','Open'),
('V026','CVE-2025-1026','Improper Input Validation','Medium',6.3,'2026-03-14','Open'),
('V027','CVE-2025-1027','Security Misconfiguration','Medium',5.5,'2026-03-17','Closed'),
('V028','CVE-2025-1028','Token Leakage','High',8.0,'2026-03-20','Open'),
('V029','CVE-2025-1029','LDAP Injection','High',8.4,'2026-03-23','Open'),
('V030','CVE-2025-1030','Privilege Abuse','Critical',9.2,'2026-03-26','Open');

#Data provided for Assets Records
INSERT INTO Asset VALUES
('A001','WEB-SRV01','Web Server','IT','Critical'),
('A002','DB-SRV01','Database Server','IT','Critical'),
('A003','FW-01','Firewall','Network','Critical'),
('A004','MAIL-SRV01','Mail Server','IT','High'),
('A005','HR-PC01','Workstation','HR','Medium'),
('A006','FIN-PC01','Workstation','Finance','High'),
('A007','DC-01','Domain Controller','IT','Critical'),
('A008','VPN-01','VPN Appliance','Network','Critical'),
('A009','APP-SRV01','Application Server','IT','High'),
('A010','ENG-PC01','Workstation','Engineering','Medium'),
('A011','NAS-01','Storage Server','IT','High'),
('A012','CRM-SRV01','CRM Server','Sales','High'),
('A013','IOT-01','IoT Device','Operations','Medium'),
('A014','BACKUP-01','Backup Server','IT','Critical'),
('A015','DNS-01','DNS Server','Network','Critical');

#Data provided for Analyst Records
INSERT INTO Analyst VALUES
('AN01','Alex','Smith','SOC','Security+'),
('AN02','Jordan','Brown','SOC','CySA+'),
('AN03','Taylor','Johnson','Vulnerability Management','Security+'),
('AN04','Morgan','Davis','Incident Response','GCIA'),
('AN05','Casey','Wilson','Threat Hunting','GCIH'),
('AN06','Jamie','Moore','SOC','CySA+'),
('AN07','Riley','Martin','Security Engineering','CISSP'),
('AN08','Cameron','Lee','Vulnerability Management','Security+'),
('AN09','Avery','White','Incident Response','GSEC'),
('AN10','Parker','Hall','Security Engineering','CISSP');

#VulnerabilityAsset Records
INSERT INTO VulnerabilityAsset VALUES
('V001','A001'),
('V001','A002'),
('V002','A002'),
('V002','A009'),
('V003','A001'),
('V004','A007'),
('V004','A014'),
('V005','A009'),
('V006','A011'),
('V007','A008'),
('V008','A005'),
('V009','A001'),
('V009','A012'),
('V010','A004'),
('V011','A009'),
('V012','A015'),
('V013','A004'),
('V014','A001'),
('V015','A005'),
('V016','A007'),
('V017','A006'),
('V018','A010'),
('V019','A015'),
('V020','A003'),
('V021','A001'),
('V022','A011'),
('V023','A012'),
('V024','A002'),
('V025','A009'),
('V026','A004'),
('V027','A013'),
('V028','A008'),
('V029','A007'),
('V030','A014');

#VulnerabilityAssignment Records
INSERT INTO VulnerabilityAssignment VALUES
('V001','AN01','2026-01-04'),
('V002','AN02','2026-01-06'),
('V003','AN03','2026-01-09'),
('V004','AN04','2026-01-13'),
('V005','AN05','2026-01-16'),
('V006','AN03','2026-01-19'),
('V007','AN01','2026-01-21'),
('V008','AN08','2026-01-23'),
('V009','AN04','2026-01-26'),
('V010','AN06','2026-01-29'),
('V011','AN07','2026-02-02'),
('V012','AN08','2026-02-05'),
('V013','AN02','2026-02-08'),
('V014','AN03','2026-02-11'),
('V015','AN09','2026-02-14'),
('V016','AN10','2026-02-16'),
('V017','AN05','2026-02-19'),
('V018','AN06','2026-02-21'),
('V019','AN07','2026-02-24'),
('V020','AN01','2026-02-27'),
('V021','AN04','2026-03-02'),
('V022','AN08','2026-03-05'),
('V023','AN09','2026-03-07'),
('V024','AN10','2026-03-09'),
('V025','AN02','2026-03-12'),
('V026','AN03','2026-03-15'),
('V027','AN05','2026-03-18'),
('V028','AN07','2026-03-21'),
('V029','AN10','2026-03-24'),
('V030','AN04','2026-03-27');

#Patch records
INSERT INTO Patch VALUES
('P001','V001','2026-01-10','Testing','Vendor patch under testing'),
('P002','V002','2026-01-12','Applied','SQL injection vulnerability remediated'),
('P003','V004','2026-01-18','Applied','Privilege escalation patch deployed'),
('P004','V006','2026-01-25','Applied','Directory traversal fixed'),
('P005','V008','2026-01-30','Applied','Access control issue resolved'),
('P006','V010','2026-02-03','Testing','Credential exposure mitigation testing'),
('P007','V012','2026-02-07','Applied','Path injection vulnerability patched'),
('P008','V015','2026-02-16','Applied','Information disclosure corrected'),
('P009','V018','2026-02-24','Applied','CSRF protection implemented'),
('P010','V019','2026-02-28','Pending','DNS security updates pending'),
('P011','V021','2026-03-04','Testing','File upload controls being validated'),
('P012','V022','2026-03-06','Applied','Server configuration corrected'),
('P013','V023','2026-03-09','Applied','Open redirect issue fixed'),
('P014','V024','2026-03-13','Testing','Code injection remediation testing'),
('P015','V025','2026-03-16','Pending','Deserialization controls pending'),
('P016','V027','2026-03-20','Applied','Security configuration updated'),
('P017','V028','2026-03-23','Testing','Token management updates in progress'),
('P018','V029','2026-03-26','Pending','LDAP controls awaiting deployment'),
('P019','V030','2026-03-29','Testing','Privilege monitoring validation'),
('P020','V017','2026-03-30','Applied','Encryption standards upgraded');

#Part B: SQL Queries

#Query 1 - Retrieve a Subset of Columns
#Question: What vulnerabilities currently exist in the system and what are their severity levels and statuses?
SELECT VulnerabilityName, Severity, Status
FROM Vulnerability;

#Query 2 - Simple Condition
#Question: Which vulnerabilities are classified as Critical?
SELECT *
FROM Vulnerability
WHERE Severity = 'Critical';

#Query 3 - Compound Condition
#Question: Which vulnerabilities are both Critical and currently Open?
SELECT *
FROM Vulnerability
WHERE Severity = 'Critical'
AND Status = 'Open';

#Query 4 - BETWEEN Operator
#Question: Which vulnerabilities have a CVSS score between 8.0 and 10.0?
SELECT VulnerabilityID,
		VulnerabilityName,
        CVSSScore
FROM Vulnerability
WHERE CVSSScore BETWEEN 8.0 AND 10.0;

#Query 5 - Aggregate Function
#Question: What is the average CVSS score of all vulnerabilites?
SELECT AVG(CVSSScore) AS AverageCVSSScore
FROM Vulnerability;

#Query 6 - GROUP BY Clause
#Question: How many vulnerabilities exist within each severity level?
SELECT Severity, 
		COUNT(*) AS TotalVulnerabilities 
FROM Vulnerability 
GROUP BY Severity;

#Query 7 - Join Multiple Tables
#Question: Which organizational assets are affected by each vulnerability?
SELECT V.VulnerabilityName, 
		A.Hostname, 
        A.AssetType 
FROM Vulnerability V 
INNER JOIN VulnerabilityAsset VA 
	ON V.VulnerabilityID = VA.VulnerabilityID 
INNER JOIN Asset A 
	ON VA.AssetID = A.AssetID;

#Query 8 - IN Operator
#Question: Which assets belong to the IT or Finance departments?
SELECT * 
FROM Asset 
WHERE Department IN ('IT', 'Finance');

#Query 9 - Subquery
#Question: Which vulnerabilities have a CVSS score above the overall average CVSS score?
SELECT VulnerabilityName, CVSSScore 
FROM Vulnerability 
WHERE CVSSScore > 
( 
	SELECT AVG(CVSSScore) 
    FROM Vulnerability 
);

#Query 10 - Outer Join
#Question: Which vulnerabilities have associated patch records and what is their current patch status?
SELECT V.VulnerabilityName, P.PatchStatus, P.PatchDate 
FROM Vulnerability V 
LEFT OUTER JOIN Patch P 
	ON V.VulnerabilityID = P.VulnerabilityID;
    
#Query 11 - ALL Operator
#Question: Which vulnerabilities have a CVSS score greater than all Medium severity vulnerabilities?
SELECT VulnerabilityName, Severity, CVSSScore 
FROM Vulnerability 
WHERE CVSSScore > ALL ( 
SELECT CVSSScore FROM Vulnerability 
WHERE Severity = 'Medium' 
);