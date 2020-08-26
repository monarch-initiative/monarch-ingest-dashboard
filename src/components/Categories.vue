<template>

  <div id="categories">

    <h3>Biolink Categories</h3>

    <h4>Node Categories</h4>

    <div id="edge-categories" class="chart"></div>

    this is the category component
  </div>

</template>

<script>

import Plotly from 'plotly.js-dist';

export default {
  name: 'Categories',
  props: {
    stats: {
      type: Object,
      required: true,
    },
  },
  mounted() {
    console.log(this.stats.node_stats.count_by_category['biolink:AnatomicalEntity'].count);

    const layout = {
      height: 500,
      width: 500,
      margin: {
        l: 80, r: 40, t: 100, b: 40
      },
      title: 'Edge Categories (Top 30)',
    };

    const data = [
      {
        y: ['giraffes', 'orangutans', 'monkeys'],
        x: [20, 14, 23],
        type: 'bar',
        orientation: 'h'
      }
    ];

    Plotly.newPlot('edge-categories', data, layout);
  },
};

</script>

<style lang="scss" scoped>
  h3 {
    padding-top: 20px;
  }
  .chart {
    margin: auto;
    width: 50%;
    padding-left: 100px;
  }
</style>
