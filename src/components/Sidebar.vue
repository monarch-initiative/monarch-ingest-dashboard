<template>
  <div class="dash-sidebar">

    <div class="sidebar-content">

      <b-nav class="side-nav-item">

        <li>
          <b-nav-item to="#inverses">
            <font-awesome-icon :icon="['fas', 'chart-bar']"/>
            Inverses
          </b-nav-item>
        </li>

        <li>
        <b-nav-item
          href="https://github.com/NCATSTranslator/Translator-All/wiki/Node-Normalizer"
          target="_blank"
        >
          Node Normalizer
        </b-nav-item>
        </li>

        <li>
        <b-nav-item
          href="https://github.com/NCATSTranslator/Translator-All/wiki/Edge-Normalizer"
          target="_blank"
        >
          Edge Normalizer
        </b-nav-item>
        </li>

        <li>
        <b-nav-item
          href="https://github.com/biolink/biolink-model-toolkit"
          target="_blank"
        >
          Biolink Model Toolkit
        </b-nav-item>
        </li>

        <li>
        <b-nav-item
          href="https://github.com/biolink/KGX"
          target="_blank"
        >
          Knowledge Graph Exchange Format (KGX)
        </b-nav-item>
        </li>

        <li>
        <b-nav-item
          href="https://github.com/TranslatorSRI/BLComplianceService"
          target="_blank"
        >
          Biolink Compliance Service
        </b-nav-item>
        </li>

        <li>
        <b-nav-item
          href="https://github.com/TranslatorSRI/bl_lookup"
          target="_blank"
        >
          Biolink Model Lookup Service
        </b-nav-item>
        </li>


      </b-nav>

    </div>

  </div>
</template>

<script>

export default {
  name: 'Sidebar',
};

</script>

<style lang="scss">

  @import "~@/style/variables";

  .dash-sidebar {
    background: white;
    bottom: 0;
    left: 0;
    overflow-x: hidden;
    overflow-y: hidden;
    position: fixed;
    width: $sidebar-width;
    top: $navbar-height;
    z-index: 100;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
  }
  .side-nav-item ul {
    list-style-type: none;
  }

  .side-nav-item li {
    width: 100%;
  }

  .side-nav-item a {
    color: #2e4856 !important;
    font-weight: bold;
    padding: 12px 12px !important;
    /* color: #42b983; */
  }
  .side-nav-item a.router-link-active {
    background: #dedee7;
  }
  .side-nav-item a:hover {
    background: #dedee7;
  }

  .sidebar-header {
    color: #2e4856;
    font-weight: bold;
    padding-top: 10px;
    padding-bottom: 10px;
    background-color: #f8fafa;
    box-shadow: 0 1px 1px -1px #15556A;
  }

</style>
