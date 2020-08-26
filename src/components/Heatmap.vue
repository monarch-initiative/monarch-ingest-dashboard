<template>
  <div id="heatmap">
    <h3>Categories By Source</h3>

    this is the heatmap component
  </div>

</template>

<script>

export default {
  name: 'Heatmap',
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
