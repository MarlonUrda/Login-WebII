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
import { useRouter } from "vue-router";

const name = ref("");
const lastname = ref("");
const ident = ref("");
const errorMessage = ref("");
const router = useRouter();

// const sendPerson = async () => {
//   console.log("sendUser");

//   try {
//     const response = await fetch("http://localhost:3000/register", {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: JSON.stringify({
//         name: name.value,
//         lastname: lastname.value,
//         ident: phoneNumber.value,
//       }),
//     });

//     const data = await response.json();

//     console.log(data);

//     if (response.status > 300) {
//       errorMessage.value = data.message;
//     } else {
//       errorMessage.value = "";
//       router.push({
//         name: "Register",
//         params: {
//           ident: ident.value,
//           name: name.value,
//           lastname: lastname.value,
//         },
//       });
//     }
//     ident.value = "";
//     name.value = "";
//     lastname.value = "";
//   } catch (err) {
//     console.log(err);
//   }
// };

const sendPerson = () => {
  router.push({
    name: "Register",
    params: {
      ident: ident.value,
      name: name.value,
      lastname: lastname.value,
    },
  });

  ident.value = " ";
  name.value = " ";
  lastname.value = " ";
};
</script>

<template>
  <div id="pos">
    <Card class="shadow-none border-none">
      <CardHeader>
        <CardTitle class="text-3xl"> Crea tu Nueva Cuenta </CardTitle>
        <CardDescription>
          Ingresa tu información personal para crear tu cuenta nueva.
        </CardDescription>
      </CardHeader>
      <CardContent>
        <div class="grid gap-4 mt-2">
          <form @submit.prevent="sendPerson">
            <div class="grid gap-2">
              <Label for="phone">Numero de C.I.: </Label>
              <Input
                v-model="ident"
                id="phone"
                type="text"
                placeholder="Ej.: 12345678"
                required
                autocomplete="off"
              />
              <Label for="name">Nombre:</Label>
              <Input
                v-model="name"
                id="name"
                type="text"
                placeholder="Ej.: Jubert"
                required
              />
              <Label for="lastName">Apellido:</Label>
              <Input
                v-model="lastname"
                id="lastName"
                type="text"
                placeholder="Ej.: Pérez"
                required
                autocomplete="off"
              />
              <p class="text-red-500">{{ errorMessage }}</p>
            </div>
            <Button type="submit" class="w-full mt-[7%]"> Siguiente </Button>
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
