# Contacts API

A simple **Contacts API** built with **Node.js**, **TypeScript**, and **Express**, following a clean architecture structure.
This project is designed as a portfolio project and demonstrates best practices in TypeScript, Docker, and project structure.

## Project Structure

```
src/
 ├─ application/      # Use cases (business logic orchestration)
 ├─ domain/           # Entities, models, and interfaces
 ├─ infrastructure/   # Database and repositories
 ├─ ui/               # HTTP layer, controllers, and routes
 └─ index.ts          # Entry point
```

## Prerequisites

* Node.js >= 20 (optional if using Docker)
* Docker and Docker Compose
* Make (optional, for convenience)

## Run the Project

### Using Makefile (recommended)

#### Development (hot reload)

```bash
make dev
```

* Runs the API in development mode.
* Uses `ts-node-dev` for hot reload.
* Maps local source code into the container.

#### Production (build + node dist)

```bash
make prod
```

* Builds the TypeScript project to `dist/`.
* Runs the compiled code using `node dist/index.js`.

#### Clean images

```bash
make clean
```

* Removes development and production Docker images.

### Using Docker directly

#### Development

```bash
docker build --build-arg NODE_ENV=development -t contacts-api-dev .
docker run -d --rm --name contacts-api-dev -p 3000:3000 -v $(pwd):/app contacts-api-dev
```

#### Production

```bash
docker build --build-arg NODE_ENV=production -t contacts-api-prod .
docker run -d --rm --name contacts-api-prod -p 3000:3000 contacts-api-prod
```

## API Endpoints

* **GET /** – Health check. Returns: `Contacts API is running 🚀`.
* **GET /contacts** – List all contacts.
* **POST /contacts** – Create a new contact.
  Example request body:

  ```json
  {
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "1234567890"
  }
  ```

## Technology Stack

* Node.js + TypeScript
* Express.js
* Docker / Docker Compose
* Clean Architecture / DDD-inspired structure

## Notes

* This project is intended for portfolio purposes.
* In development mode, hot reload is enabled using `ts-node-dev`.
* In production mode, the TypeScript code is compiled to JavaScript in `dist/`.
* Container names and image tags are managed via the `Makefile`.
