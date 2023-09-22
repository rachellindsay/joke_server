<template>
  <NavBar />
  <div id="div1">
    <h2>Really Bad Jokes</h2>
    <p>Click the joke button for a really bad joke</p>
    <button @click="onJoke">joke</button>
    <br />

    <div id="div2">{{ currentJoke }}</div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import getJoke from "@/composables/getJoke";
import NavBar from "@/components/navigation/NavBar.vue";

const currentJoke = ref("haha, very funny");

async function onJoke(e) {
  console.log("hello from onJoke", e);
  currentJoke.value = await getJoke();
}
</script>
