-- Dreycey Albin
-- 04/19/2020
-- COMP543 - AdarIndex

-- Pick nodes in which to compare
\set node1name 'chndm_1958-136-1-x'
\set node2name 'chndm_1958-137-3'

-- Obtain the shared nodes
CREATE TEMPORARY TABLE neighbor_intersection AS 
       SELECT DISTINCT node1.Nieghbors 
       FROM (SELECT DISTINCT t.* 
             FROM (SELECT objectid AS Nieghbors
                   FROM edge
                   WHERE objectid=:'node1name') AS t) as node1,
            (SELECT DISTINCT t.* 
             FROM (SELECT objectid AS Nieghbors
                   FROM edge
                   WHERE objectid=:'node2name') AS t) as node2
       WHERE node1.Nieghbors=node2.Nieghbors;

-- Calculate the values for the summand
CREATE TEMPORARY TABLE neighbor_intersectionWcounts AS
       SELECT NI.Nieghbors, (SELECT 1/LN(COUNT(neighborneighbor.neighborstemp))
       	                     FROM (SELECT e.objectid AS neighborstemp
                                   FROM edge AS e
       			           WHERE e.objectid=NI.nieghbors)) AS neighborneighbor) AS oneOverLog
       FROM neighbor_intersection AS NI;

-- Sum over all summands for a index bewteen the nodes
SELECT SUM(NIwC.oneOverLog) AS Adamic_Adar_index 
FROM neighbor_intersectionWcounts AS NIwC;
