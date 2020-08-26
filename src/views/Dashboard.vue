<template>

  <div class="dashboard">

    <sidebar />

    <div v-show="!statsFetched" class="dash-spinner">
      <h4>Fetching Data</h4>
      <b-spinner
        class="loading-spinner"
        type="grow"
        label="Loading"
      />
    </div>

    <template v-if="statsFetched">

      <Categories :stats="stats"/>
      <Heatmap :stats="stats"/>
      <Sankey :stats="stats"/>

    </template>

  </div>
</template>

<script>
// @ is an alias to /src
import Categories from '@/components/Categories.vue';
import Sankey from '@/components/Sankey.vue';
import Heatmap from '@/components/Heatmap.vue';
import Sidebar from '@/components/Sidebar.vue';

import yaml from 'js-yaml';
import axios from 'axios';


export default {
  name: 'Home',
  components: {
    Categories,
    Sankey,
    Heatmap,
    Sidebar
  },
  data() {
    return {
      stats: null,
      statsFetched: false,
    };
  },
  async mounted() {
    await new Promise((r) => setTimeout(r, 5000));
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
      }
    },

    async fetchStats() {
      // const graphStats = 'https://kg-hub.berkeleybop.io/merged_graph_stats.yaml';
      const graphStats = '/test.yaml';
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
</style>
