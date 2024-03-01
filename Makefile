PROJECT = vue_joke_server

# make notes
#	tab at beginning of line
# - at beginning of line will ignore errors
# \ at end of line ignores carriage return to make it all act as single line
# make sure there is no space after \ 
# first target is default (if you don't specify another target) - help target is first because it is harmless if run
# @ will tell it to not display the command, just its output.
# if target will run other targets they are all on the same line





help:
	@echo read the makefile

local-up: 
	docker compose -f compose-local.yml up

local-down:
	docker compose -f compose-local.yml down

remote-up:
	docker compose -f compose-remote.yml up

remote-down:
	docker compose -f compose-remote.yml down


# ===== clean ===============

clean-containers: clean-frontend clean-backend clean-db clean-rabbitmq clean-stats clean-email clean-flask

# remove docker images
docker-clean: docker-clean-db docker-clean-backend docker-clean-frontend docker-clean-rabbitmq docker-clean-stats docker-clean-email docker-clean-flask

# wipeout everything that can be
clean-all: clean-containers docker-clean

# =========== build ==============

build-containers: build-frontend build-backend build-db build-rabbitmq build-stats build-email build-flask

docker-build: docker-build-frontend docker-build-backend docker-build-db docker-build-rabbitmq docker-build-stats docker-build-email docker-build-flask

build-all: build-containers docker-build

rebuild-all: local-down clean-all build-all local-up

# ============= frontend ===============

clean-frontend:
	-rm -rf docker_containers/frontend/node_modules
	-rm -rf docker_containers/frontend/dist

docker-clean-frontend:
# not needed because we are not using a custom docker image - it bind mounts from docker compose
	
build-frontend: docker_containers/frontend/.env
	-cd docker_containers/frontend; npm install 
	-cd docker_containers/frontend; npm run build 

docker-build-frontend:

rebuild-frontend: clean-frontend docker-clean-frontend build-frontend docker-build-frontend
	

# ============= backend ================
clean-backend:
	-rm -rf docker_containers/backend/node_modules

build-backend:
	cd docker_containers/backend; npm install

docker-clean-backend:
	-docker image rm -f \
		`docker images ${PROJECT}-backend -q`

docker-build-backend:
	docker build \
		--tag ${PROJECT}-backend \
		docker_containers/backend

rebuild-backend: clean-backend docker-clean-backend build-backend docker-build-backend

# ============ db ================
# clean-db and build-db are placeholders in case they are needed.
clean-db:

docker-clean-db:
	-docker image rm -f \
		`docker images ${PROJECT}-db -q`

build-db:

docker-build-db:
	docker build \
		--tag ${PROJECT}-db \
		docker_containers/db

rebuild-db: clean-db docker-clean-db build-db docker-build-db

# ========= rabbitmq ===========
# clean-rabbitmq and build-rabbitmq are placeholders in case they are needed.
clean-rabbitmq:

docker-clean-rabbitmq:
	-docker image rm -f \
	  `docker images ${PROJECT}-rabbitmq -q`

build-rabbitmq:

docker-build-rabbitmq:
	docker build \
		--tag ${PROJECT}-rabbitmq \
		docker_containers/rabbitmq

rebuild-rabbitmq: clean-rabbitmq docker-clean-rabbitmq build-rabbitmq docker-build-rabbitmq

# ========= stats ===========
# clean-stats and build-stats are placeholders in case they are needed.
clean-stats:

docker-clean-stats:
	-docker image rm -f \
	  `docker images ${PROJECT}-stats -q`

build-stats:

docker-build-stats:
	docker build \
		--tag ${PROJECT}-stats \
		docker_containers/stats

rebuild-stats: clean-stats docker-clean-stats build-stats docker-build-stats

# =========== email ===============
# clean-email and build-email are placeholders in case they are needed.
clean-email:

docker-clean-email:
	-docker image rm -f \
	  `docker images ${PROJECT}-email -q`

build-email:

docker-build-email:
	docker build \
		--tag ${PROJECT}-email \
		docker_containers/email

rebuild-email: clean-email docker-clean-email build-email docker-build-email

# =========== flask ===============
# clean-flask and build-flask are placeholders in case they are needed.
clean-flask:

docker-clean-flask:
	-docker image rm -f \
	  `docker images ${PROJECT}-flask -q`

build-flask:

docker-build-flask:
	docker build \
		--tag ${PROJECT}-flask \
		docker_containers/flask

rebuild-flask: clean-flask docker-clean-flask build-flask docker-build-flask
