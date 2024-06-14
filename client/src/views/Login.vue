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

const email = ref("");
const password = ref("");

const sendData = async () => {
  console.log("hola");

  const response = await fetch("http://localhost:3000/get-session", {
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
  console.log(data);
};
</script>

<template>
  <div class="max-w-md" id="pos">
    <Card class="shadow-none border-none">
      <CardHeader>
        <CardTitle class="text-3xl"> Inicio de Sesión </CardTitle>
        <CardDescription>
          Ingresa tu correo para iniciar sesión en tu cuenta.
        </CardDescription>
      </CardHeader>
      <CardContent>
        <div class="grid gap-4">
          <div class="mt-8 grid gap-2">
            <Label for="email">Correo Electrónico</Label>
            <Input
              v-model="email"
              id="email"
              type="email"
              placeholder="correo@ejemplo.com"
              required
            />
          </div>
          <div class="grid gap-2">
            <div class="flex items-center">
              <Label for="password">Contraseña</Label>
              <router-link
                to="/ForgotPass"
                class="ml-auto inline-block text-sm underline"
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
            />
          </div>
          <Button @click="sendData" type="submit" class="mt-12 w-full">
            Iniciar Sesión
          </Button>
        </div>
        <div class="mt-2 text-center text-sm" id="link">
          ¿No tienes una cuenta?
          <router-link to="/Register" class="underline"> Regístrate </router-link>
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
