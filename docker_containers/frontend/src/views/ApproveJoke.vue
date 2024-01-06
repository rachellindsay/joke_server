<template>
  <h1 class="page-title">Pending Jokes</h1>

  <div class="blurb">
    <p>
      New jokes are given a pending status until they can be approved. Once
      approved the will immediately enter the joke pool. Rejected jokes are
      still kept in the database for future reference.
    </p>
  </div>

  <div class="content">
    <div class="pending-joke" v-for="item in pending" :key="item.id">
      {{ `${item.joke}` }}
      <div class="buttons">
        <button class="approve-joke" @click="approve(item.id)">approve</button>
        <button class="reject-joke" @click="reject(item.id)">reject</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import getAllPendingJokes from "@/composables/getAllPendingJokes";
import approveJoke from "@/composables/approveJoke";
import rejectJoke from "@/composables/rejectJoke";
import { ref, onBeforeMount } from "vue";

const pending = ref([]);

async function getPending() {
  pending.value = await getAllPendingJokes();
}

onBeforeMount(async () => {
  getPending();
});

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
.pending-joke {
  padding-top: 1.5rem;
  font-size: 1.3rem;
  font-weight: bold;
  border-top: 2px solid var(--text-accent-color);
}
.buttons button {
  border: none;
  border-radius: var(--border-radius);
  font-weight: normal;
  padding: 1rem;
  margin: 1rem;
}

button.approve-joke {
  background-color: #d1bd19;
}
button.reject-joke {
  background-color: #e47804;
}
</style>
