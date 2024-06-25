<script setup lang="ts">
import { Button } from "../components/ui/button";
import { ref } from "vue";
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
const errorMessage = ref("");

const sendEmail = async () => {
  console.log("sendEmail");
  console.log(email.value);

  const response = await fetch("http://localhost:3000/forgot-password", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      email: email.value,
    }),
  });
  console.log("response");

  const data = await response.json();
  if (response.status > 303) {
      errorMessage.value = data.message;
    } else {
      errorMessage.value = "mensaje enviado";
  }
  console.log(data);
};


</script>

<template>
  <div id="pos">
  <Card class="shadow-none border-none">
    <CardHeader>

      <CardTitle class="text-3xl">
        Olvidé mi Contraseña
      </CardTitle>
      <CardDescription>
        Escribe tu correo electrónico y recupera tus datos.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="mt-[20%] grid gap-2">
            <Label for="email">Correo de verificación</Label>
          <Input
            v-model="email"
            id="mail"
            type="text"
            placeholder="correo@ejemplo.com"
            required
          />
        
        </div>
        <p class="text-red-500">{{ errorMessage }}</p> 
        <Button  @click="sendEmail" type="submit" class="w-full mt-[1%]">
          Siguiente
        </Button>
      </div>
      <div class="mt-2 text-center text-sm">
        <router-link to="/Login" class="underline">
            Volver al inicio de sesión

        </router-link>
      </div>
    </CardContent>
  </Card>
  </div>
</template>


<style scoped>
#pos{
  position: absolute;
  top: 20.5%;
  width: 50%;
  max-height: 100%;
  right: 4.8%;
  z-index: 50;
}
</style>

