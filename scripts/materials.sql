DROP TABLE IF EXISTS material_type;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS property_type;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS property_option;
DROP TABLE IF EXISTS material_property;
DROP TABLE IF EXISTS processing;
DROP TABLE IF EXISTS material_processing;

CREATE TABLE material_type(
	material_type_id TINYINT UNSIGNED NOT NULL,
	name VARCHAR(100),
	PRIMARY KEY(material_type_id)
);

CREATE TABLE material (
	material_id INTEGER(4) UNSIGNED NOT NULL,
	name VARCHAR(100),
	material_type_id TINYINT UNSIGNED NOT NULL,
	description VARCHAR(500),
	location varchar(100),
	PRIMARY KEY(material_id),
	FOREIGN KEY (material_type_id) REFERENCES material_type(material_type_id)
);

CREATE TABLE property_type(
	property_type_id SMALLINT UNSIGNED NOT NULL,
	name VARCHAR(100),
	PRIMARY KEY(property_type_id)
);

CREATE TABLE property(
	property_id SMALLINT UNSIGNED NOT NULL,
	property_type_id SMALLINT UNSIGNED NOT NULL,
	name VARCHAR(100),
	PRIMARY KEY (property_id),
);

CREATE TABLE property_option(
	property_id SMALLINT UNSIGNED NOT NULL,
	option VARCHAR(100),
	FOREIGN KEY (property_id) REFERENCES property(property_id)
);

CREATE TABLE material_property(
	material_id INTEGER(4) UNSIGNED NOT NULL,
	property_id SMALLINT UNSIGNED NOT NULL,
	property_value VARCHAR(100),
	FOREIGN KEY (material_id) REFERENCES material(material_id),
	FOREIGN KEY (property_id) REFERENCES property(property_id)
);

CREATE TABLE processing(
	processing_id SMALLINT UNSIGNED NOT NULL,
	name VARCHAR (100),
	PRIMARY KEY (processing_id)
);

CREATE TABLE material_processing(
	material_id INTEGER(4) UNSIGNED NOT NULL,
	processing_id SMALLINT UNSIGNED NOT NULL,
	FOREIGN KEY (material_id) REFERENCES material(material_id),
	FOREIGN KEY (processing_id) REFERENCES processing(processing_id)
);
