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

      <Inverses :stats="stats"/>
      <Predicates :stats="stats"/>

    </template>

  </div>
</template>

<script>
// @ is an alias to /src
import Inverses from '@/components/Inverses.vue';
import Predicates from '@/components/Predicates.vue';
import Sidebar from '@/components/Sidebar.vue';
import yaml from 'js-yaml';
import axios from 'axios';
export default {
  name: 'Home',
  components: {
    Inverses,
    Predicates,
    Sidebar
  },
  data() {
    return {
      stats: null,
      statsFetched: false
    };
  },
  async mounted() {
    // no idea why but this changes the transition speed from different routes
    // comment out and go from 'About' to the homepage to determine what you
    // like better
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
      } else if (window.sessionStorage.getItem('stats') !== null) {
        this.stats = JSON.parse(window.sessionStorage.getItem('stats'));
        this.releaseDate = JSON.parse(window.sessionStorage.getItem('releaseDate'));
      }
    },
    async fetchStats() {
      const graphStats = 'https://raw.githubusercontent.com/NCATSTranslator/testing/bug_fix/onehop/missing_details.json'
      const statsYaml = await axios.get(graphStats);
      let statsData = null;
      try {
        statsData = await yaml.safeLoad(statsYaml.data, 'utf8');
      } catch (e) {
        // console.log('stats yaml.safeLoad ERROR', e);
      }
      return statsData;
    }
  },
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
  .overview-cards {
    padding: 30px 10px 0 40px;
    width: 100%;
  }
  .overview-text {
    font-size: 15px;
    font-weight: bold;
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
  .edge-title {
    color: theme-color("info");
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





