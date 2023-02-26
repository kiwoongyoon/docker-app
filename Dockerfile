FROM node:alpine as builder 
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install 
COPY ./ ./
RUN npm run build 

FROM nginx 
COPY --from=builder /usr/src/app/build /usr/share/nginx/html 

# docker build . 하고 생성된 이미지 파일로 docker run -p 8080:80 <이미지 이름>