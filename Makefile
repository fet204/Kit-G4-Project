# Makefile to automate Group4 project submission
# Kit Transue 2022-03-08
default: create import quicktest

create:
	-dropdb group4
	createdb group4
	psql -d group4 --file=TableCreationCode.txt

import:
	(cd 'Table Inputs'; ./import-all.sh)

quicktest:
	psql -d group4 --command='select * from donation d inner join person p on d.userid = p.userid'
