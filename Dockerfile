# Stap 1: bouw de TypeScript broncode
FROM node:24-bookworm-slim AS builder

WORKDIR /app

# Installeer dependencies
COPY package*.json ./
RUN npm ci

# Kopieer broncode en compileer TypeScript naar JavaScript
COPY . .
RUN npm run build

# Stap 2: productie-image (kleiner, zonder devDependencies)
FROM node:24-bookworm-slim AS production

WORKDIR /app

# Kopieer enkel wat nodig is voor productie
COPY package*.json ./
RUN npm ci --omit=dev

# Kopieer gecompileerde code van de builder stap
COPY --from=builder /app/dist ./dist

# Kopieer views en public (EJS templates en CSS)
COPY views ./views
COPY public ./public

EXPOSE 3000

CMD ["node", "dist/index.js"]