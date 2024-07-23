<script setup>
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
import { useRoute, useRouter } from "vue-router";
import { useToast } from "vue-toast-notification";

const toast = useToast();
const succesMessage = ref("");
const email = ref("");
const password = ref("");
const username = ref("");
const errorMessage = ref("");
const route = useRoute();
const router = useRouter();

const sendUser = async () => {
  console.log("sendUser");

  console.log(route.params.name, route.params.lastname);

  try {
    const response = await fetch("http://localhost:3000/register", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        ident: route.params.ident,
        name: route.params.name,
        lastname: route.params.lastname,
        email: email.value,
        password: password.value,
        username: username.value,
      }),
    });

    const data = await response.json();

    console.log(data);

    if (data.success) {
      succesMessage.value = data.message;
      toast.success(succesMessage.value, {
        duration: 3000,
        position: "top-right",
      });
      router.push({
        name: "Registered",
        params: {
          email: email.value,
          password: password.value,
          username: username.value,
        },
      });
    }

    if (!data.success) {
      errorMessage.value = data.message;
      toast.error(errorMessage.value, {
        duration: 3000,
        position: "top-right",
      });
    } else {
      errorMessage.value = "";
    }
    email.value = "";
    password.value = "";
    username.value = "";
  } catch (err) {
    console.log(err);
  }
};
</script>

<template>
  <div id="pos">
    <Card class="shadow-none border-none">
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
              <p class="text-red-500">{{ errorMessage }}</p>
            </div>
            <Button type="submit" class="w-full mt-[10%]"> Registrarse </Button>
          </form>
        </div>
        <div class="text-center text-sm mt-2">
          <router-link to="/Login" class="underline">
            Volver al inicio de sesión
          </router-link>
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
</style>
