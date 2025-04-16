DROP DATABASE IF EXISTS refugeedb;
CREATE DATABASE refugeedb;
Use refugeedb;


-- Document table
-- This table stores the document information of refugees
-- It includes mainly the inmigration type of document, issue date, and expiration date
create TABLE IF NOT EXISTS document (
    doc_id INT NOT NULL AUTO_INCREMENT,
    doc_type VARCHAR(50) NOT NULL,
    doc_number VARCHAR(20) NOT NULL,
    doc_issue_date DATE NOT NULL,
    doc_expiry_date DATE NOT NULL,
    PRIMARY KEY (doc_id),
    UNIQUE (doc_number) 
    
);


create Table IF NOT EXISTS region(
    region_id INT NOT NULL AUTO_INCREMENT,
    region_name varchar(100) NOT NULL DEFAULT '',
    PRIMARY KEY (region_id),
    UNIQUE (region_name)
);


-- Country table
-- This table stores a general list of  countries names and region  
create TABLE IF NOT EXISTS country (
    count_id INT NOT NULL AUTO_INCREMENT,
    count_name VARCHAR(100) NOT NULL,
    region_id INT NOT NULL,
    PRIMARY KEY (count_id),
    FOREIGN KEY (region_id) REFERENCES region(region_id),
    UNIQUE (count_name)
    -- The country name and region are unique
);

-- Languages table
-- This table stores a general list of languages names and its id

create TABLE IF NOT EXISTS languages (
    lang_id INT NOT NULL AUTO_INCREMENT,
    lang_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (lang_id),
    UNIQUE (lang_name)
);



-- Refugee table
-- This table stores the refugee information and is the one of the most important entity table
-- The language id is used to identify the language of the refugee
-- The contact id is used to identify the contact information of the refugee
-- The family_role is used to identify whether the refugee is an individual or a family member and which role if so
-- The document id is used to identify the documents associated with the refugee
-- The country id is used to identify the country of the refugee

create TABLE IF NOT EXISTS refugee (
    ref_id INT NOT NULL AUTO_INCREMENT,
    ref_name VARCHAR(50) NOT NULL,
    ref_lastname VARCHAR(100) NOT NULL,
    ref_gender VARCHAR(10) NOT NULL,
    ref_anumber VARCHAR(20) NOT NULL,
    ref_dob DATE NOT NULL,
    ref_phone VARCHAR(15)  NOT NULL DEFAULT 'N/A',
    ref_email VARCHAR(100) NOT NULL DEFAULT 'N/A',
    ref_family_role ENUM('Casehead','Spouse','Legal Guardian', 'Child', 'Self') NOT NULL,
    ref_reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    lang_id INT NOT NULL,                        
    count_id INT NOT NULL,                       
	doc_id  INT NOT NULL,
    PRIMARY KEY (ref_id),
    FOREIGN KEY (doc_id) REFERENCES document(doc_id),
    FOREIGN KEY (count_id) REFERENCES country(count_id),
    FOREIGN KEY (lang_id) REFERENCES languages(lang_id),
    UNIQUE (ref_name,ref_lastname, ref_anumber,ref_family_role) 
    -- The refugee name, lastname ,alien number is an unique cobination
); 

create TABLE IF NOT EXISTS raddress (
    raddress_id INT NOT NULL AUTO_INCREMENT,
    raddress_fromdate DATETIME DEFAULT CURRENT_TIMESTAMP,
    raddress_street VARCHAR(255) NOT NULL,
    raddress_city VARCHAR(50) NOT NULL,
    raddress_state VARCHAR(50) NOT NULL,
    raddress_zipcode VARCHAR(10) NOT NULL,
    ref_id INT NOT NULL,
    PRIMARY KEY (raddress_id),
    FOREIGN KEY (ref_id) REFERENCES refugee(ref_id)
    );






-- Program table
-- This table stores the program information
create TABLE IF NOT EXISTS program (
    program_id INT NOT NULL AUTO_INCREMENT,
    program_name VARCHAR(50) NOT NULL,
    program_funding VARCHAR(100) NOT NULL,
    PRIMARY KEY (program_id)
    
);




-- Caseworker table
-- This table stores the caseworker information
-- It includes the caseworker name, lastname, email, phone number, and program
-- The program is the type of program the caseworker is assigned to
-- The casewoeorker as per bussiness rules can only be assigned to one program
create TABLE IF NOT EXISTS caseworker (
    cw_id INT NOT NULL AUTO_INCREMENT,
    cw_name VARCHAR(50) NOT NULL,
    cw_lastname VARCHAR(100) NOT NULL,
    cw_email VARCHAR(100) NOT NULL,
    cw_phone_number VARCHAR(15) NOT NULL,
    cw_role ENUM('Caseworker','Coordinator', 'Manager', 'Director') NOT NULL,
    program_id INT NOT NULL,
    PRIMARY KEY (cw_id),
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    UNIQUE (cw_name,cw_lastname)
);

--  Services Log 

/*
In the followign tables we will store the information of the services provided to the refugees.
This tables stores the services and it many categories/classification levels . 
since this type of non-profit organization are requied to provide
a variety of services to the refugees but also requiered to provide an extensive and detailed reports to funding entities,
also considering that every category or service description will be written vastly and repeatedly is convenient creatign 
a table to store each grpoups of categories  or classification as bussiness rules defines and refferring those categories/classification 
wiht an indetifir to avoid redundance, ensure consistency and improve performance for joins and queries. 
*/


-- Service_type table
-- for funding organization services like interpretation or transportation are considered as social services
-- All the other services like repsentation, case management etc will be called as case management services

create TABLE IF NOT EXISTS serv_category (
    serv_category_id INT NOT NULL AUTO_INCREMENT,
    serv_category_items ENUM('Transportation','Interpretation', 'Case Management') NOT NULL DEFAULT 'Case Management',
    PRIMARY KEY (serv_category_id)
);




-- Service_modality table
-- a service also is clasified depending on physical way of delivery

create TABLE IF NOT EXISTS serv_modality (
serv_modality_id INT NOT NULL AUTO_INCREMENT,
serv_modality ENUM('Office','Visit','Email', 'Phone') NOT NULL,
PRIMARY KEY (serv_modality_id)
);




-- Service status table
-- the serice status is used to track the status of the service provided to the refugee
-- The status is used to generate reports like the total amount provides services for each program
-- Also helps the case managers to keep track on  pending tasks and managers to check worloads

create TABLE IF NOT EXISTS serv_status(
    serv_status_id INT NOT NULL AUTO_INCREMENT,
    serv_status ENUM('Pending', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Pending',
    PRIMARY KEY (serv_status_id)
);

-- service priority table
-- The service priority is used to track the priority of the service need be provided to the refugee

create TABLE IF NOT EXISTS serv_priority(
    serv_priority_id INT NOT NULL AUTO_INCREMENT,
    serv_priority ENUM('High', 'Medium', 'Low') NOT NULL DEFAULT 'Medium',
    PRIMARY KEY (serv_priority_id)
);




-- Services table
-- This table stores the services provided to the refugee
-- It includes the service date, modality, status, and priority of the sercvice 


create TABLE IF NOT EXISTS  services(
    services_id INT NOT NULL AUTO_INCREMENT,
    Serv_origin ENUM ('Caseworker','Agency','Third') NOT NULL DEFAULT 'Caseworker',
    serv_provider varchar(100) NOT NULL,
    serv_description VARCHAR(255) NOT NULL,
    service_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    serv_modality_id INT NOT NULL,
    serv_status_id INT NOT NULL,
    serv_priority_id INT NOT NULL,
    serv_category_id INT NOT NULL,
    PRIMARY KEY (services_id),
    FOREIGN KEY (serv_category_id) REFERENCES serv_category(serv_category_id),
    FOREIGN KEY (serv_modality_id) REFERENCES serv_modality(serv_modality_id),
    FOREIGN KEY (serv_status_id) REFERENCES serv_status(serv_status_id),
    FOREIGN KEY (serv_priority_id) REFERENCES serv_priority(serv_priority_id)
    
        
);



-- Case_ref table
-- This table stores the case information of the refugee
-- It includes the amoutn of refugees in the case, the case status, the case enrollment date, the refugee id/s, and the program id 

create TABLE IF NOT EXISTS case_ref (
    case_id INT NOT NULL AUTO_INCREMENT,
    ref_id INT NOT NULL,
    case_status ENUM ('Pending','Active','Inactive') NOT NULL DEFAULT 'Pending',
    case_enrrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    case_closure_date DATETIME DEFAULT NULL,
    program_id INT NOT NULL,
    services_id INT NOT NULL,
    PRIMARY KEY (case_id), 
    FOREIGN KEY (ref_id) REFERENCES refugee(ref_id),
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    FOREIGN KEY (services_id) REFERENCES services(services_id)   
    
);


-- asignment table   
-- This table stores the caseworker assignment to the refugee
-- It includes the case id, the caseworker id, and the assignment date

create TABLE IF NOT EXISTS assignment(
    asig_id INT NOT NULL AUTO_INCREMENT,
    asig_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    case_id INT NOT NULL,
    cw_id INT NOT NULL,
    PRIMARY KEY (asig_id),
    FOREIGN KEY (case_id) REFERENCES case_ref(case_id) ON DELETE CASCADE,
    FOREIGN KEY (cw_id) REFERENCES caseworker(cw_id)
);

