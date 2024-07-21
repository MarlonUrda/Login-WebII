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
      <CardTitle class="text-3xl">Invalid Access </CardTitle>
      <CardDescription>
        <div class="text-center text-sm mt-2">
          <router-link to="/Login" class="underline">
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
