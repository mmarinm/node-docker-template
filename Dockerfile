FROM node:latest
WORKDIR /app/
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install pm2 -g
RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:dateFormat YYYY-MM-DD

CMD ["pm2-docker", "start", "ecosystem.config.js"]