:: Start with an empty database; no tables:

dropdb group4
createdb  group4



:: Run the table creation code:

psql -d group4 --file=TableCreationCode.txt



:: Populate the tables:

psql -d group4 --file=TablePopulationCode.txt
