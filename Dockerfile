# Base
FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./
COPY tsconfig.json ./

# Dependências
FROM base AS deps
ARG NODE_ENV=production
RUN if [ "$NODE_ENV" = "production" ]; then \
      npm install --omit=dev; \
    else \
      npm install; \
    fi

# Build (sempre compila, mesmo dev)
FROM deps AS builder
COPY src ./src
RUN npx tsc

# Runtime
FROM node:20-alpine AS runtime
WORKDIR /app
ARG NODE_ENV
COPY --from=deps /app/node_modules ./node_modules
COPY package*.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/src ./src

EXPOSE 3000
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"production\" ]; then node dist/index.js; else npm run dev; fi"]
