<template>
  <div class="grid">
    <div class="newJokeSubmit">
      <h1 class="title">Do you have a joke to share?</h1>

      <div class="submitContent">
        <p>Please share your jokes with us.</p>
        <h4>
          Fine print: We get to judge your joke before it goes into our
          rotation.
        </h4>
        <p>User email: {{ user?.email }}</p>
      </div>

      <div class="submitForm">
        <form @submit.prevent="onSubmit">
          <div class="enterJoke">
            <label>
              joke:
              <textarea v-model="joke" placeholder="type joke..."></textarea>
            </label>
          </div>

          <div class="selectCategory">
            <label>
              joke category:
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

          <div class="submitButton">
            <button type="submit">submit joke</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
// import NavBar from "@/components/navigation/NavBar.vue";
import submitJoke from "@/composables/submitJoke";
import { useAuth0 } from "@auth0/auth0-vue";
/* function to add joke to db with default status of pending
      - auto assign id, timestamp, and status ("pending")
      - gets user_email from login
      - gets joke and joke category from user input
   Update page on submit to show that joke has been submitted and to check back that joke has been approved, display button asking if user has another joke
*/

import { ref } from "vue";

const joke = ref("");
const category = ref("");
const { user } = useAuth0();

async function onSubmit(/*event*/) {
  console.log("hello, we're in onSubmit");
  await submitJoke(joke.value, category.value, user.value?.email);
  joke.value = "";
  category.value = "";
}
</script>
<style scoped>
.grid {
  grid-template-columns: repeat(8, 1fr);
  grid-template-rows: auto;
  gap: 3px;
}
.title {
  grid-column: 3/7;
  grid-row: 2/3;
  margin: auto;
}
.submitContent {
  grid-column: 3/7;
  grid-row: 2/3;
}
.submitForm {
  grid-column: 3/7;
  grid-row: 3/5;
}
.submitButton {
  grid-column: 4/6;
  grid-row: 5/6;
}
</style>
