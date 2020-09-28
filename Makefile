build-gradius:
	docker build -f ./greenradius/Dockerfile -t greenradius .
	docker tag greenradius docker.pkg.github.com/toughstruct/greenradius-docker/greenradius
	docker push docker.pkg.github.com/toughstruct/greenradius-docker/greenradius

build-fradius:
	cd ./freeradius && docker build -t freeradius .
	docker tag freeradius docker.pkg.github.com/toughstruct/greenradius-docker/freeradius
	docker push freeradius

build-frmate:
	cd freeradius && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-s -w -extldflags "-static"' -o lfreemate freemate.go
	upx freeradius/lfreemate

all:
	make build-gradius
	make build-fradius

push:
	@read -p "type commit message: " cimsg; \
	git ci -am "$(shell date "+%F %T") $${cimsg}"
	git push origin master

expsql:
	echo "create schema if not exists greenradius collate utf8mb4_unicode_ci;" > greenradius.sql
	echo "CREATE USER IF NOT EXISTS greenradius@'172.%.%.%' identified by 'Bss!2020';" >> greenradius.sql
	echo "GRANT ALL PRIVILEGES ON greenradius.* TO greenradius@'172.%.%.%';" >> greenradius.sql
	echo "ALTER USER 'greenradius'@'172.%.%.%' IDENTIFIED WITH mysql_native_password BY 'Green!2020';\n\n" >> greenradius.sql
	mysqldump -uroot -p -B greenradius --skip-add-locks --no-create-db --skip-lock-tables \
	--extended-insert --complete-insert --create-options --disable-keys --add-drop-table --result-file="tmp.sql"
	cat tmp.sql >> greenradius.sql
	rm -f tmp.sql


.PHONY: clean


