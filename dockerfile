FROM node:alpine AS builder

WORKDIR '/app'

COPY package*.json ./
RUN npm ci
COPY . .

CMD ["npm", "run", "dev"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html