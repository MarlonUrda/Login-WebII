// router.js
import { createRouter, createWebHistory } from 'vue-router'
import Home from './views/Home.vue'
import Login from './views/Login.vue'
import ForgotPass from './views/ForgotPass.vue'
import Register from './views/Register.vue'
import ForgotUser from './views/ForgotUser.vue'
import Logged from './views/Logged.vue'
import Registered from './views/Registered.vue'

const routes = [
    { path: '/', redirect: '/Login' },
  { path: '/Home', component: Home },
  { path: '/Login', component: Login },
  { path: '/ForgotPass', component: ForgotPass },
  { path: '/Register', component: Register },
  { path: '/ForgotUser', component: ForgotUser },
  { path: '/LoggedIn', component: Logged },
  { path: '/Registered', component: Registered }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router