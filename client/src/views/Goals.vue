<script setup>
import {
  Card,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { onMounted, onUnmounted, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { Button } from "@/components/ui/button";
import { ChevronLeft } from "lucide-vue-next";
import UpdateObjective from "../components/UpdateObjective.vue";

import { toProcess } from "../utils/toProcess";
import GoalsSheet from "../components/objective/NewObjective.vue";
import { useToast } from "vue-toast-notification";
import tableBO from "@/components/objective/tableObjective.vue";


const toast = useToast();
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
    goals.value = await getGoals(projectToken.value);



    console.log("goalsss", goals.value);
    await updateProfile();
  } catch (error) {
    console.log(error.message);
  }
});



const getGoals = async (idProject) => {
  const data = await toProcess("Proyecto", "Objectives", "getObjectives", {
    idProject,
  });
  return data.objectives;
};

const updateProfile = async () => {
  try {
    const response = await fetch("http://localhost:3000/update-role", {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        projectId: projectToken.value,
      }),
    });

    if (response.ok) {
      const data = await response.json();
      console.log(data.message[0]);
      console.log("Profile updated");
      project.value = data.message[0].project_name;
      project.value = data.message[0].project_name;
      role.value = data.message[0].profile_desc;
      return true;
    }
  } catch (error) {
    console.log(error.message);
  }
};

const viewGoal = (objectiveId) => {
  console.log("Viewing project:", objectiveId);
  router.push(`/Goals/${projectToken.value}/Activities/${objectiveId}`);
};

const deleteObjective = async (objectiveId) => {
  console.log("Deleting project:", objectiveId);
  const data = await toProcess("Proyecto", "Objectives", "deleteObjective", {
    objectiveId: objectiveId,
  });

  if (!data.success) {
    toast.error(data.message, { duration: 3000, position: "bottom-right" });
    return;
  }
  goals.value = await getGoals(projectToken.value)
  toast.success(data.message, { duration: 3000, position: "bottom-right" });
  return data;


};

const goBack = async() => {
  router.push({ path: "/Home" });
};

const goMember = () => {
  router.push(`/Member/${projectToken.value}`);
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
  >
    <ChevronLeft class="mt-[2%] mr-2 h-4 w-4 inline" />Volver
  </Button>

  <Button
    type="submit"
    variant="default"
    @click="goMember"
    class="text-black bg-white w-[6.2%] h-[5%] top-[18%] left-[2%] absolute hover:text-white border-2 border-white z-1000"
  >
    <ChevronLeft class="mt-[2%] mr-2 h-4 w-4 inline" />Members
  </Button>

  <div>
    <GoalsSheet :id-project="projectToken" />
  </div>



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

  <div v-if="role == 'Project Manager' || role == 'Arquitecto Software'">
    <GoalsSheet :id-project="projectToken" />
  </div>

  <tableBO
    :data="goals"
    :headers="['ID', 'Nombre', 'Descripción',  'Fecha de Fin','Opciones']"
    :permit="role"
    @delete="deleteObjective"
    @goto="viewGoal"
  />
</template>

<style scoped>
#pos {
  text-shadow: 0px 0px 10px #000000;
}
</style>
