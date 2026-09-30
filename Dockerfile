
FROM node:20-alpine

WORKDIR /app

COPY ./package.josn ./package.josn
COPY ./package-lock.json ./package-lock.josn 


RUN npm install

COPY . .

ENV DATABASE_URL=postgresql://postgres:postgres@localhost:5432/postgres?schema=public

RUN npx prisma migrate dev
RUN npx primsa generate
RUN  npx run build 


EXPOSE 3000

CMD ["npm","start"]
