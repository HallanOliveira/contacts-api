IMAGE_NAME=contacts-api

PORT=3000

dev-build:
	docker build --build-arg NODE_ENV=development -t $(IMAGE_NAME)-dev .

dev-run:
	docker run -d --rm --name $(IMAGE_NAME)-dev -it -p $(PORT):3000 -v $$(pwd):/app $(IMAGE_NAME)-dev

dev: dev-build dev-run

prod-build:
	docker build --build-arg NODE_ENV=production -t $(IMAGE_NAME)-prod .

prod-run:
	docker run --rm -it -p $(PORT):3000 $(IMAGE_NAME)-prod

prod: prod-build prod-run

clean:
	docker rmi -f $(IMAGE_NAME)-dev $(IMAGE_NAME)-prod || true
