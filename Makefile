pull:
	git stash && git pull origin main && git stash pop

restart:
	docker-compose down && docker-compose up -d
