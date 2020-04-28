CREATE TABLE IF NOT EXISTS edge
(
	objectId varchar(300),
	objectType varchar(30),
	attributeId varchar(300),
	attributeType varchar(30),
	PRIMARY KEY (objectId, objectType, attributeId, attributeType)
);
