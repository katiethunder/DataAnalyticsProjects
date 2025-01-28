/* SQL script analyzing Irish property sales data, focusing on price analysis,
data normalization, and geographical patterns.

Skills demonstrated:
--Database normalization (2NF implementation)
--Data type standardization
--String manipulation and formatting
--View creation and management
--Aggregate functions and grouping
 */

 
/* Calculate the average house price across the whole dataset in €50,000 format */
SELECT
   CONCAT ('€', FORMAT (AVG(price), 0)) AS Avg_Property_Price
FROM
   property;

/* Calculate average house price per county, ordered alphabetically by county */
SELECT
   county,
   CONCAT ('€', FORMAT (AVG(price), 0)) AS Avg_Property_Price
FROM
   property
GROUP BY
   county
ORDER BY
   county;

/* Convert VAT Exclusive text field to boolean data type */
ALTER TABLE property
ADD COLUMN vatExc BOOLEAN;

UPDATE property
SET
   vatExc = IF (vatExclusive = 'YES', TRUE, FALSE);

ALTER TABLE property
DROP COLUMN vatExclusive;

/* Create normalized table for property size descriptions and establish relationships */
SELECT DISTINCT
   propertySizeDescription
FROM
   property;

DROP TABLE IF EXISTS Property_Size_Description;

CREATE TABLE
   Property_Size_Description (
      propertySizeDescID TINYINT NOT NULL AUTO_INCREMENT,
      propertySizeDesc VARCHAR(70),
      PRIMARY KEY (propertySizeDescID)
   );

ALTER TABLE property
ADD COLUMN propertySizeDescID TINYINT,
ADD CONSTRAINT FK_descSizeOfProperty FOREIGN KEY (propertySizeDescID) REFERENCES Property_Size_Description (propertySizeDescID) ON DELETE CASCADE;

/* Populate the property size description lookup table */
INSERT INTO
   Property_Size_Description (propertySizeDesc)
VALUES
   (" "),
   (
      "greater than or equal to 38 sq metres and less than 125 sq metres"
   ),
   ("greater than or equal to 125 sq metres"),
   ("less than 38 sq metres");

/* Update foreign key references and remove redundant column */
UPDATE property
JOIN Property_Size_Description ON Property_Size_Description.propertySizeDesc = property.propertySizeDescription
SET
   property.propertySizeDescID = Property_Size_Description.propertySizeDescID;

ALTER TABLE property
DROP COLUMN propertySizeDescription;

/* Count properties without eircodes */
SELECT
   COUNT(*) sales
FROM
   property
WHERE
   eirCode = "";

/* List top 10 Routing Keys by number of houses sold */
SELECT DISTINCT
   SUBSTRING(eirCode, 1, 3) AS Top10
FROM
   property
GROUP BY
   eirCode
ORDER BY
   Top10 DESC
LIMIT
   10;

/* Create view of top 5 routing keys */
CREATE VIEW
   Top5RoutingKeys AS
SELECT DISTINCT
   SUBSTRING(eirCode, 1, 3) AS Top5
FROM
   property
GROUP BY
   eirCode
ORDER BY
   Top5 DESC
LIMIT
   5;

/* Show Munster property sales for April 2022 */
SELECT
   *
FROM
   property
WHERE
   SUBSTRING(eirCode, 1, 1) IN ("E", "H", "P", "T", "V", "X")
   AND YEAR (dateOfSale) = 2022
   AND MONTH (dateOfSale) = 4;