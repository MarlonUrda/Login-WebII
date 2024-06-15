<script setup >

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

const userData =async () => {
  try {
    let headersList = {
      'Content-Type': 'application/json',
    }

    let response = await fetch("http://localhost:3000/user-data", { 
      method: "GET",
      headers: headersList
    });

    let data = await response.json();
    console.log(data);
    console.log(typeof data); 

    if (data && data.user) {
        console.log(data.user.email);
        console.log(data.user.name);
        email.value = data.user.email;
        username.value = data.user.name;
    } else {
        console.log('data or data.user is undefined');
    }


  } catch (error) {

    console.error('Error:', error);
  }

}

onMounted(() => {
  userData();

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
      <!-- <button @click="userData" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full mt-4">Actualizar</button> -->
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
