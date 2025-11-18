FROM node:20-bullseye

# cài các dependency cần thiết cho Playwright
RUN apt-get update && apt-get install -y \
    libnss3 libatk-bridge2.0-0 libgtk-3-0 libx11-xcb1 libxcomposite1 libxdamage1 \
    libxrandr2 libgbm1 libpango1.0-0 libcups2 libasound2 libxshmfence1 wget curl unzip

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npx playwright install --with-deps chromium

COPY . .

ENV NODE_ENV=production

EXPOSE 10000

CMD ["node", "server.js"]
