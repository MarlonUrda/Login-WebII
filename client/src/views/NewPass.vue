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

const password = ref("");

const sendPassword = async () => {
  console.log("sendPassword");
  console.log(password.value);

  const response = await fetch("http://localhost:3000/reset/", {
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
        <!-- <div class="mt-[2%] grid gap-2">
            <Label for="password">Comprobación de Contraseña</Label>
          <Input
            v-model="password"
            id="password2"
            type="text"
            placeholder="Ambas contraseñas deben coincidir"
            required
          />
        </div> -->

        <Button  @click="sendPassword" type="submit" class="w-full mt-[1.5%]">
          Enviar
        </Button>
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

