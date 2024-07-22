<script setup>
import {
  Card,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { onMounted, ref } from "vue";
import { useRoute, useRouter} from "vue-router";
import { Button } from "@/components/ui/button";
import { ChevronLeft } from "lucide-vue-next";
import { toProcess } from "../utils/toProcess";
import TableActivities from "../components/TableActivities.vue";
import NewActivitiySheet from "../components/NewActivitiySheet.vue";


const goals = ref([]);
const router = useRouter();
const route = useRoute();
const projectToken = ref(0);




onMounted(async () => {
  try {
    projectToken.value = route.params.projectToken; 
    console.log("projectToken", projectToken.value);

  }catch (error) {
    console.log(error.message);
  }

});




const goBack = () => {
  router.push({ path: `/Goals/${projectToken.value}`});
};
</script>

<template>
  <div
    id="welcome"
    class="absolute bg-gradient-to-tr from-blue-700 to-blue-400 top-[12%] left-[50%] -translate-x-[50%] w-[32%] h-[18%] rounded-[35px] border-8 border-white shadow-xl"
    />
  <h1
    id="pos"
    class="absolute text-4xl font-bold italic top-[25%] left-[18%] -translate-x-[50%] tracking-tight text-white underline underline-offset-4"
  >
    Lista de Actividad
  </h1>
  <Button
    type="submit"
    variant="default"
    @click="goBack"
    class="text-black bg-white w-[6.2%] h-[5%] top-[11%] left-[2%] absolute hover:text-white border-2 border-white"
    ><ChevronLeft class="mt-[2%] mr-2 h-4 w-4 inline" />Volver</Button
  >

  <div id="nomorepos">
    <Card
      class="top-[10.7%] left-[10%] -translate-x-[50%] shadow-none border-none absolute"
    >
      <CardHeader class="w-full">
        <CardTitle class="text-4xl text-white">¡Hola, {{ role }}!</CardTitle>

        <div>
          <CardDescription class="text-lg text-white italic">
            Proyecto actual: {{ nameProject }}
          </CardDescription>
          <CardDescription class="text-lg text-white italic">
            Objetivo actual: {{ nameProject }}
          </CardDescription>
          <CardDescription class="text-lg text-white font-bold">
            Elige el objetivo en el que deseas entrar:
          </CardDescription>
        </div>
      </CardHeader>
    </Card>
  </div>



  <NewActivitiySheet/>
  <TableActivities />

</template>

<style scoped>
#pos {
  text-shadow: 0px 0px 10px #000000;
}
</style>
