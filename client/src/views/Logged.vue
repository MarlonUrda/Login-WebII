<script setup lang="ts">

import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute();
const email = ref('');
const username = ref('');

onMounted(() => {
//   email.value = route.params.email;
//   password.value = route.params.password;
});

</script>

<template>
  <div id="pos">
    <Card class="shadow-none border-none">
      <CardHeader>
        <CardTitle class="text-3xl"> ¡Ya estás en el sistema! </CardTitle>
        <CardDescription>
            Iniciaste sesión en tu cuenta exitosamente.
        </CardDescription>
        <CardTitle class="text-2xl mt-16 italic"> Los datos de tu cuenta: </CardTitle>
        <CardTitle class=" text-base font-normal italic"> (La información de tu sesión actual): </CardTitle>
    <div class="font-bold mt-3">
            <CardDescription class="text-xl italic">
            Tu correo electrónico: {{ email }}
        </CardDescription>
        <CardDescription class="text-xl italic">
            Tu nombre de usuario: {{ username }}
        </CardDescription>
        <CardDescription class="text-xl italic">
            Tu contraseña: (Encriptada y segura)
        </CardDescription>
        </div>
      </CardHeader>
      <CardContent>

        <div class="mt-12 text-center text-sm font-semibold" id="link">
          <router-link to="/Login" class="underline text-base"> Cerrar la Sesión </router-link>
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
