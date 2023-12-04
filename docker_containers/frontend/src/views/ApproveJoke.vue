<template>
  <div class="grid">
    <h1 class="title">Pending Jokes</h1>

    <div id="pendingJokes" class="pendingJokeContainer">
      <div id="items">
        <div class="pendingJoke" v-for="item in pending" :key="item.id">
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
<style>
.title {
  grid-column: 3/7;
  grid-row: 2;
  margin: auto;
  color: #417777;
}

#pendingJokes {
  grid-template-columns: 2/8;
  grid-template-rows: 3/6;
}

.pendingJokeContainer {
  display: grid;
  grid-template-columns: repeat(6, 1 fr);
  margin: auto;
}
#pendingjoke {
  grid-column: 1/5;
  text-align: left;
}
.approve {
  grid-column: 5/6;
  margin: center;
}
.reject {
  grid-column: 6/7;
  margin: center;
}
</style>
