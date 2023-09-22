import { createRouter, createWebHistory } from "vue-router";
import JokeHome from "../views/JokeHome.vue";
import SubmitJoke from "../views/SubmitJoke.vue";
import ApproveJoke from "../views/ApproveJoke.vue";
import CallbackPage from "../views/CallbackPage.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: JokeHome,
  },
  {
    path: "/submit",
    name: "submit",
    component: SubmitJoke,
  },
  {
    path: "/approve",
    name: "approve",
    component: ApproveJoke,
  },
  {
    path: "/callback",
    name: "callback",
    component: CallbackPage,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
