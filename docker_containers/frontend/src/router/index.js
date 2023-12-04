import { createRouter, createWebHistory } from "vue-router";
import { authGuard } from "@auth0/auth0-vue";
import isAuthenticated from "@/components/navigation/NavBarButtons.vue";
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
    beforeEnter: authGuard,
  },
  {
    path: "/approve",
    name: "approve",
    component: ApproveJoke,
    beforeEnter: authGuard,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

router.beforeEach(async (to) => {
  if (!isAuthenticated && to.name !== "home") {
    return { name: "home" };
  }
  return true;
});

export default router;
