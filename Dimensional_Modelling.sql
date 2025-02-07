CREATE DATABASE Hospital_Bed_Capacity;

Use Hospital_Bed_Capacity;

-- Create business table (Dimension Table 1)
CREATE TABLE business (
    ims_org_id VARCHAR(15) PRIMARY KEY,
    business_name VARCHAR(255),
    ttl_license_beds INT,
    ttl_census_beds INT,
    ttl_staffed_beds INT,
    bed_cluster_id INT
);

-- Create bed_type table (Dimension Table 2)
CREATE TABLE bed_type (
    bed_id INT PRIMARY KEY,
    bed_code VARCHAR(10),
    bed_desc VARCHAR(255)
);

-- Create bed_fact table (Fact Table)
CREATE TABLE bed_fact (
    ims_org_id VARCHAR(15),
    bed_id INT,
    license_beds INT,
    census_beds INT,
    staffed_beds INT,
    FOREIGN KEY (ims_org_id) REFERENCES business(ims_org_id),
    FOREIGN KEY (bed_id) REFERENCES bed_type(bed_id)
);
-- Check duplicates
SELECT ims_org_id, COUNT(*) as 'Num'
FROM business
GROUP BY ims_org_id
HAVING COUNT(*) > 1;

#1. Total number of licensed beds (total beds allowed by state license)

SELECT MIN(f.ims_org_id), 
       b.business_name, 
       SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.license_beds ELSE 0 END) AS 'ICU Lic Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.license_beds ELSE 0 END) AS 'SICU Lic Beds',
	   SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.census_beds ELSE 0 END) AS 'ICU Census Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.census_beds ELSE 0 END) AS 'SICU Census Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.staffed_beds ELSE 0 END) AS 'ICU Staff Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.staffed_beds ELSE 0 END) AS 'SICU Staff Beds'
FROM bed_fact f
LEFT JOIN business b ON b.ims_org_id = f.ims_org_id
LEFT JOIN bed_type t ON t.bed_id = f.bed_id
WHERE t.bed_desc = 'icu' OR t.bed_desc = 'sicu'
GROUP BY b.business_name
ORDER BY SUM(f.license_beds) DESC
LIMIT 10;

#2. Total number of  census beds (total beds at the hospital)
SELECT MIN(f.ims_org_id), 
       b.business_name, 
       SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.license_beds ELSE 0 END) AS 'ICU Lic Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.license_beds ELSE 0 END) AS 'SICU Lic Beds',
	   SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.census_beds ELSE 0 END) AS 'ICU Census Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.census_beds ELSE 0 END) AS 'SICU Census Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.staffed_beds ELSE 0 END) AS 'ICU Staff Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.staffed_beds ELSE 0 END) AS 'SICU Staff Beds'
FROM bed_fact f
LEFT JOIN business b ON b.ims_org_id = f.ims_org_id
LEFT JOIN bed_type t ON t.bed_id = f.bed_id
WHERE t.bed_desc = 'icu' OR t.bed_desc = 'sicu'
GROUP BY b.business_name
ORDER BY SUM(f.census_beds) DESC
LIMIT 10;

#3. Total number of staffed beds (total beds for which staffing, e.g., physicians and nurses, exists)
SELECT MIN(f.ims_org_id), 
       b.business_name, 
       SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.license_beds ELSE 0 END) AS 'ICU Lic Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.license_beds ELSE 0 END) AS 'SICU Lic Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.census_beds ELSE 0 END) AS 'ICU Census Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.census_beds ELSE 0 END) AS 'SICU Census Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'icu' THEN f.staffed_beds ELSE 0 END) AS 'ICU Staff Beds',
       SUM(CASE WHEN LOWER(t.bed_desc) = 'sicu' THEN f.staffed_beds ELSE 0 END) AS 'SICU Staff Beds'
FROM bed_fact f
LEFT JOIN business b ON b.ims_org_id = f.ims_org_id
LEFT JOIN bed_type t ON t.bed_id = f.bed_id
WHERE t.bed_desc = 'icu' OR t.bed_desc = 'sicu'
GROUP BY b.business_name
ORDER BY SUM(f.staffed_beds) DESC
LIMIT 10;


