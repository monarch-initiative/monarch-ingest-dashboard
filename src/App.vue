<template>
  <div id="app" class="page-wrapper">

    <navbar />

    <router-view />

  </div>
</template>

<script>

import Navbar from '@/components/Navbar.vue';

export default {
  name: 'App',
  components: {
    Navbar
  },
};

</script>

<style lang="scss">
@import "~@/style/variables";

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background-color: #f8f8fc;
}

#app.page-wrapper {
  padding-top: $navbar-height;
  min-height: 100%;
  min-width: 100%;
}
</style>
