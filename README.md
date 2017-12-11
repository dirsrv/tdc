# Angular - Node.js - Oracle Stack

This is a simple todo list application that lets you create, view and delete your todos. This is an example.

## Requirements

* [Node.js](http://nodejs.org/)

## Installation Steps

After the git clone inside root directory lauch npm prerequisites install:

```
npm install
```

Your Angular frontend code is located inside the `angular-src`.

Do a `npm install -g @angular/cli@latest` and `npm install` inside the `angular-src` directory so that npm can install all the angular dependencies

Still inside `angular-src` run the Angular-CLI's build:

```
ng build
```

this should compile the static code into the root `public` directory.

Finally, inside root directory run `npm start` to get this started!

## Custom configuration

If you wish to change connection parameters, check:
- `root_dir/config.js` and set your Oracle DB ORDS endpoint
- `root_dir/angular_src/src/environments/environment.ts` if you wish to have separate node runing api and a separate for angular

