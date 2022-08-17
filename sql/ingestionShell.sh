psql -h localhost -p 5432 -d postgres -U postgres 
abel6464
# Ingestion process for the 3 data sets
\i '/home/abel/workspace/adludio-data-science-challenge/sql/ingestion_briefing.sql'
\i '/home/abel/workspace/adludio-data-science-challenge/sql/ingestion_cmpvision.sql'
\i '/home/abel/workspace/adludio-data-science-challenge/sql/ingestion_inventory.sql'