FROM node:20-alpine

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

ENV DATABASE_URL=postgresql://postgres:mysecretpassword@postgres:5432/postgres?schema=public

RUN npx prisma migrate deploy
RUN npx prisma generate

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]