# 🛠️ Refugee Management Database Design

This project is inspired by my experience as a social worker in a nonprofit organization, where I managed refugee cases under a medical assistance program. I created this relational database design to better track client data, service delivery, and case assignments. It reflects real-world requirements such as documentation compliance, service logging, and data reporting to funding agencies.

---

## 🧩 Business Logic Overview

### 1. Client Enrollment

- **1.1 Immigration Status Validation**  
  Clients must have a valid immigration status that qualifies under federal regulations. In the future, integrating a public USCIS API could help validate document types and expiration dates for compliance.

- **1.2 Enrollment Criteria Vary by Program**  
  Enrollment duration and eligibility may differ per program. Exceptions may be granted on humanitarian grounds, based on management discretion.

- **1.3 Program-Specific Eligibility**  
  Not all programs require the same immigration status. A client may qualify for some services and be denied others based on program guidelines.

- **1.4 Required Contact Information**  
  Clients must provide at least one valid contact method: address, phone number, and optionally, email.

- **1.5 Family vs. Individual Cases**  
  A case can involve a single person or a family unit. Family members must share the same address. The **Address** entity is normalized to avoid redundancy (e.g., five identical address entries for a family of five).

- **1.6 Family Roles**  
  Only one family role can be assigned per member, and roles must reflect legally recognized relationships: parent, legal guardian, or minor child.

- **1.7 Adding Family Members**  
  It should be possible to add new family members to an existing case if needed.

---

### 2. Case Management

- **2.1 Case Assignment Criteria**  
  Each case is assigned to one caseworker based on:
  1. Current caseload  
  2. Cultural background match  
  3. Language match

- **2.2 Service Log Tracking**  
  All client interactions must be recorded in a detailed service log.

- **2.3 Service Log Attributes for Reporting**

  - **2.3.1 Service Delivery Mode**  
    1. **Office visit** – Client meets with the caseworker at the office  
    2. **Home visit** – Caseworker visits the client’s home  
    3. **Phone interaction** – Service is delivered over the phone  
    4. **Other** – e.g., scheduling appointments, retrieving lab results, etc.

  - **2.3.2 Service Type**  
    1. **Social Services:** Interpretation and transportation only  
    2. **Case Management:** Includes additional support such as navigating benefits, documentation, and coordination of care

  - **2.3.3 Service Status & Priority**  
    - **Status:** Pending, Completed, or Canceled  
    - **Priority:** High, Medium, or Low

- **2.4 Cross-Case Worker Collaboration**  
  Any caseworker can provide services to clients, even if the case is assigned to another worker. Service logs record the identity of the serving caseworker independently.

---

### 3. Reporting Capabilities

- **3.1 Customizable Reports**  
  The system should support filtering and generating reports based on:
  - Timeframe  
  - Program  
  - Assigned caseworker  
  - Type of service  
  - Any combination of these criteria

Reports will support internal program monitoring and external reporting to funding agencies.

---

## 📝 Notes

- This is a **personal project** for portfolio purposes and may not be used in production by the original organization.
- The business logic reflects the **caseworker's perspective** and may not cover all rules or administrative operations.
- Future development may focus on selected modules only (e.g., service logging or reporting) depending on time and learning goals.

  
  
 
## ⚙️ Tech Stack

- **MySQL 8.0** with InnoDBI'm 
- currently exploring Python as a potential language for the upper layers of this application. While I'm still learning the language, this project serves as a hands-on opportunity to grow my skills in backend development and fullstack 
  architecture.

## 🎯 Main Features

- Refugee profile management
- Caseworker and case tracking
- Service log metadata (date, mode, interpreter, etc.)
- Report-friendly structure

## 🚧 Current Status

- ✅ Schema with primary and foreign keys
- ✅ EER diagram completed
- 🔄 Views and procedures in development
- 🧪 Full-stack integration planned

## 📬 Contact

Created by **Roberto Lago**  
📧 [robertolagob@gmail.com](mailto:robertolagob@gmail.com)
