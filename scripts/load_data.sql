#the following commands load the data in their respective tables
#the date is stored in the data director
LOAD DATA LOCAL INFILE "data/material_types.txt" INTO TABLE material_type;
LOAD DATA LOCAL INFILE "data/materials.txt" INTO TABLE material;
LOAD DATA LOCAL INFILE "data/properties.txt" INTO TABLE mat_property;
LOAD DATA LOCAL INFILE "data/property_state.txt" INTO TABLE property_state;
LOAD DATA LOCAL INFILE "data/material_properties.txt" INTO TABLE material_property;
