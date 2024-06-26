// router.js
import { createRouter, createWebHistory } from 'vue-router'
import Login from './views/Login.vue'
import ForgotPass from './views/ForgotPass.vue'
import Register from './views/Register.vue'
import Home from './views/Home.vue'
import Registered from './views/Registered.vue'
import NewPass from './views/NewPass.vue'
import NotFound from './views/NotFound.vue'
import InvalidAccess from './views/InvalidAccess.vue'
import NewPerson from './views/NewPerson.vue'

const routes = [
  { path: '/', redirect: '/Login' },
  { path: '/Home', component: Home },
  { path: '/Login', component: Login },
  { path: '/ForgotPass', component: ForgotPass },
  { path: '/Register', component: Register },
  { path: '/Registered', name: 'Registered', component: Registered },
  { path: '/NewPass/:token', name: 'NewPass', component: NewPass },
  { path: '/:pathMatch(.*)*', name: 'not-found', component: NotFound },
  { path: '/InvalidAccess', name: 'InvalidAccess', component: InvalidAccess },
  { path: '/NewPerson', name: 'NewPerson', component: NewPerson } 
  
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
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