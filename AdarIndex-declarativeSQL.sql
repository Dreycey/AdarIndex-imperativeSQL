-- Dreycey Albin
-- 04/19/2020
-- COMP543 - AdarIndex

-- Pick nodes in which to compare
\set node1name 'chndm_1896-1-103'
\set node2name 'chndm_1896-1-119'
\set relationselection 'date'

--Obtain the shared nodes
CREATE TEMPORARY TABLE neighbor_intersection AS 
     SELECT DISTINCT node1.Nieghbors 
     FROM (SELECT DISTINCT t.* 
           FROM (SELECT attributeid AS Nieghbors
                 FROM edge
                 WHERE objectid=:'node1name'
                   AND attributetype=:'relationselection') AS t) as node1,
          (SELECT DISTINCT t.* 
           FROM (SELECT attributeid AS Nieghbors
                 FROM edge
                 WHERE objectid=:'node2name'
                   AND attributetype=:'relationselection') AS t) as node2
     WHERE node1.Nieghbors=node2.Nieghbors;

-- count number in intersection (if wanted)
--SELECT COUNT(*)
--FROM neighbor_intersection as ni, edge
--WHERE ni.nieghbors = edge.attributeid

--Calculate the values for the summand
CREATE TEMPORARY TABLE neighbor_intersectionWcounts AS
       SELECT NI.Nieghbors, (SELECT 1/LN(COUNT(foo1.neighborstemp))
       	                     FROM (SELECT e.attributeid AS neighborstemp
                                   FROM edge AS e
       			           WHERE e.attributeid=NI.nieghbors) AS foo1) AS oneOverLog
       FROM neighbor_intersection AS NI;

-- Sum over all summands for a index bewteen the nodes
SELECT SUM(NIwC.oneOverLog) AS Adamic_Adar_index 
FROM neighbor_intersectionWcounts AS NIwC;
