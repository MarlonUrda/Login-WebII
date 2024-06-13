<script setup lang="ts">
import { ref } from "vue";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

const email = ref("");
const password = ref("");
const username = ref("");

const sendUser = async () => {
  console.log("hola");

  try{

    const response = await fetch("http://localhost:3000/register", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email: email.value,
        password: password.value,
        username: username.value,
      }),
    })

    email.value = "";
    password.value = "";
    username.value = "";

    const data = await response.json();

    console.log(data);
  }catch(err){
    console.log(err)
  }
};
</script>

<template>
  <Card class="max-w-md shadow-none border-none" id="pos">
    <CardHeader>
      <CardTitle class="text-3xl"> Crea tu Cuenta </CardTitle>
      <CardDescription>
        Llena la información abajo para crear una nueva cuenta.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4 mt-2">
        <form @submit.prevent="sendUser">
          <div class="grid gap-2">
            <Label for="email">Correo Electrónico</Label>
            <Input
              v-model="email"
              id="email"
              type="email"
              placeholder="correo@ejemplo.com"
              required
            />
            <Label for="username">Usuario</Label>
            <Input
              v-model="username"
              id="user"
              type="text"
              placeholder="Ingresa tu nombre de usuario."
              required
              autocomplete="off"
            />
            <Label for="password">Contraseña</Label>
            <Input
              v-model="password"
              id="password"
              type="password"
              placeholder=" Ingresa tu contraseña."
              required
              autocomplete="off"
            />
          </div>
          <Button type="submit" class="w-full mt-2">
            Registrarse
          </Button>
        </form>
      </div>
      <div class="text-center text-sm mt-2">
        <router-link to="/Login" class="underline">
          Volver al inicio de sesión
        </router-link>
      </div>
    </CardContent>
  </Card>
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
</style>
