<template>
  <ul class="nav_bar_buttons">
    <li v-if="!isAuthenticated">
      <LoginButton />
    </li>
    <li v-if="isAuthenticated">
      {{ authUser() }}
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
    authUser(): {{ authUser() }}
  </pre>
</template>

<script setup>
import LoginButton from "@/components/buttons/LoginButton.vue";
import LogoutButton from "@/components/buttons/LogoutButton.vue";
// authUser returns email
import authUser from "@/composables/loginUtils";
// canUserApprove returns boolean
import canUserApprove from "@/composables/canUserApprove";
import { ref, onBeforeMount } from "vue";

const isAuthenticated = authUser() !== "";

let canApprove = ref();
onBeforeMount(async () => {
  canApprove.value = await canUserApprove(authUser());
  console.log(canApprove);
  return canApprove;
});
</script>
