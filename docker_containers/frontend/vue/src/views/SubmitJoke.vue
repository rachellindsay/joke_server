<template>
  <h1 class="page-title">Do you have a joke to share?</h1>

  <div class="blurb">
    <h4>Please share your jokes with us.</h4>
    <!-- <h4>fine print: We will judge your joke.</h4> -->
    <p>
      If we like it we'll keep it and you may see it here. We also record the
      email associated with each joke submitted.
    </p>
    <p>User email: {{ user?.email }}</p>
  </div>

  <div class="content">
    <form @submit.prevent="onSubmit">
      <div class="enterJoke">
        <label>
          <h3>joke:</h3>
          <textarea v-model="joke" placeholder="type joke..."></textarea>
        </label>
      </div>

      <div class="selectCategory">
        <label>
          <h3>joke category:</h3>
          <select v-model="category">
            <option disabled value="">joke category</option>
            <option value="animal">animal</option>
            <option value="cat">cat</option>
            <option value="misc">misc</option>
            <option value="plant">plant</option>
            <option value="dad">dad</option>
          </select>
        </label>
      </div>
    </form>
  </div>

  <div class="buttons">
    <button type="submit" @click="onSubmit">submit joke</button>
  </div>
</template>

<script setup>
/* function to add joke to db with default status of pending
      - auto assign id, timestamp, and status ("pending")
      - gets user_email from login
      - gets joke and joke category from user input
   Update page on submit to show that joke has been submitted and to check back that joke has been approved, display button asking if user has another joke
*/
import submitJoke from "@/composables/submitJoke";
import { useAuth0 } from "@auth0/auth0-vue";

import { ref } from "vue";

const joke = ref("");
const category = ref("");
const { user } = useAuth0();

async function onSubmit(/*event*/) {
  await submitJoke(joke.value, category.value, user.value?.email);
  joke.value = "";
  category.value = "";
}
</script>
<style scoped>
h3 {
  padding-right: 20px;
  font-size: 1.3rem;
}
form {
  border-top: 2px solid var(--accent-color-2);
}
textarea {
  height: 7rem;
  width: 100%;
  vertical-align: top;
  background-color: var(--accent-color-2);
  color: #f2f2f2;
  font-size: 1.1rem;
  font-weight: bold;
  font-family: Avenir, sans-serif;
  border: none;
}
select {
  font-size: 0.9rem;
  font-weight: bold;
  font-family: Avenir, sans-serif;
  padding: 0.5rem;
  border: none;
}
button {
  background-color: var(--accent-color);
  color: var(--accent-color-2);
  border: none;
  border-radius: var(--border-radius);
  font-weight: bold;
  font-size: 1.2rem;
  padding: 1rem;
  margin: 0.5rem 2rem;
  cursor: pointer;
}
</style>
