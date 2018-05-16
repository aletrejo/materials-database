

# Drops tables if they already exist in the database to ensure that there is no conflict between tables
DROP TABLE IF EXISTS material_property;
DROP TABLE IF EXISTS material_processing;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS material_type;
DROP TABLE IF EXISTS property_option;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS mat_property;
DROP TABLE IF EXISTS property_type;
DROP TABLE IF EXISTS processing;

#table to store material_type
#Stores the type_id and name with type_id being the primary key
CREATE TABLE material_type(
	material_type_id TINYINT UNSIGNED NOT NULL,
	name VARCHAR(100),
	PRIMARY KEY(material_type_id)
);

#table to store information for material
#stores the id, description, material's type_id, description and location
CREATE TABLE material (
	material_id INTEGER(4) UNSIGNED NOT NULL,
	name VARCHAR(100),
	material_type_id TINYINT UNSIGNED NOT NULL,
	description VARCHAR(2048),
	location varchar(100),
	PRIMARY KEY(material_id),
	FOREIGN KEY (material_type_id) REFERENCES material_type(material_type_id)
);

#table to store material_property
#stores property id, type_id and property's name
CREATE TABLE mat_property(
	property_id SMALLINT UNSIGNED NOT NULL,
	property_type_id SMALLINT UNSIGNED NOT NULL,
	name VARCHAR(100),
	PRIMARY KEY (property_id)
);

#each property can have multiple states e.g tearing resitance could be HIGH, LOW or MEDIUM.
#This is many to many table which can store all the possible states for each property
#stores the property_id and state
CREATE TABLE property_state(
	property_id SMALLINT UNSIGNED NOT NULL,
	state VARCHAR(100),
	FOREIGN KEY (property_id) REFERENCES mat_property(property_id)
);

#each material can have multiple properties.
#this is a many to many table which stores all the possible properties and their respective states for each of the materials
# also stores property description in case only state's information is not enough
CREATE TABLE material_property(
	material_id INTEGER(4) UNSIGNED NOT NULL,
	property_id SMALLINT UNSIGNED NOT NULL,
	property_state VARCHAR(100),
	property_description VARCHAR(256) DEFAULT NULL,
	FOREIGN KEY (material_id) REFERENCES material(material_id),
	FOREIGN KEY (property_id) REFERENCES mat_property(property_id)
);

#processing stores the different applications and processes that the material can be used for
CREATE TABLE processing(
	processing_id SMALLINT UNSIGNED NOT NULL,
	name VARCHAR (100),
	PRIMARY KEY (processing_id)
);

# a many to many table which stores the different materials and processes associated with the table
CREATE TABLE material_processing(
	material_id INTEGER(4) UNSIGNED NOT NULL,
	processing_id SMALLINT UNSIGNED NOT NULL,
	FOREIGN KEY (material_id) REFERENCES material(material_id),
	FOREIGN KEY (processing_id) REFERENCES processing(processing_id)
);
