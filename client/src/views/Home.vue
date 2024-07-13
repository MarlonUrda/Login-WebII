<script setup >

import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { Button } from "@/components/ui/button"

const router = useRouter();
const email = ref('');
const username = ref('');


const userData =async () => {
  try {
    let headersList = {
      'Content-Type': 'application/json',
    }

    let response = await fetch("http://localhost:3000/user-data", { 
      method: "GET",
      credentials: 'include',
      headers: headersList
    });

    let data = await response.json();
    console.log(data);


    if (data && data.user) {
        email.value = data.email;
        username.value = data.user;
    } else {
      router.push({path: '/InvalidAccess'});
    }


  } catch (error) {

    console.error('Error:', error);
  }

}

const cerrarSesion = async () => {
  try {
    let headersList = {
      'Content-Type': 'application/json',
    }

    let response = await fetch("http://localhost:3000/logout", { 
      method: "GET",
      credentials: 'include',
      headers: headersList
    });

    let data = await response.json();
    console.log(data);
    router.push({path: '/Login'});
  } catch (error) {  
    console.error('Error:', error);
  }
}

onMounted(() => {
  userData();

});

</script>

<template>

<div id="titlebar" class="absolute bg-white top-0 left-0 w-full h-[8%] rounded-b-3xl"/>

  <div id="welcome" class="absolute bg-gradient-to-r from-blue-500 to-cyan-500 top-[12%] left-[50%] -translate-x-[50%] w-[28%] h-[18%] rounded-[35px] border-4 border-white shadow-xl">
    <div class="rounded-full bg-white w-[82px] h-[82px] top-[17.5%] left-[5%] absolute"></div>
  </div>
  <h1 class="absolute text-4xl font-bold top-[25%] left-[18%] -translate-x-[50%] tracking-tight text-white underline">Lista de Proyectos</h1>
  
  <div id="welcome" class="absolute bg-white top-[34%] left-[50%] -translate-x-[50%] w-[92.5%] h-[60%] rounded-[70px] shadow-xl">
    <h1 class="absolute text-4xl font-bold top-[20%] left-[50%] -translate-x-[50%] tracking-tight">¡Bienvenido, !</h1>
  </div>



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
        </div>
      </CardHeader>
      <!-- <button @click="userData" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full mt-4">Actualizar</button> -->
      <CardContent>

        <div class="mt-12 text-center text-sm font-semibold" id="link">
          <a  @click="cerrarSesion"  class="underline text-base"> Cerrar la Sesión </a>
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
