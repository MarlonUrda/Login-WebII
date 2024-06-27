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
      <CardTitle class="text-5xl mt-[37%]">Error 404</CardTitle>
      <CardDescription class="text-xl">
      La página que buscas no existe.
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
