# Platformatic

##### Dockerize a Platformatic DB basic application v.2.5, using Typescript and custom environment variables.

https://docs.platformatic.dev/docs/guides/environment-variables

### Creating scaffold

```
PS D:\Temp> pnpm create platformatic@latest
Hello xxx yyy, welcome to Platformatic 2.5.1!
Platformatic is not supported on Node.js v22.3.0.
Please use one of the following Node.js versions >= 18.8.0 or >= 20.6.0.
? Where would you like to create your project? platformatic-db-basic
✔ Installing @platformatic/runtime@^2.5.1...
? Which kind of project do you want to create? @platformatic/db
✔ Installing @platformatic/db@^2.5.1...
? What is the name of the service? gemini
? What is the connection string? postgresql://postgres:changeme@localhost:5432/geminidb
? Do you want to create default migrations? yes
? Do you want to create another service? no
? Do you want to use TypeScript? yes
? What port do you want to use? 3042
```

##### Issue #1

At this moment, the latest version is 2.5.2, but the first message report 2.5.1.

##### Issue #2

The message require to use the Node.js versions >= 18.8.0 or **>=** 20.6.0.
My Nodejs version is v22.3.0 which is greater than 20.6.0.

##### Issue #3

>  What is the connection string? **postgresql://postgres:changeme@localhost:5432/geminidb**

```
# .env
PLT_GEMINI_DATABASE_URL=sqlite://./db.sqlite
```

The connectionString on `platformatic.json` refers to `PLT_GEMINI_DATABASE_URL` but the .env key doesn't  contain the input string.  ( see Issue [#2501](https://github.com/platformatic/platformatic/issues/2501) )

##### Issue #4

Creating hello route.  As specified into scaffolding requests, I should be use Typescript.
The sample reported [here](https://docs.platformatic.dev/docs/guides/environment-variables#use-it-inside-a-route)  is on Javascript, and produce errors adding to `hello.ts` file. (missing type definitions). See `hello.ts` for a minimal running code route sample.

##### Issue #5

Dockerizing app. [This page ](https://docs.platformatic.dev/docs/guides/deployment/deploy-to-fly-io-with-sqlite#dockerfile-for-runtime-application) show how to create a docker file for Runtime app.
The build of dockerfile is passed, but the cmd line goes on error : `CMD ["node", "node_modules/.bin/platformatic", "start"]`  with these errors:

> 2024-10-10 06:01:36 tail: can't open 'node': No such file or directory

> 2024-10-10 06:01:36 tail: can't open 'start': No such file or directory

