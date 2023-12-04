<template>
  <div div="grid">
    <h1 class="title">Would you like to hear a joke</h1>
    <div class="content">
      <p>
        These jokes are not guaranteed to make you laugh. I do not claim that
        these are good jokes. In fact, you might be more likely to groan than
        laugh. Hopefully though, you will get a chuckle out of a few of them.
        That's really all I am going for here.
      </p>
    </div>
    <button class="getJokeButton" @click="onJoke">joke</button>
    <br />

    <div id="div2" class="currentJoke">{{ currentJoke }}</div>
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
<style scoped>
.grid {
  grid-template-columns: repeat(8, 1fr);
  grid-template-rows: repeat(8, 1fr);
}
.title {
  grid-column: 3/7;
  grid-row: 2;
  margin: auto;
  color: #417777;
}
.content {
  grid-column: 3/7;
  grid-row: 3/4;
  margin: auto;
}
.getJokeButton {
  grid-column: 4/6;
  grid-row: 5/6;
  margin: auto;
}
.currentJoke {
  grid-column: 3/7;
  grid-row: 6/7;
  margin: auto;
}
</style>
