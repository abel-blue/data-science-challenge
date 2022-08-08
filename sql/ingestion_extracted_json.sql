-- Table: raw.briefing
DROP TABLE IF EXISTS extracted;
CREATE TABLE extracted (
    game_key VARCHAR ( 1000 ),
    labels_engagement VARCHAR ( 6000 ),
    labels_clickthr VARCHAR ( 6000 ),
    text_engagement VARCHAR ( 6000 ),
    text_clickthr VARCHAR ( 6000 ),
    videosd INTEGER,
    eng_type VARCHAR ( 100 ),
    direction VARCHAR ( 100 )
);

COPY extracted(game_key,labels_engagement,labels_clickthr,text_engagement,
               text_clickthr,videosd,eng_type,direction)
FROM '/home/abel/workspace/adludio-data-science-challenge/data/cleaned_cmp_data.csv'
DELIMITER ','
CSV HEADER;