DROP TABLE IF EXISTS node;
CREATE TABLE IF NOT EXISTS node
(
	nodeId varchar(300),
	nodeType varchar(30),
	PRIMARY KEY (nodeId, nodeType)
);

DROP TABLE IF EXISTS edge;
CREATE TABLE IF NOT EXISTS edge
(
	objectId varchar(300),
	objectType varchar(30),
	attributeId varchar(300),
	attributeType varchar(30),
	PRIMARY KEY (objectId, objectType, attributeId, attributeType)
);
