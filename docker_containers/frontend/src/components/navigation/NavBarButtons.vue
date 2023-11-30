<template>
  <ul class="nav_bar_buttons">
    <li v-if="!isAuthenticated">
      <LoginButton />
    </li>
    <li v-if="isAuthenticated">
      {{ user?.email }}
      <router-link to="/"> home </router-link>
      <router-link to="/submit"> submit jokes </router-link>
    </li>
    <li v-if="canApprove">
      <router-link to="/approve"> approve jokes </router-link>
    </li>
    <li v-if="isAuthenticated">
      <LogoutButton />
    </li>
  </ul>
  <hr />
  <pre>
    isAuthenticated: {{ isAuthenticated }}
    canApprove: {{ canApprove }}
    user email: {{ user?.email }}
  </pre>
</template>

<script setup>
import LoginButton from "@/components/buttons/LoginButton.vue";
import LogoutButton from "@/components/buttons/LogoutButton.vue";
// authUser returns email
// import authUser from "@/composables/loginUtils";
import { useAuth0 } from "@auth0/auth0-vue";
// canUserApprove returns boolean
import canUserApprove from "@/composables/canUserApprove";
import { ref, onBeforeMount } from "vue";

// const isAuthenticated = authUser() !== "";
const { isAuthenticated } = useAuth0();
console.log(useAuth0());

const { user } = useAuth0();

const canApprove = ref(false);
onBeforeMount(async () => {
  const { user } = useAuth0();
  console.log("user email: ", user.value.email);
  canApprove.value = await canUserApprove(user?.email);
});
</script>
