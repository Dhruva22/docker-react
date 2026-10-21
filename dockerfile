FROM node:alpine AS builder

WORKDIR '/app'

COPY ./packege*.json ./
RUN npm run install
COPY . .

CMD ["npm", "run", "dev"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html