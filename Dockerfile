# Stage 1: Build
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Stage 2: Serve
FROM node:18
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["npm", "start"]
