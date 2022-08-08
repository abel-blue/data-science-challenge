-- Table: raw.briefing
DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory (
    "type" VARCHAR ( 50 ),
    width VARCHAR ( 10485759 ),
    height VARCHAR ( 10485759 ),
    campaign_id VARCHAR ( 50 ),
    creative_id VARCHAR ( 50 ),
    auction_id VARCHAR ( 50 ),
    browser_ts TIMESTAMP,
    game_key VARCHAR ( 500 ),
    geo_country VARCHAR ( 10485759 ),
    site_name VARCHAR ( 10485759 ),
    platform_os VARCHAR ( 50 ),
    device_type VARCHAR ( 10485759 ),
    browser VARCHAR ( 50 )
);

COPY inventory("type", width ,  height ,  campaign_id ,  creative_id ,  auction_id ,
        browser_ts ,  game_key ,  geo_country ,  site_name ,  platform_os ,
        device_type ,  browser )
FROM '/home/abel/workspace/adludio-data-science-challenge/data/campaigns_inventory_updated.csv'
DELIMITER ','
CSV HEADER;