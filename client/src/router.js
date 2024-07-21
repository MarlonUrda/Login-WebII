// router.js
import { isAuthenticated } from "./utils/isAuthenticated.js";
import { createRouter, createWebHistory } from "vue-router";
import Login from "./views/Login.vue";
import ForgotPass from "./views/ForgotPass.vue";
import Register from "./views/Register.vue";
import Home from "./views/Home.vue";
import Registered from "./views/Registered.vue";
import NewPass from "./views/NewPass.vue";
import NotFound from "./views/NotFound.vue";
import InvalidAcces from "./views/InvalidAcces.vue";
import NewPerson from "./views/NewPerson.vue";
import Goals from "./views/Goals.vue";

const routes = [
  { path: "/", redirect: "/Login" },
  { path: "/Login", component: Login },
  { path: "/ForgotPass", component: ForgotPass },
  { path: "/Register", name: "Register", component: Register },
  { path: "/Registered", name: "Registered", component: Registered },
  { path: "/NewPass/:token", name: "NewPass", component: NewPass },
  { path: "/:pathMatch(.*)*", name: "not-found", component: NotFound },
  { path: "/InvalidAccess", name: "InvalidAccess", component: InvalidAcces },
  { path: "/NewPerson", name: "NewPerson", component: NewPerson },
  { path: "/Home", component: Home, meta: { requiresAuth: true } },
  { path: "/Goals", name: "Goals", component: Goals, meta: { requiresAuth: true } },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach(async (to, from, next) => {
  if (to.matched.some((record) => record.meta.requiresAuth)) {
    const authenticated = await isAuthenticated();
    if (!authenticated) {
      console.log("no autenticado");
      next({
        path: "/InvalidAccess",
        query: { redirect: to.fullPath },
      });
    } else {
      next();
    }
  } else {
    next(); // asegúrate de siempre llamar a next()!
  }
});

export default router;
