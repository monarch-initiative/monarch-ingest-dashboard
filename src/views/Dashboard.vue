<template>

  <div class="dashboard">

    <sidebar/>

    <div v-show="!statsFetched" class="dash-spinner">
      <h4>Fetching Data</h4>
      <b-spinner
        class="loading-spinner"
        type="grow"
        label="Loading"
      />
    </div>

    <template v-if="statsFetched">

      <Predicates :stats="stats"/>

    </template>

  </div>
</template>

<script>
// @ is an alias to /src
import Predicates from '@/components/Predicates.vue';
import Sidebar from '@/components/Sidebar.vue';

import yaml from 'js-yaml';
import axios from 'axios';

export default {
  name: 'Home',
  components: {
    Predicates,
    Sidebar
  },
  data() {
    return {
      stats: null,
      statsFetched: false,
      predicateCategories: null,
      predicateCount: null,
    };
  },
  async mounted() {
    await new Promise((r) => setTimeout(r, 0));

    await this.getStats();
    this.statsFetched = true;

  },

  methods: {
    async getStats() {
      if (this.stats === null
          && window.sessionStorage.getItem('stats') === null
      ) {
        const stats = await this.fetchStats();
        this.stats = stats;
        window.sessionStorage.setItem('stats', JSON.stringify(stats));
        window.sessionStorage.setItem('releaseDate', JSON.stringify(this.releaseDate));
      } else if (window.sessionStorage.getItem('stats') !== null) {
        this.stats = JSON.parse(window.sessionStorage.getItem('stats'));
        this.releaseDate = JSON.parse(window.sessionStorage.getItem('releaseDate'));
      }
    },
  }
};

</script>

<style lang="scss" scoped>
  @import "~@/style/variables";

  .dash-spinner {
    margin: 100px auto;
    width: 20%;
  }
  .dashboard {
    padding-left: $sidebar-width;
  }

  .border-left-primary {
    border-left: .25rem solid theme-color("primary") !important;
  }

  .border-left-info {
    border-left: .25rem solid theme-color("info") !important;
  }

  .border-left-success {
    border-left: .25rem solid theme-color("success") !important;
  }

  .border-left-warning {
    border-left: .25rem solid #ba9c17 !important;
  }

  .card-title {
    font-size: 15px;
    font-weight: bold;
    margin-bottom: .25rem;
  }

  .node-title {
    color: theme-color("primary");
  }

  .source-title {
    color: theme-color("success");
  }

  .date-title {
    color: #ba9c17;
  }

  .card-body {
    padding: 1rem;
  }

</style>
