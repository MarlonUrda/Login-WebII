// router.js
import { createRouter, createWebHistory } from 'vue-router'
import Home from './views/Home.vue'
import Login from './views/Login.vue'
import Forgot from './views/Forgot.vue'
import Register from './views/Register.vue'
import ForgotUser from './views/ForgotUser.vue'

const routes = [
    { path: '/', redirect: '/Login' },
  { path: '/Home', component: Home },
  { path: '/Login', component: Login },
  { path: '/Forgot', component: Forgot },
  { path: '/Register', component: Register },
  { path: '/ForgotUser', component: ForgotUser }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router