FROM mcr.microsoft.com/playwright:latest

WORKDIR /srv/app

# copy package.json for a minimal Node app that uses patchright
COPY package.json package-lock.json* /srv/app/

RUN npm ci --no-audit --no-fund

# if your app needs to install chrome channel (optional)
# RUN npx patchright install chrome

COPY . /srv/app

EXPOSE 3000
CMD ["node", "index.js"]
