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
# Vue 3 + TypeScript + Vite

This template should help get you started developing with Vue 3 and TypeScript in Vite. The template uses Vue 3 `<script setup>` SFCs, check out the [script setup docs](https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup) to learn more.

## Recommended IDE Setup

- [VS Code](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar)

## Type Support For `.vue` Imports in TS

Since TypeScript cannot handle type information for `.vue` imports, they are shimmed to be a generic Vue component type by default. In most cases this is fine if you don't really care about component prop types outside of templates. However, if you wish to get actual prop types in `.vue` imports (for example to get props validation when using manual `h(...)` calls), you can enable Volar's Take Over mode by following these steps:

1. Run `Extensions: Show Built-in Extensions` from VS Code's command palette, look for `TypeScript and JavaScript Language Features`, then right click and select `Disable (Workspace)`. By default, Take Over mode will enable itself if the default TypeScript extension is disabled.
2. Reload the VS Code window by running `Developer: Reload Window` from the command palette.

You can learn more about Take Over mode [here](https://github.com/johnsoncodehk/volar/discussions/471).
