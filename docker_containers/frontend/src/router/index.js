import { createRouter, createWebHistory } from "vue-router";
import JokeHome from "../views/JokeHome.vue";
import SubmitJoke from "../views/SubmitJoke.vue";
import ApproveJoke from "../views/ApproveJoke.vue";

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
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
