-- Table: raw.briefing
DROP TABLE IF EXISTS new_records;
CREATE TABLE new_records AS
SELECT * FROM inventory LEFT JOIN briefing using(campaign_id);

DROP TABLE IF EXISTS merged_record;
CREATE TABLE merged_record AS
SELECT * FROM new_records LEFT JOIN extracted using(game_key);

