<script setup>
import {
  Card,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { onMounted, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { Button } from "@/components/ui/button";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Edit } from "lucide-vue-next";
import { Trash2 } from "lucide-vue-next";
import { UserRoundPlus } from "lucide-vue-next";
import { ChevronLeft } from "lucide-vue-next";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

const goals = ref([]);
const router = useRouter();
const route = useRoute();

const project = route.params.nameP;
const role = route.params.role;
const idP = route.params.idP;

console.log(project, role, idP);

const getGoals = async (idProject) => {
  console.log(idProject);
  const res = await fetch("http://localhost:3000/toProcess", {
    method: "POST",
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      modulo: "Proyecto",
      clase: "Objectives",
      metodo: "getObjectives",
      params: {
        idProject: idProject,
      },
    }),
  });

  if (res.ok) {
    const data = await res.json();
    console.log(data);
    return data.objectives;
  }
};

const setProfileandExecute = async (newProfile) => {
  console.log(newProfile);
  const response = await fetch("http://localhost:3000/update-profile", {
    method: "POST",
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      newProfile: newProfile,
    }),
  });

  if (response.ok) {
    return true;
  }
};

onMounted(async () => {
  try {
    const profileloaded = await setProfileandExecute(role);
    if (profileloaded) {
      console.log(idP);
      const g = await getGoals(idP);
      goals.value = [...goals.value, ...g];
      console.log(goals.value);
    }
  } catch (error) {
    console.log(error.message);
  }
});

const goBack = () => {
  router.push({ path: "/Home" });
};
</script>

<template>
  <div
    id="welcome"
    class="absolute bg-gradient-to-tr from-blue-700 to-blue-400 top-[12%] left-[50%] -translate-x-[50%] w-[28%] h-[18%] rounded-[35px] border-8 border-white shadow-xl"
  />
  <h1
    id="pos"
    class="absolute text-4xl font-bold italic top-[25%] left-[18%] -translate-x-[50%] tracking-tight text-white underline underline-offset-4"
  >
    Lista de Objetivos
  </h1>

  <Button
    type="submit"
    variant="default"
    @click="goBack"
    class="text-black bg-white w-[6.2%] h-[5%] top-[11%] left-[2%] absolute hover:text-white border-2 border-white"
    ><ChevronLeft class="mt-[2%] mr-2 h-4 w-4 inline" />Volver</Button
  >
  <Button
    type="submit"
    variant="default"
    class="text-white bg-blue-400 w-[11.5%] h-[5%] top-[11%] left-[98%] -translate-x-full absolute hover:bg-white hover:text-black"
    ><UserRoundPlus class="mt-[2%] mr-2 h-4 w-4 inline" />Añadir
    Integrantes</Button
  >

  <div id="nomorepos">
    <Card
      class="top-[10.7%] left-[10%] -translate-x-[50%] shadow-none border-none absolute"
    >
      <CardHeader class="w-full">
        <CardTitle class="text-4xl text-white">¡Hola, {{ role }}!</CardTitle>
        <div>
          <CardDescription class="text-lg text-white italic">
            Proyecto: {{ project }}
          </CardDescription>
          <CardDescription class="text-lg text-white font-bold">
            Elige el objetivo en el que deseas entrar:
          </CardDescription>
        </div>
      </CardHeader>
    </Card>
  </div>

  <div
    id="projectlist"
    class="absolute bg-white top-[34%] left-[50%] -translate-x-[50%] w-[92.5%] h-[57.5%] rounded-[70px] shadow-xl"
  >
    <ScrollArea class="h-[93%] w-[93%] mt-[0.75%] ml-[3.5%]">
      <Table>
        <TableHeader class="text-lg italic">
          <TableRow>
            <TableHead class="text-center font-bold">N°.</TableHead>
            <TableHead class="text-center font-bold">Objetivo</TableHead>
            <TableHead class="text-center font-bold">Descripción</TableHead>
            <TableHead class="text-center font-bold">Fecha Objetivo</TableHead>
            <TableHead class="text-center font-bold">Opciones</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody class="text-base">
          <TableRow
            class="font-medium"
            v-for="(goal, index) in goals"
            :key="goal.objective_id"
          >
            <TableCell class="text-center">{{ index + 1 }}</TableCell>
            <TableCell class="text-center text-blue-500"
              ><button class="hover:underline">
                {{ goal.objective_name }}
              </button></TableCell
            >
            <TableCell
              class="text-center overflow-hidden text-nowrap text-ellipsis"
              >{{ goal.objective_desc }}</TableCell
            >
            <TableCell class="text-center">{{
              goal.deadline.split("T")[0]
            }}</TableCell>
            <TableCell class="text-center">
              <button
                type="submit"
                v-if="
                  role === 'Project Manager' || role === 'Arquitecto Software'
                "
              >
                <Edit
                  v-if="
                    role === 'Project Manager' || role === 'Arquitecto Software'
                  "
                  class="ml-4 mr-5 h-6 w-6 inline hover:text-blue-600"
                />
              </button>
              <button
                type="submit"
                v-if="
                  role !== 'Project Manager' && role !== 'Arquitecto Software'
                "
                disabled
              >
                <Edit
                  v-if="
                    role !== 'Project Manager' && role !== 'Arquitecto Software'
                  "
                  class="ml-4 mr-5 h-6 w-6 inline text-gray-400"
                />
              </button>

              <button
                type="submit"
                v-if="
                  role === 'Project Manager' || role === 'Arquitecto Software'
                "
              >
                <Trash2
                  v-if="
                    role === 'Project Manager' || role === 'Arquitecto Software'
                  "
                  class="h-6 w-6 inline hover:text-red-700"
                />
              </button>
              <button
                type="submit"
                v-if="
                  role !== 'Project Manager' && role !== 'Arquitecto Software'
                "
                disabled
              >
                <Trash2
                  v-if="
                    role !== 'Project Manager' && role !== 'Arquitecto Software'
                  "
                  class="h-6 w-6 inline text-gray-400"
                />
              </button>
            </TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </ScrollArea>
  </div>
</template>

<style scoped>
#pos {
  text-shadow: 0px 0px 10px #000000;
}
</style>
