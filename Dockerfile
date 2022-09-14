FROM node:latest
RUN yum update -y
RUN npm install -g express
RUN npm install -g express-generator
RUN git clone https://github.com/Ranjeetsheelvant/AatmaaniProject.git
WORKDIR AatmaaniProject/nodewebsite/express-website/
RUN npm install
RUN npm install --save nodemailer
ENTRYPOINT npm start
EXPOSE 3000

