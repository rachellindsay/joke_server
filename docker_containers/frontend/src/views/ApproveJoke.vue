<template>
  <NavBar />
  <div class="div1">
    <h2>Pending Jokes</h2>
    <p>Click button for pending jokes</p>
    <button @click="getPending">pending jokes</button>
  </div>

  <div class="pendingItems">
    <ul id="items">
      <li v-for="item in pending" :key="item.id">
        {{ `[${item.id}]  ${item.joke}` }}
        <button @click="approve(item.id)">approve {{ `[${item.id}]` }}</button>
        <button @click="reject(item.id)">reject {{ `[${item.id}]` }}</button>
      </li>
    </ul>
  </div>
</template>

<script setup>
import NavBar from "@/components/navigation/NavBar.vue";
import getAllPendingJokes from "@/composables/getAllPendingJokes";
import approveJoke from "@/composables/approveJoke";
import rejectJoke from "@/composables/rejectJoke";
import { ref } from "vue";

const pending = ref([]);

async function getPending() {
  pending.value = await getAllPendingJokes();
}

async function approve(id) {
  await approveJoke(id);
  await getPending();
}
async function reject(id) {
  await rejectJoke(id);
  await getPending();
}
</script>

<style scoped>
ul #items li {
  text-align: left;
  padding: 10px;
}
</style>
