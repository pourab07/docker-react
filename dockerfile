# Build phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
COPY . .
RUN npm install
RUN npm run build

# Run phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
