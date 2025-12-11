FROM node:lts-alpine AS base
WORKDIR /app

# Enable corepack for pnpm/yarn if needed in future, though we use npm here
ENV NODE_ENV=production

FROM base AS build
COPY package.json package-lock.json ./
RUN npm ci --include=dev
COPY . .
RUN npm run build

FROM base AS runtime
COPY --from=build /app/dist ./dist
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/package-lock.json ./package-lock.json

# Install only production dependencies
RUN npm ci --omit=dev

ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321

CMD ["npm", "run", "preview", "--", "--host"]
