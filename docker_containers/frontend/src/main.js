import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import { createAuth0 } from "@auth0/auth0-vue";
// import "./assets/styles.css";

const app = createApp(App);

app.use(router);

app.use(
  createAuth0({
    domain: process.env.VUE_APP_AUTH0_DOMAIN,
    clientId: process.env.VUE_APP_AUTH0_CLIENT_ID,
    authorizationParams: {
      redirect_uri: process.env.VUE_APP_API_SERVER_URL,
    },
  })
);

app.mount("#app");
console.log("hello, it's rachel and marion");
// createApp(App).use(router).mount("#app");
