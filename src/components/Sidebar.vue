<template>
  <div class="dash-sidebar">

    <div class="sidebar-content">

      <div class="sidebar-header">
        <font-awesome-icon :icon="['fas', 'chart-pie']"/>
        Charts
      </div>

      <b-nav class="side-nav-item">
        <ul>

          <li>
            <b-nav-item>
              <font-awesome-icon :icon="['fas', 'chart-bar']"/>
              Categories
            </b-nav-item>
          </li>

          <li>
            <b-nav-item>
              <font-awesome-icon :icon="['fas', 'hamburger']"/>
              Sankey
            </b-nav-item>
          </li>

          <li>
            <b-nav-item>
              <font-awesome-icon :icon="['fas', 'fire']"/>
              Heat map
            </b-nav-item>
          </li>

        </ul>
    </b-nav>

    </div>

  </div>
</template>

<script>

export default {
  name: 'Sidebar',
};

</script>

<style>

  .dash-sidebar {
    background: #f8f8fc;
    bottom: 0;
    left: 0;
    overflow-x: hidden;
    overflow-y: hidden;
    position: fixed;
    width: 200px;
    top: 55px;
    z-index: 100;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
  }
  .dash-sidebar ul {
    list-style-type: none;
    text-align: center;
  }
  .dash-sidebar a {
    color: black !important;
  }
  .sidebar-header {
    font-weight: bold;
    padding-bottom: 5px;
    box-shadow: 0 1px 1px -1px #15556A;
  }
  .sidebar-content {
    padding-top: 10px;
  }
  .side-nav-item {
    padding: 5px 0 0 0 !important;
  }
</style>
