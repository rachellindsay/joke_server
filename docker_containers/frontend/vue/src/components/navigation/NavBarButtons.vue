<template>
  <ul id="navbar_buttons" class="navigation">
    <li class="logInOut">
      <div class="logInOut" v-if="!isAuthenticated"><LoginButton /></div>
      <div class="logInOut" v-if="isAuthenticated"><LogoutButton /></div>
    </li>

    <li class="mainpage">
      <a href="/">main</a>
    </li>

    <li class="aboutLink">
      <router-link to="/about"> about </router-link>
    </li>

    <li class="authenticated" v-if="isAuthenticated">
      <div class="home">
        <router-link to="/"> jokes </router-link>
      </div>
    </li>

    <li class="authenticated" v-if="isAuthenticated">
      <div class="submit">
        <router-link to="/submit"> share joke </router-link>
      </div>
    </li>

    <li class="approve" v-if="canApprove">
      <router-link to="/approve"> pending jokes </router-link>
    </li>

    <li class="authenticated" v-if="isAuthenticated">
      <p class="user-email">
        user: <span>{{ user?.email }}</span>
      </p>
    </li>
  </ul>
</template>

<script setup>
import LoginButton from "@/components/buttons/LoginButton.vue";
import LogoutButton from "@/components/buttons/LogoutButton.vue";
import { useAuth0 } from "@auth0/auth0-vue";
import canUserApprove from "@/composables/canUserApprove";
import { ref, watch } from "vue";

const { isAuthenticated } = useAuth0();
console.log(useAuth0());

const { user } = useAuth0();

const canApprove = ref(false);

watch(user, async () => {
  const userEmail = user.value?.email;
  if (userEmail) {
    canApprove.value = await canUserApprove(userEmail);
  } else {
    canApprove.value = false;
  }
});
</script>

<style scoped>
.navigation {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  flex-wrap: wrap;
  background-color: var(--accent-color);
  color: var(--text-accent-color);
}
ul {
  list-style-type: none;
}
ul#navbar_buttons.navigation {
  margin: 0;
  padding: 0 1rem;
}
li {
  padding: 0.3rem 0.4rem;
  font-size: 1.2rem;
  text-decoration: none;
  text-align: center;
  text-wrap: nowrap;
}
p.user-email {
  margin-block-start: 0;
  margin-block-end: 0;
  font-weight: bold;
}
li a.router-link-active {
  color: var(--accent-color-2);
  font-weight: bold;
  text-decoration: underline;
}
button {
  background: transparent;
  border: none;
  font-size: 1.2rem;
  color: var(--text-accent-color);
  cursor: pointer;
  padding: 0;
}
a {
  color: var(--text-accent-color);
  text-decoration: none;
}
@media screen and (min-width: 700px) {
  .navigation {
    justify-content: space-around;
  }
}
</style>
