<template>

  <div id="sankey">
    <h3>Subject Category, Edge, Object Category by Source</h3>

    this is the sankey component
  </div>

</template>

<script>

export default {
  name: 'Sankey',
  props: {
    stats: {
      type: Object,
      required: true,
    },
  },
};

</script>

<style lang="scss" scoped>
  h3 {
    padding-top: 20px;
  }
</style>
