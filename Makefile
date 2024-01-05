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


# ===== clean

clean-containers: clean-frontend clean-backend clean-db

# remove docker images
docker-clean: docker-clean-db docker-clean-backend docker-clean-frontend

# wipeout everything that can be
clean-all: clean-containers docker-clean

# =========== build 

build-containers: build-frontend build-backend build-db

docker-build: docker-build-frontend docker-build-backend docker-build-db

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
