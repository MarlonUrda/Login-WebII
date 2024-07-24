<script setup>
import {
  Card,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { onMounted, onUnmounted, onUpdated, ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import { Button } from "@/components/ui/button";
import { ChevronLeft } from "lucide-vue-next";
import { toProcess } from "../utils/toProcess";
import TableActivities from "../components/activities/TableActivities.vue";
import NewActivitiySheet from "../components/activities/NewActivitiy.vue";

const router = useRouter();
const route = useRoute();
const projectToken = ref(0);
const objectiveToken = ref(0);
const project = ref();
const role = ref();
const objective = ref("cargando...");
const task = ref([]);
const ready = ref(false);



onMounted(async () => {

  try {
    projectToken.value = parseInt(route.params.projectToken);
    objectiveToken.value = parseInt(route.params.objectiveToken);
    task.value = await getActivities(objectiveToken.value);
    console.log("tareas",task.value);
    const profileloaded = await updateProfile();

  } catch (error) {
    console.log('error.message');
    console.log(error.message);
  }

});

watch(() => route.params, (newParams, oldParams) => {
  projectToken.value = parseInt(newParams.projectToken);
  objectiveToken.value = parseInt(newParams.objectiveToken);

  getActivities(objectiveToken.value);
}, { deep: true });

const updateActivitiesList = async () => {

  task.value = await getActivities(objectiveToken.value);
};

const getActivities = async (idObjective) => {
  
  try {
    const data = await toProcess("Proyecto", "Task", "getTask", {
      idObjective,
    });

    console.log('getActivities',data);

    return data.activities;
  } catch (error) {
    console.log(error.message);
  }
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
      role.value = data.message[0].profile_desc;
      return true;
    }
  } catch (error) {
    console.log(error.message);
  }
};

const goBack = () => {
  console.log("goBack", projectToken.value);
  router.push({ path: `/Goals/${projectToken.value}` });
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
            Proyecto actual: {{ project }}
          </CardDescription>

        </div>
      </CardHeader>
    </Card>
  </div>

  <NewActivitiySheet 
    :id-objective="objectiveToken" 
    @activity-created="updateActivitiesList"
    />

  <div v-if="ready"></div>
  <TableActivities
    :id_proyecto="projectToken"
    :id_objetivo="objectiveToken"
    :activities="task"
    :role = "role"
    @activity-created="updateActivitiesList"
  />
</template>

<style scoped>
#pos {
  text-shadow: 0px 0px 10px #000000;
}
</style>
