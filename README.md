# Cybersecurity Vulnerability Management Platform

A relational database project designed to simulate vulnerability management operations within an enterprise cybersecurity environment.

## Overview

The Cybersecurity Vulnerability Management Platform is a SQL-based relational database that tracks cybersecurity vulnerabilities, affected organizational assets, analyst assignments, and remediation activities.

This project was developed as part of Purdue University's CNIT 27200 coursework and demonstrates database design principles, normalization, entity relationship modeling, and advanced SQL querying within a cybersecurity-focused domain.

## Features

* Track cybersecurity vulnerabilities and CVE information
* Store organizational asset information
* Assign security analysts to remediation efforts
* Manage many-to-many relationships between vulnerabilities and assets
* Manage many-to-many relationships between vulnerabilities and analysts
* Track patch deployment and remediation activities
* Support cybersecurity reporting through SQL queries

## Database Design

### Entities

#### Vulnerability

Stores information about discovered vulnerabilities including severity level, CVSS score, discovery date, and remediation status.

#### Asset

Stores information about enterprise assets such as servers, workstations, firewalls, and network devices.

#### Analyst

Stores information regarding cybersecurity personnel responsible for vulnerability remediation.

#### VulnerabilityAsset

Bridge table used to support the many-to-many relationship between vulnerabilities and assets.

#### VulnerabilityAssignment

Bridge table used to support the many-to-many relationship between vulnerabilities and analysts.

#### Patch

Stores patch deployment and remediation activity information.

## Entity Relationship Model

### One-to-Many Relationship

```text
Vulnerability (1) --------< Patch (M)
```

### Many-to-Many Relationships

```text
Vulnerability >---- VulnerabilityAsset ----< Asset

Vulnerability >---- VulnerabilityAssignment ----< Analyst
```

## Technologies Used

* SQL
* Relational Database Design
* Entity Relationship Modeling (ERD)
* Database Design Language (DBDL)
* Normalization
* Primary and Foreign Key Constraints

## Sample Queries

### Find Critical Vulnerabilities

```sql
SELECT *
FROM Vulnerability
WHERE Severity = 'Critical';
```

### Calculate Average CVSS Score

```sql
SELECT AVG(CVSSScore) AS AverageCVSSScore
FROM Vulnerability;
```

### Find Assets Affected by Vulnerabilities

```sql
SELECT V.VulnerabilityName,
       A.Hostname
FROM Vulnerability V
INNER JOIN VulnerabilityAsset VA
    ON V.VulnerabilityID = VA.VulnerabilityID
INNER JOIN Asset A
    ON VA.AssetID = A.AssetID;
```

## Project Structure

```text
Cybersecurity-Vulnerability-Management-Platform/
│
├── README.md
├── VulnerabilityManagement.sql
└── Project_Report.pdf
```
