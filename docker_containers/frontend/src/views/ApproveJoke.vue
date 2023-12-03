<template>
  <div class="grid">
    <h1 class="title">Pending Jokes</h1>

    <div class="content">
      <div id="items">
        <div v-for="item in pending" :key="item.id">
          {{ `${item.id} ${item.joke}` }}
          <div class="buttons">
            <button class="approve" @click="approve(item.id)">
              approve {{ `[${item.id}]` }}
            </button>
            <button class="reject" @click="reject(item.id)">
              reject {{ `[${item.id}]` }}
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
// import NavBar from "@/components/navigation/NavBar.vue";
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
