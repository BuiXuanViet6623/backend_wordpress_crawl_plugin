# Chọn Node.js 20 chính thức
FROM node:20-bullseye

# Set working directory
WORKDIR /app

# Copy package.json & package-lock.json
COPY package*.json ./

# Cài dependencies
RUN npm install

# Cài Playwright + Chromium + dependencies OS
RUN npx playwright install --with-deps chromium

# Copy toàn bộ code
COPY . .

# Expose port trùng server.js
EXPOSE 10000

# Start server
CMD ["node", "server.js"]
