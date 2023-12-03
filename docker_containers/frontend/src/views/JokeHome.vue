<template>
  <div div="grid">
    <h1 class="title">Really Bad Jokes</h1>
    <p>Would you like to hear a really bad joke?</p>
    <button @click="onJoke">joke</button>
    <br />

    <div id="div2">{{ currentJoke }}</div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import getJoke from "@/composables/getJoke";
// import NavBar from "@/components/navigation/NavBar.vue";

const currentJoke = ref("");

async function onJoke() {
  currentJoke.value = await getJoke();
}
</script>
<style scoped></style>
