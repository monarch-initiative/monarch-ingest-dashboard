<template>
  <div id="predicate_table">
    <b-table :items="predicateData" :per-page="perPage" :current-page="currentPage" sticky-header head-variant="light"></b-table>
    <b-pagination v-model="currentPage" :total-rows="predicateData.length" :per-page="perPage"></b-pagination>
  </div>
</template>

<script>

import Plotly from 'plotly.js-dist';
import axios from 'axios';

export default {
  name: 'Predicates',
  props: {
    stats: {
      type: Object,
      required: true,
    },
  },
  data() {

      return {
      predicateData: [],
      currentPage: 1,
      perPage: 50,
      items: [
        { key: "subject" },
        { key: "object" },
        { key: "predicate" },
        { key: "team" }
      ]
    };
  },
  created() {
    this.getData();
  },

  computed: {
      rows() {
        return this.items.length
      }
    },

  methods: {
    getData() {
      axios.get("https://raw.githubusercontent.com/NCATSTranslator/testing/bug_fix/onehop/missing_details.json").then(resp => {
        this.predicateData = resp.data;
      });
    },
  }
};

</script>

<style lang="scss" scoped>
  @import "~@/style/variables";

  h3 {
    padding-top: 20px;
  }

  .card {
    min-width: 400px !important;
  }

  .chart {
    margin: auto;
    width: 100%;
  }

  .chart-cards {
    padding: 50px 80px;
    margin-right: 0 !important;
  }

  .first-card {
    margin-right: 100px !important;
  }

  .graph-title {
    color: #15556A;
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 0 !important;
  }

  .card-body {
    padding: 0 1.25rem 1.25rem 1.25rem !important;
  }

   #predicate_table {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
    margin-top: 60px;
    margin-left: 15px;
    margin-right: 15px;
  }

</style>
