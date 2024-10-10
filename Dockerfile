FROM node:20-alpine AS builder

USER root

RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app

COPY package.json pnpm-lock.yaml tsconfig.json .npmrc ./

COPY services/gemini/platformatic.json services/gemini/global.d.ts ./
COPY services/gemini/migrations   migrations
COPY services/gemini/types        types
COPY services/gemini/routes       routes
COPY services/gemini/plugins      plugins

RUN pnpm install --fix-lockfile --frozen-lockfile
RUN pnpm run build

EXPOSE 3042
CMD ["platformatic", "start"]

# Allows developers to exec bash command to debug container internals
# ENTRYPOINT ["tail", "-f", "/dev/null"]
