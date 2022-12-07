Notes from tutorial/planning meeting with Vincent:

Thse are 
1. Use Vite for build system right now. It is newer and vue-cli is maintenance only (Depracated)
2. Use Vue 3 since we're just starting to avoid a migration in the future.
3. Use Composition API for Vue 3 - It is pythonic and just generally cleaner and visualy easier to understand
4. Use Typescript, there really isn't any reason not to - the newer tools all support it well now
5. Use yarn instead of npm (although yarn still requires npm...) it may be faster and possibly more secure, Vincent has also expressed experiencing fewer problems.
6. Use newest nodee.js (LTS) - Currently 18.12.1
7. Vincent recommends VS Code for IDE, might be advantageous to use the sae IDE.
8. We may want to set up ES-lint for linting... not currently default with Vite


Some other thoughts:
1. Make UI components as dumb as possible (reasonable) and keep transformation and state in TypeScript separate from components.
2. Fetch teh QC Report at top level and set as a global variable for further processing downstream

Vincent spent a little time with us and mocked up a (functioning) QC Report loader. We'll need to convert to Yaml and process the data into something useable but it is a great start.


### Monarch Ingest Dashboard

A dashboard for viewing statistics on the Monarch Ingest Graph

## Project setup

```
nvm use v 14.8.0
```

```
npm install
```

### Compiles and hot-reloads for development
```
npm run dev
```

### Compiles and minifies for production
```
npm run build
```

### Deploy to github pages
```
./deploy.sh
```

### Lints files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
