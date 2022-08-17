-- Table: raw.briefing
DROP TABLE IF EXISTS briefing;
CREATE TABLE briefing (
	campaign_id VARCHAR ( 50 ),
	campaign_name VARCHAR ( 255 ),
	"Submission Date" TIMESTAMP,
	"Description" VARCHAR ( 10485759 ),
	"Campaign Objectives" VARCHAR ( 255 ),
       KPIs VARCHAR ( 50 ),
       "Placement(s)" VARCHAR ( 255 ),
	StartDate DATE,
	EndDate DATE,
	"Serving Location(s)" VARCHAR ( 255 ),
       "Black/white/audience list included?" VARCHAR ( 255 ),
	"Delivery Requirements (Black/Audience/White List)" VARCHAR ( 255 )  ,
       "Cost Centre" VARCHAR ( 255 ),
       Currency VARCHAR ( 255 ),
       "Buy Rate (CPE)" float8,
	"Volume Agreed" float8  ,
       "Gross Cost/Budget" float8  ,
       "Agency Fee" VARCHAR ( 50 )  ,
       "Percentage" float8  ,
       "Flat Fee" VARCHAR ( 50 )   ,
       "Net Cost" float8	
);

COPY briefing(campaign_id, campaign_name, "Submission Date", "Description",
       "Campaign Objectives", KPIs, "Placement(s)", StartDate, EndDate,
       "Serving Location(s)", "Black/white/audience list included?",
       "Delivery Requirements (Black/Audience/White List)", "Cost Centre",
       Currency, "Buy Rate (CPE)", "Volume Agreed", "Gross Cost/Budget",
       "Agency Fee", "Percentage", "Flat Fee", "Net Cost")
FROM '/home/abel/workspace/adludio-data-science-challenge/data/briefing.csv'
DELIMITER ','
CSV HEADER;