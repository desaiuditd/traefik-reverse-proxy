######################################
# 🐳 Start/Stop the app in docker 🐳 #
######################################

up:
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.local.yaml \
		up -d
.PHONY: up

down:
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.local.yaml \
		down
.PHONY: down

destroy:
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.local.yaml \
		down -v
.PHONY: destroy

restart:
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.local.yaml \
		down && \
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.local.yaml \
		up -d
.PHONY: restart

#######################################################
# 🚀 Production Deploy (Do not run these in local) 🚀 #
#######################################################

up-production:
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.production.yaml \
		up -d
.PHONY: up-production

down-production:
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.production.yaml \
		down
.PHONY: down-production

restart-production:
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.production.yaml \
		down && \
	docker compose \
		-f docker-compose.yaml \
		-f docker-compose.production.yaml \
		up -d
.PHONY: restart-production

pull:
	git stash && git pull origin main && git stash pop
.PHONY: pull
