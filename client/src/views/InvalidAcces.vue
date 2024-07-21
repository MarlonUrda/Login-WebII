<script setup >
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";

</script>

<template>
  <div id="pos">
  <Card class="shadow-none border-none">
    <CardHeader>
      <CardTitle class=" mt-32 text-4xl underline">Acceso Inválido</CardTitle>
      <CardDescription class="font-semibold mt-2">
        Debes iniciar sesión para acceder a esta página.
        <div class="text-center text-lg mt-8">
          <router-link to="/Login" class="hover:underline">
            Volver al inicio de sesión
          </router-link>
        </div>
      
      </CardDescription>
    </CardHeader>
    <CardContent>

 
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
