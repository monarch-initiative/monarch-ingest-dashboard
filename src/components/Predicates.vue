<template>

  <div id='predicate-table'>

   <b-card class="card-shadow heatmap-card" header-tag="header" align="left">
      <template v-slot:header>
        <div class="card-title graph-title">
          Predicates (in use), Missing From Biolink-model
        </div>
      </template>
      <b-table id="predicate-table"
                    :items="predicateData"
                    :filter="filtered"
                    :fields="items"
                    :per-page="perPage"
                    :current-page="currentPage"
                    :sort-by.sync="sortBy"
                    :sort-desc.sync="sortDesc"
                    sort-icon-right
                    responsive
                    head-variant="light">
          <template slot="top-row" slot-scope="{ fields }">
            <td v-for="field in fields" :key="field.key">
                <input v-model="filters[field.key]" :placeholder="field.label">
             </td>
          </template>
        </b-table>
      <b-pagination v-model="currentPage" :total-rows="totalItems" :per-page="perPage"/>
      <div>
        Sorting By: <b>{{ sortBy }}</b>, Sort Direction:
        <b>{{ sortDesc ? 'descending' : 'ascending' }}</b>
      </div>
      <p class="mt-3">Current Page: {{ currentPage }}</p>
   </b-card>
  </div>

</template>

<script>

import axios from 'axios';

export default {
  name: 'Predicates',
  data() {
      return {
      sortBy: 'subject',
      sortDesc: false,
      predicateData: [],
      filters: {
        subject: '',
        predicate: '',
        object: '',
        team: ''
      },
      items: [
        { key: "subject", label:"Subject", sortable: true },
        { key: "object", label:"Object", sortable: true },
        { key: "predicate", label:"Predicate", sortable: true },
        { key: "team", label:"Team", sortable: true }
      ],
      currentPage: 1,
      perPage: 50
    };
  },
  mounted() {
    this.getData();
  },
  computed: {
    filtered() {
      const filtered = this.items.filter(item => {
        return Object.keys(this.filters).every(key =>
          String(item[key]).includes(this.filters[key])
        );
      });
      return filtered.length > 0
        ? filtered
        : [
            Object.keys(this.[0]).reduce(function(obj, value) {
              obj[value] = '';
              return obj;
            }, {})
          ];
    }
  },
  methods: {
    getData() {
      axios.get("https://raw.githubusercontent.com/NCATSTranslator/testing/bug_fix/onehop/missing_details.json")
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

  .chart {
    margin: 0 auto;
    width: 90%;
  }

  .heatmap-card {
    margin: 20px auto;
    width: 60%;
  }

  .card {
    min-width: 1000px !important;
  }

  .graph-title {
    color: #15556A;
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 0 !important;
  }

  .card-body {
    padding: 0 1.25rem 0 1.25rem !important;
  }
</style>
