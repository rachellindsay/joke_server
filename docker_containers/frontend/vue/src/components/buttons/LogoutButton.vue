<template>
  <button class="button__logout" @click="handleLogout">log out</button>
</template>

<script setup>
import { useAuth0 } from "@auth0/auth0-vue";

const { logout } = useAuth0();

const handleLogout = () =>
  logout({
    logoutParams: {
      // returnTo: "http://rachellindsay.net/vue/",
      returnTo: window.location.origin + "/vue",
    },
  });
</script>
