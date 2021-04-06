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
      perPage: 10,
      items: [
        { key: "subject", label:"Subject" },
        { key: "object", label:"Object" },
        { key: "predicate", label:"predicate" },
        { key: "team", label:"team" }
      ]
    };
  },
  mounted() {
    this.getData();
  },

  methods: {
    getData() {
      axios.get("https://raw.githubusercontent.com/NCATSTranslator/testing/bug_fix/onehop/missing_details.json")
        .then(response => {
            this.predicateData = response.data;
      })
    }
  }
};

</script>

<style lang="scss" scoped>
  @import "~@/style/variables";

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
