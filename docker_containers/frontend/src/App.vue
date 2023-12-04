<template>
  <NavBarButtons />
  <router-view />

  <!--
  <nav>
    
    <router-link to="/">home</router-link> |
    <router-link to="/submit">submit jokes</router-link> |
    <router-link to="/approve">approve jokes</router-link>
  </nav>
  -->
</template>
<script setup>
import NavBarButtons from "@/components/navigation/NavBarButtons.vue";
</script>

<style>
#app {
  max-width: 70v;
  background-color: #ccc;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #404040;
}
body {
  background-color: #ccc;
  padding: 1rem;
}
h1 .title {
  color: #417777;
  text-align: center;
  font-family: "Satisfy", cursive;
}
p {
  font-size: 1.3em;
}
button {
  padding: 0.5rem 1rem;
}
</style>
