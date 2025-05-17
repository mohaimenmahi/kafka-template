build:
	docker compose build --no-cache

run:
	docker compose up

stop:
	docker compose down

logs:
	docker logs --follow kafka

dev: stop run logs

enter:
	docker exec -it kafka bash