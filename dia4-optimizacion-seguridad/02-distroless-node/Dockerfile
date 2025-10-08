# Construcción
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .

# Imagen final distroless
FROM gcr.io/distroless/nodejs18
WORKDIR /app
COPY --from=build /app .
CMD ["app.js"]
