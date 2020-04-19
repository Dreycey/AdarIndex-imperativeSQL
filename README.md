# AdarIndex-imperativeSQL
## Dreycey Albin

# Description
This repository has an implementation of the Adamic/Adar index using imperative SQL.

# Commands used to import node and edge table into postgress

* Add the tables 
```
psql -f tableDefs.sql smithsoniandb2
```
* Edges for the network. 
```
psql -c "\copy edge FROM edge.csv delimiter ',' csv;" smithsoniandb2
```
* Nodes for the network.
```
psql -c "\copy node FROM node.csv delimiter ',' csv;" smithsoniandb2
```

# How to run the algorithm
```                     
psql -f AdarIndex-imperativeSQL.sql smithsoniandb2
```

# databases at this point.. 

```
                 List of relations
 Schema |         Name          | Type  |  Owner   
--------+-----------------------+-------+----------
 public | acah_content          | table | postgres
 public | acah_main             | table | postgres
 public | acm_content           | table | postgres
 public | acm_main              | table | postgres
 public | chndm_content         | table | postgres
 public | chndm_main            | table | postgres
 public | edge                  | table | da39
 public | fbr_content           | table | postgres
 public | fbr_main              | table | postgres
 public | fsa_content           | table | postgres
 public | fsa_main              | table | postgres
 public | fsg_content           | table | da39
 public | fsg_main              | table | da39
 public | hac_content           | table | postgres
 public | hac_main              | table | postgres
 public | hmsg_content          | table | postgres
 public | hmsg_main             | table | postgres
 public | hsfa_content          | table | postgres
 public | hsfa_main             | table | postgres
 public | naa_content           | table | postgres
 public | naa_main              | table | postgres
 public | nasm_content          | table | postgres
 public | nasm_main             | table | postgres
 public | nmaahc_content        | table | postgres
 public | nmaahc_main           | table | postgres
 public | nmnheducation_content | table | postgres
 public | nmnheducation_main    | table | postgres
 public | nmnhminsci_main       | table | postgres
 public | node                  | table | da39
 public | npg_content           | table | postgres
 public | npg_main              | table | postgres
 public | npm_content           | table | da39
 public | npm_main              | table | da39
 public | saam_content          | table | postgres
 public | saam_main             | table | postgres
 public | si_content            | table | postgres
 public | si_main               | table | postgres
 public | sia_content           | table | postgres
 public | sia_main              | table | postgres
 public | sil_content           | table | postgres
 public | sil_main              | table | postgres
```

I want: 

* chndm_content
* node
* edge

# Looking at helpful attributes in "chndm_content"
```
SELECT freetext_date_content, 
		freetext_identifier_content, 
		freetext_physicaldescription_content, 
		descriptivenonrepeating_title_content,
		descriptivenonrepeating_title_sort,
		freetext_creditline_content,
		freetext_place_content,
		indexedstructured_date,
        indexedstructured_place,
		indexedstructured_topic,
		indexedstructured_name
FROM chndm_content;
```

# Node and edges-- an evaluation 

* There are 13 different node types

 dateFreeText
 country
 placeHierarchy
 state
 place
 nodetype
 date
 continent
 object
 acqYear
 creator
 topic
 city

amusements,topic
graphic arts,topic
landscapes,topic
dyes and dyeing,topic
industrial design,topic
architecture,topic
transportation,topic
weaving,topic
crickets,topic


* As for edges, 


 smithsoniandb2 
 attributetype  
----------------
 attributetype
 city
 continent
 country
 creator
 date
 dateFreeText
 place
 placeHierarchy
 state
 topic
(11 rows)

chndm_2009-6-57,object,architecture,topic
chndm_2009-6-58,object,architecture,topic
chndm_2009-6-6,object,architecture,topic
chndm_2009-6-7,object,architecture,topic
chndm_2009-6-8,object,architecture,topic
chndm_2009-6-9,object,architecture,topic
chndm_2010-31-334,object,landscapes,topic
chndm_1958-136-1-x,object,"1768, published 1770",dateFreeText
chndm_1958-136-1-z,object,"1768, published 1770",dateFreeText
chndm_1958-137-1-a_b,object,1767–70,dateFreeText
chndm_1958-137-2,object,ca. 1780,dateFreeText
chndm_1958-137-3,object,1732–1735,dateFreeText
chndm_1958-140-1,object,19th century,dateFreeText
chndm_1958-140-10,object,19th century,dateFreeText
chndm_1958-140-16-a_c,object,late 19th century,dateFreeText

