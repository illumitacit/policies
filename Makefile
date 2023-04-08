help:			## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

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
