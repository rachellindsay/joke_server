<template>
  <NavBar />
  <div class="newJokeForm">
    <p>submit a joke</p>
    <form @submit.prevent="onSubmit">
      <div>
        <label>
          joke:
          <textarea v-model="joke" placeholder="type joke..."></textarea>
        </label>
      </div>

      <div>
        <label>
          joke category:
          <select v-model="category">
            <option disabled value="">select category</option>
            <option value="animal">animal</option>
            <option value="cat">cat</option>
            <option value="misc">misc</option>
            <option value="plant">plant</option>
            <option value="dad">dad</option>
            <option value="pun">pun</option>
          </select>
        </label>
      </div>

      <div class="submit">
        <button type="submit">submit joke</button>
      </div>
    </form>
  </div>
</template>

<script setup>
import NavBar from "@/components/navigation/NavBar.vue";
import submitJoke from "@/composables/submitJoke";
import authUser from "@/composables/loginUtils";
/* function to add joke to db with default status of pending
      - auto assign id, timestamp, and status ("pending")
      - gets user_email from login
      - gets joke and joke category from user input
   Update page on submit to show that joke has been submitted and to check back that joke has been approved, display button asking if user has another joke
*/

import { ref } from "vue";

const joke = ref("");
const category = ref("");

async function onSubmit(/*event*/) {
  console.log("hello, we're in onSubmit");
  await submitJoke(joke.value, category.value, authUser());
  joke.value = "";
  category.value = "";
}
</script>
