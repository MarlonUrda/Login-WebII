<script setup lang="ts">
import { ref } from "vue";
import { Button } from "../components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { Input } from "../components/ui/input";
import { Label } from "../components/ui/label";
import { useRouter } from 'vue-router';

const email = ref("");
const password = ref("");
const errorMessage = ref("");
const router = useRouter();

const sendData = async () => {
  console.log("hola");
  try {
  const response = await fetch("http://localhost:3000/login", {
    credentials: "include",
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      email: email.value,
      password: password.value,
    }),
  });

  const data = await response.json();
  if (response.status ==301) {
    router.push({path: '/Home'});
  } 

  if (response.status > 303) {
      errorMessage.value = data.message;
    } else {
      errorMessage.value = "";
  }
    email.value = "";
    password.value = "";
  } catch (error) {

    console.error('Error:', error);
  }

};
</script>

<template>
  <div id="pos">
    <Card class="shadow-none border-none">
      <CardHeader>
        <CardTitle class="text-3xl"> Inicio de Sesión </CardTitle>
        <CardDescription>
          Ingresa tu correo para iniciar sesión en tu cuenta.
        </CardDescription>
      </CardHeader>
      <CardContent>
        <div class="grid gap-4">
          <form @submit.prevent="sendData">
            <div class="mt-8 grid gap-2">
              
              <Label for="email">Correo Electrónico</Label>
              <Input
                v-model="email"
                id="email"
                type="email"
                placeholder="correo@ejemplo.com"
                required
                autocomplete="email"
              />
            </div>
            <div class="grid gap-2">
              <div class="flex items-center">
                <Label for="password" class="mt-[4%]">Contraseña</Label>
                <router-link
                  to="/ForgotPass"
                  class="ml-auto inline-block text-sm underline mt-[4%]"
                >
                  ¿Olvidaste tu contraseña?
                </router-link>
              </div>
              <Input
                v-model="password"
                id="password"
                type="password"
                placeholder="Ingresa la contraseña de tu cuenta."
                required
                autocomplete="off"
              />
              <p class="text-red-500">{{ errorMessage }}</p> 
            </div>
            <Button  type="submit" class="mt-10 w-full">
              Iniciar Sesión
            </Button>
          </form>
        </div>
        <div class="mt-2 text-center text-sm" id="link">
          ¿No tienes una cuenta?
          <router-link to="/NewPerson" class="underline"> Regístrate </router-link>
        </div>
      </CardContent>
    </Card>
  </div>
</template>

<style scoped>
#pos {
  position: absolute;
  width: 50%;
  top: 20.5%;
  max-height: 100%;
  right: 4.8%;
  z-index: 50;
}
#link {
  z-index: 10;
}
</style>
