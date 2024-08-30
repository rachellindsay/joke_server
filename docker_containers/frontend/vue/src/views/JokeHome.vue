<template>
  <h1 class="page-title">Can I tell you a joke?</h1>
  <div class="blurb">
    <p>
      These jokes are not guaranteed to make you laugh. I do not claim that
      these are good jokes. In fact, you might be more likely to groan than
      laugh. Hopefully though, you will get a chuckle out of a few of them.
      That's really all I am going for here.
    </p>
    <p>
      If you have a joke you'd like to share, we'd like to see it. Login with
      your Google account (above left) and you will see an option to share
      jokes.
    </p>
  </div>
  <div class="content">{{ currentJoke }}</div>
  <div class="buttons">
    <button @click="onJoke">joke</button>
  </div>

  <div class="stats">
    <!-- 
    <form id="stats-select" @click="jokeByCategory">
      <div class="selectCategory">
        <label>
          <p>Get jokes shown by category: =</p>
          <select v-model="category">
            <option disabled value="">joke category</option>
            <option value="animal">animal</option>
            <option value="cat">cat</option>
            <option value="misc">misc</option>
            <option value="plant">plant</option>
            <option value="dad">dad</option>
          </select>
        </label>
        <p>{{ StatsByCategory }}</p>
      </div>
    </form>
   -->
    <pre>Stats: {{ stats }}</pre>
  </div>
</template>

<script setup>
import { ref, onBeforeMount } from "vue";
import getJoke from "@/composables/getJoke";
import { useAuth0 } from "@auth0/auth0-vue";
import getStats from "@/composables/getStats";

const currentJoke = ref("");
const { user } = useAuth0();
const stats = ref("");

onBeforeMount(async () => {
  currentStats();
});

async function currentStats() {
  stats.value = await getStats();
}

async function onJoke() {
  currentJoke.value = await getJoke(user.value?.email);
  await currentStats();
}
</script>
<style scoped>
.content {
  background-color: var(--accent-color-2);
  color: #f2f2f2;
  font-size: 1.3rem;
  font-weight: bold;
  text-align: center;
}
button {
  cursor: pointer;
  background-color: var(--accent-color);
  color: var(--accent-color-2);
  border: none;
  border-radius: var(--border-radius);
  font-weight: bold;
  font-size: 1.2rem;
  text-align: center;
  padding: 1rem;
  margin: 0.5rem 0;
}
</style>
