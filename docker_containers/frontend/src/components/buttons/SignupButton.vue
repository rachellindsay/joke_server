<template>
  <button class="button__sign-up" @click="handleSignUp">sign up</button>
</template>

<script setup>
import { useAuth0 } from "@auth0/auth0-vue";

const { loginWithRedirect } = useAuth0();

const handleSignUp = () => {
  loginWithRedirect({
    appState: {
      target: "/submit",
    },
    authorizationParams: {
      screen_hint: "signup",
    },
  });
};
</script>
