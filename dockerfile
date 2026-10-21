FROM node:alpine as builder

WORKDIR '/app'

COPY ./packege*.json ./
RUN npm run install
COPY . .

cmd ["npm", "run", "dev"]

FROM nginx as runner
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html