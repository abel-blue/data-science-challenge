-- Table: raw.briefing
DROP TABLE IF EXISTS extracted;
CREATE TABLE extracted (
    game_key VARCHAR ( 1000 ),
    labels_engagement VARCHAR ( 6000 ),
    labels_clickthr VARCHAR ( 6000 ),
    text_engagement VARCHAR ( 6000 ),
    text_clickthr VARCHAR ( 6000 ),
    colors_engagement_red float8,
    colors_engagement_green float8,
    colors_engagement_blue float8,
    colors_engagement_proportion float8,
    colors_engagement_saturation float8,
    colors_engagement_luminosity float8,
    colors_clickthr_red float8,
    colors_clickthr_green float8,
    colors_clickthr_blue float8,
    colors_clickthr_proportion float8,
    colors_clickthr_saturation float8,
    colors_clickthr_luminosity float8,
    videosd INTEGER,
    eng_type VARCHAR ( 100 ),
    direction VARCHAR ( 100 ),
    adunit_sizex float8,
    adunit_sizey float8
    );

COPY extracted(game_key, labels_engagement, labels_clickthr, text_engagement, 
                           text_clickthr, colors_engagement_red, colors_engagement_green, colors_engagement_blue, colors_engagement_proportion, colors_engagement_saturation, colors_engagement_luminosity, colors_clickthr_red, colors_clickthr_green, colors_clickthr_blue, colors_clickthr_proportion, colors_clickthr_saturation, colors_clickthr_luminosity,
                           videosd, eng_type, direction, adunit_sizex, adunit_sizey)
FROM '/home/abel/workspace/adludio-data-science-challenge/data/extracted_cmp_data.csv'
DELIMITER ','
CSV HEADER;