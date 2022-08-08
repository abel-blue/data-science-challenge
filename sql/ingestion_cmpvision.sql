DROP TABLE IF EXISTS cmpvision;
CREATE TABLE cmpvision(info json);
SET content "cat /home/abel/workspace/adludio-data-science-challenge/data/global_design_data.json"
INSERT INTO cmpvision VALUES('content');