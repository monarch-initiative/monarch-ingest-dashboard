<template>

  <div id='predicate-table'>
      <b-table id="predicate-table" :items="predicateData" :per-page="perPage" :current-page="currentPage"
                   small head-variant="light"> </b-table>
      <b-pagination v-model="currentPage" :total-rows="totalItems" :per-page="perPage"/>
  </div>

</template>

<script>

import axios from 'axios';

export default {
  name: 'Predicates',
  data() {
      return {
      predicateData: [],
      items: [
        { key: "subject", label:"Subject" },
        { key: "object", label:"Object" },
        { key: "predicate", label:"predicate" },
        { key: "team", label:"team" }
      ],
      currentPage: 1,
      perPage: 10
    };
  },
  mounted() {
    this.getData();
  },

  methods: {
    getData() {
      axios.get("https://raw.githubusercontent.com/NCATSTranslator/testing/bug_fix/onehop/missing_details_test.json")
        .then(response => {
            this.predicateData = response.data;
            this.totalItems = response.data.length
      })
    }
  }
};

</script>

<style lang="scss" scoped>
  @import "~@/style/variables";

  #predicate-table {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
    margin-top: 60px;
    margin-left: 15px;
    margin-right: 15px;
  }

</style>
