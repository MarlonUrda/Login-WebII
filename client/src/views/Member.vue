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
import tableBO from "../components/member/tableMember.vue";
import newMember from "@/components/member/newMember.vue";


const router = useRouter();
const route = useRoute();
const projectToken = ref(0);
const dataTable = ref([]);
const member = ref([]);
const headers = ref(["ID", "Nombre", "Usuario", "Email",'rol','Opciones']);
const role = ref();
const project = ref();



onMounted(async () => {

  try {
    projectToken.value = parseInt(route.params.projectToken);
    dataTable.value = await getMembers(projectToken.value);
    console.log("datos",dataTable.value);
    const profileloaded = await updateProfile();

  } catch (error) {
    console.log('error.message');
    console.log(error.message);
  }

});

watch(() => route.params, (newParams, oldParams) => {
  projectToken.value = parseInt(newParams.projectToken);
  getMembers(projectToken.value);
}, { deep: true });

const getMembers = async (project) => {
  try {
    console.log('estoy en getMembers, ', project);
    const data = await toProcess("Basico", "Members", "getMembers", {
      project,
    });
    return data.data;
  } catch (error) {
    console.log('error.message');
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

const deleteMember = async (id) => {
  try {
    console.log('estoy en deleteMember', id);
    await getMembers(projectToken.value);

  } catch (error) {
    console.log(error.message);
  }
};

const goBack = () => {
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
    Lista de Miembros
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

  <newMember/>


  <table-b-o
  :data="dataTable"
  :headers="headers"
  :permit = "role"
  @delete="deleteMember"
  />


</template>

<style scoped>
#pos {
  text-shadow: 0px 0px 10px #000000;
}
</style>
