import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import { createAuth0 } from "@auth0/auth0-vue";

const app = createApp(App);

app.use(router).use(
  createAuth0({
    domain: "dev-rf2tzlnnbdolqy0x.us.auth0.com",
    clientId: "5eof9LR2bmecvsioX8xR1gOBXKeDWCaE",
    authorizationParams: {
      redirect_uri: "https://rachellindsay.net",
    },
  })
);

app.mount("#app");
console.log("hello, it's rachel and marion");
// createApp(App).use(router).mount("#app");
