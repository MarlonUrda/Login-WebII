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
import { Trash2 } from "lucide-vue-next";
import { UserRoundPlus } from "lucide-vue-next";
import { ChevronLeft } from "lucide-vue-next";
import UpdateObjective from "../components/UpdateObjective.vue";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { toProcess } from "../utils/toProcess";
import GoalsSheet from "@/components/GoalsSheet.vue";

const goals = ref([]);
const router = useRouter();
const userdata = ref({});
const route = useRoute();
const projectToken = ref(0);
const role = ref("");
const project = ref("");




onMounted(async () => {
  try {
    projectToken.value = route.params.projectToken; 
    console.log("projectToken", projectToken.value);

    const goalsData = await getGoals(projectToken.value);
    goals.value = [...goalsData];
    console.log("goalsss", goalsData);
    console.log("goalsss", goals.value);
    const profileloaded = await updateProfile();

  }catch (error) {
    console.log(error.message);
  }
  


});



const getGoals = async (idProject) => {
  const data = await toProcess("Proyecto", "Objectives", "getObjectives", {idProject});
  return data.objectives;
};

const updateProfile = async () => {
  try{
    const response = await fetch("http://localhost:3000/update-role", {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        projectId: projectToken.value
      }),
    });

    if (response.ok) {
      const data = await response.json();
      console.log(data.message[0]);
      console.log("Profile updated");
      project.value = data.message[0].project_name;
      project.value = data.message[0].project_name;
      role.value =data.message[0].profile_desc;
      return true;
    }
  }catch (error) {
    console.log(error.message);
  }
};

const viewGoal = (objectiveId) => {
  console.log("Viewing project:", objectiveId);
  router.push(`/Goals/${projectToken.value}/Activities/${objectiveId}`); 
};

const deleteObjective = async (objectiveId) => {
  const data = await toProcess("Proyecto", "Objectives", "deleteObjective", {
    objectiveId: objectiveId,
  });

  console.log("ou yea");

  return data;
};

const goBack = () => {
  router.push({ path: "/Home" });
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
    Lista de Objetivos
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
            Proyecto actual: {{ project }}
          </CardDescription>
          <CardDescription class="text-lg text-white font-bold">
            Elige el objetivo en el que deseas entrar:
          </CardDescription>
        </div>
      </CardHeader>
    </Card>
  </div>

   <GoalsSheet :id-project="projectToken.value"/> 

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
              ><button class="hover:underline"
              @click="viewGoal(goal.objective_id)"
              >
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
              <UpdateObjective
                v-if="
                  role === 'Project Manager' || role === 'Arquitecto Software'
                "
                :name="goal.objective_name"
                :description="goal.objective_desc"
                :objective-id="goal.objective_id"
              />

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
                  @click="deleteObjective(goal.objective_id)"
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
