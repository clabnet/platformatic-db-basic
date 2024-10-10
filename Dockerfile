FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json platformatic.json ./
COPY services/gemini/package.json services/gemini/package.json

RUN npm ci

COPY . .

RUN npx platformatic compile

FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json platformatic.json ./

RUN npm ci --only=production

COPY --from=builder /app/services/gemini/dist ./dist

EXPOSE 3042

CMD ["node", "node_modules/.bin/platformatic", "start"]

# Allows developers to exec bash command to debug container internals
# ENTRYPOINT ["tail", "-f", "/dev/null"]
