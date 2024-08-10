FROM node:20-bullseye-slim

WORKDIR /app

RUN apt update && apt install -y git curl

RUN curl -o /java.deb -L https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb

RUN git clone https://github.com/Seeroy/kubek-minecraft-dashboard.git /app && \
    npm install

RUN dpkg -i /java.deb && \
    apt install -yf && \
    rm /java.deb

RUN ln -s $(which java) /app/java

CMD ["npm", "start"]
