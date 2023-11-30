<template>
  <button class="button__login" @click="handleLogin">log in</button>
</template>

<script setup>
import { useAuth0 } from "@auth0/auth0-vue";

const { loginWithRedirect } = useAuth0();

const handleLogin = () => {
  loginWithRedirect({
    loginParams: {
      returnTo: window.location.reload(),
    },
  });
};
</script>
