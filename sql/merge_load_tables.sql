
DROP TABLE IF EXISTS inv_bri;
CREATE TABLE inv_bri AS
SELECT * FROM inventory LEFT JOIN briefing using(campaign_id);

DROP TABLE IF EXISTS merged;
CREATE TABLE merged AS
SELECT * FROM inv_bri LEFT JOIN extracted using(game_key);

