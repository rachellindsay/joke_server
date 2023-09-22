<template>
  <!-- NavBar should only show logout button because only certain users are allowed to approve jokes and the approve button will only be visible to those users -->
  <NavBar />
  <div>
    <h1>This page is for approving jokes</h1>
  </div>
  <!-- 
      button to show jokes that are pending approval - call to database
  -->
</template>

<script setup>
import NavBar from "@/components/navigation/NavBar.vue";
</script>
