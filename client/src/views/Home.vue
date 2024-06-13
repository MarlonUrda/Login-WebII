<script setup lang="ts">

import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";


</script>

<template>
  <div class="max-w-md" id="pos">
    <Card class="shadow-none border-none">
      <CardHeader>
        <CardTitle class="text-3xl"> este es el sistema(enc kontsztruccion) </CardTitle>
        <CardDescription>
        </CardDescription>
      </CardHeader>
      <CardContent>

        <div class="mt-2 text-center text-sm" id="link">
          JEJE
          <router-link to="/Register" class="underline"> Sing up </router-link>
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
