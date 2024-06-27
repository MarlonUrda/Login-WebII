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
import { useRoute } from 'vue-router';


const password = ref("");
const route = useRoute();
const errorMessage = ref("");

const sendPassword = async () => {
  console.log("sendPassword");
  console.log(password.value);
  let token = route.params.token;

const response = await fetch(`http://localhost:3000/reset/${token}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      password: password.value,
    }),
  });
  console.log("response");
  
  const data = await response.json();

  if (response.status > 303) {
      errorMessage.value = data.message;
    } else {
      errorMessage.value = "contraseña cambiada";
  }
  console.log(data);
};


</script>

<template>
  <div id="pos">
  <Card class="shadow-none border-none">
    <CardHeader>

      <CardTitle class="text-3xl">
        Cambio de Contraseña
      </CardTitle>
      <CardDescription>
        Introduce tu nueva contraseña más abajo.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="mt-[15%] grid gap-2">
            <Label for="password">Nueva Contraseña</Label>
          <Input
            v-model="password"
            id="password"
            type="text"
            placeholder="Introduce tu nueva contraseña"
            required
          />
        </div>
        <p class="text-blue-500">{{ errorMessage }}</p> 
        <Button  @click="sendPassword" type="submit" class="w-full mt-[1%]">
          Enviar
        </Button>
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
#pos{
  position: absolute;
  top: 20.5%;
  width: 50%;
  max-height: 100%;
  right: 4.8%;
  z-index: 50;
}
</style>

