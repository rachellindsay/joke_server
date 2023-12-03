<template>
  <!-- <ul class="nav_bar_buttons">
    <li v-if="!isAuthenticated">
      <LoginButton />
    </li>
    <li class="authenticated" v-if="isAuthenticated">
      user: {{ user?.email }}
      <ul>
        <li><router-link to="/"> home </router-link></li>
        <li><router-link to="/submit"> submit jokes </router-link></li>
      </ul>
    </li>
    <li v-if="canApprove">
      <router-link to="/approve"> approve jokes </router-link>
    </li>
    <li v-if="isAuthenticated">
      <LogoutButton />
    </li>
  </ul> -->
  <div class="nav_bar_buttons">
    <div class="logInOut" v-if="!isAuthenticated"><LoginButton /></div>
    <div class="logInOut" v-if="isAuthenticated"><LogoutButton /></div>
    <div class="authenticated" v-if="isAuthenticated">
      <h3>
        user: <span class="userEmail">{{ user?.email }}</span>
      </h3>
      <p class="home"><router-link to="/"> hear joke </router-link></p>
      <p class="submit">
        <router-link to="/submit"> tell joke </router-link>
      </p>
    </div>
    <div v-if="canApprove">
      <p class="approve">
        <router-link to="/approve"> pending jokes </router-link>
      </p>
    </div>
  </div>

  <!--  <pre>
    isAuthenticated: {{ isAuthenticated }}
    canApprove: {{ canApprove }}
    user email: {{ user?.email }}
  </pre> -->
</template>

<script setup>
import LoginButton from "@/components/buttons/LoginButton.vue";
import LogoutButton from "@/components/buttons/LogoutButton.vue";
// authUser returns email
// import authUser from "@/composables/loginUtils";
import { useAuth0 } from "@auth0/auth0-vue";
// canUserApprove returns boolean
import canUserApprove from "@/composables/canUserApprove";
import { ref, watch } from "vue";

// const isAuthenticated = authUser() !== "";
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
