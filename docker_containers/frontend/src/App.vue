<template>
  <!--
  <nav>
    <router-link to="/">home</router-link> |
    <router-link to="/submit">submit jokes</router-link> |
    <router-link to="/approve">approve jokes</router-link>
  </nav>
  -->

  <router-view />
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #333;
}

nav a {
  font-weight: bold;
  color: #333;
}

nav a.router-link-exact-active {
  color: #125238;
}
</style>
