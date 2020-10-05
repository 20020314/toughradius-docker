build-tradius:
	cd ./toughradius && docker build  -t toughradius .
	docker tag toughradius toughstruct/toughradius
	docker push toughstruct/toughradius

build-fradius:
	cd ./freeradius && docker build -t freeradius .
	docker tag freeradius toughstruct/freeradius
	docker push toughstruct/freeradius

build-frmate:
	cd freeradius && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-s -w -extldflags "-static"' -o lfreemate freemate.go
	upx freeradius/lfreemate

build-all:
	make build-tradius
	make build-fradius

github:
	docker tag toughradius docker.pkg.github.com/toughstruct/toughradius-docker/toughradius
	docker push docker.pkg.github.com/toughstruct/toughradius-docker/toughradius
	docker tag freeradius docker.pkg.github.com/toughstruct/toughradius-docker/freeradius
	docker push docker.pkg.github.com/toughstruct/toughradius-docker/freeradius

push:
	@read -p "type commit message: " cimsg; \
	git ci -am "$(shell date "+%F %T") $${cimsg}"
	git push origin master

expsql:
	echo "create schema if not exists toughradius collate utf8mb4_unicode_ci;" > toughradius.sql
	echo "CREATE USER IF NOT EXISTS toughradius@'172.%.%.%' identified by 'Bss!2020';" >> toughradius.sql
	echo "GRANT ALL PRIVILEGES ON toughradius.* TO toughradius@'172.%.%.%';" >> toughradius.sql
	echo "ALTER USER 'toughradius'@'172.%.%.%' IDENTIFIED WITH mysql_native_password BY 'Tough!2020';\n\n" >> toughradius.sql
	mysqldump -uroot -p -B toughradius --skip-add-locks --no-create-db --skip-lock-tables \
	--extended-insert --complete-insert --create-options --disable-keys --add-drop-table --result-file="tmp.sql"
	cat tmp.sql >> toughradius.sql
	rm -f tmp.sql


.PHONY: clean


