<template>
  <div class="grid"></div>
  <div class="navBarButtons">
    <NavBarButtons />
  </div>
  <!--
  <nav>
    
    <router-link to="/">home</router-link> |
    <router-link to="/submit">submit jokes</router-link> |
    <router-link to="/approve">approve jokes</router-link>
  </nav>
  -->

  <router-view />
</template>
<script setup>
import NavBarButtons from "@/components/navigation/NavBarButtons.vue";
</script>
