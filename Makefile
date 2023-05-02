help:			## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:			## Build the site
	@if [ "${CF_PAGES}" = 1 ]; then \
		if [ "${CF_PAGES_BRANCH}" = main ]; then \
		  yarn build; \
	  else \
		  yarn build:preview; \
		fi \
	 else \
	   HUGO_BASE_URL=http://localhost:1313 yarn build; \
	 fi

devserver: 		## Start the dev environment server. This will be run in the foreground.
	@docker compose -p illumitacit_policies \
		-f ./deployments/dev/docker/app.docker-compose.yml \
		up

cleandevserver:		## Shut down the dev server.
	# Destroying dev server containers.
	@docker compose -p illumitacit_policies \
		-f ./deployments/dev/docker/app.docker-compose.yml \
		down

cleandevcache:		## Destroy cache volumes (e.g., node, parcel, go packages).
	# Destroying cache volumes for dev server
	@docker volume rm illumitacit_policies_nodemodules illumitacit_policies_parcelcache || true
