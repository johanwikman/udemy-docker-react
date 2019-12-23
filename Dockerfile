# build part
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run part
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
