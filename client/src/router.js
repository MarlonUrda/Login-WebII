// router.js
import { createRouter, createWebHistory } from 'vue-router'
import Login from './views/Login.vue'
import ForgotPass from './views/ForgotPass.vue'
import Register from './views/Register.vue'
import ForgotUser from './views/ForgotUser.vue'
import Home from './views/Home.vue'
import Registered from './views/Registered.vue'

const routes = [
    { path: '/', redirect: '/Login' },
  { path: '/Home', component: Home },
  { path: '/Login', component: Login },
  { path: '/ForgotPass', component: ForgotPass },
  { path: '/Register', component: Register },
  { path: '/ForgotUser', component: ForgotUser },
  { path: '/Home', component: Home },
  { path: '/Registered',name:'Registered', component: Registered }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    // esta ruta requiere autenticación, verifica si el usuario está autenticado
    // si no, redirige a la página de inicio de sesión.
    if (!isAuthenticated()) {
      next({
        path: '/login',
        query: { redirect: to.fullPath }
      });
    } else {
      next();
    }
  } else {
    next(); // asegúrate de siempre llamar a next()!
  }
});

export default router