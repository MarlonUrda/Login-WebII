<script setup>
import {
  Card,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { onMounted, ref } from "vue";
import { useRouter } from "vue-router";
import { Button } from "@/components/ui/button";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Edit } from "lucide-vue-next";
import { Trash2 } from "lucide-vue-next";
import { LogOut } from "lucide-vue-next";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

const router = useRouter();
const userdata = ref({});

const getSession = async () => {
  const res = await fetch("http://localhost:3000/user-data", {
    method: "GET",
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
    },
  });

  if (res.ok) {
    const data = await res.json();
    return data;
  }
};

const projects = ref([]);

const getProjects = async (idPerson) => {
  const res = await fetch("http://localhost:3000/toProcess", {
    method: "POST",
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      modulo: "Proyecto",
      clase: "Project",
      metodo: "getProjectsByPersone",
      params: {
        idPerson: idPerson,
      },
    }),
  });

  if (res.ok) {
    const data = await res.json();
    return data.projects;
  }
};

onMounted(async () => {
  userdata.value = await getSession();
  console.log(userdata.value);
  const p = await getProjects(userdata.value.idPerson);
  projects.value = [...projects.value, ...p];
  console.log(projects.value);
});

const viewProject = (idP, nameP, role) => {
  console.log("Viewing project:", idP, nameP, role);
  router.push({
    name: "Goals",
    params: {
      idP: idP,
      nameP: nameP,
      role: role,
    },
  });
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
    Lista de Proyectos
  </h1>

  <div id="nomorepos">
    <Card
      class="top-[10.7%] left-[10%] -translate-x-[50%] shadow-none border-none absolute"
    >
      <CardHeader class="w-full">
        <CardTitle class="text-4xl text-white"
          >¡Bienvenido, {{ userdata.name }}!</CardTitle
        >
        <div>
          <CardDescription class="text-lg text-white italic">
            {{ userdata.email }}
          </CardDescription>
          <CardDescription class="text-lg text-white font-bold">
            Elige el proyecto que deseas visualizar:
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
            <TableHead class="text-center font-bold">Proyecto</TableHead>
            <TableHead class="text-center font-bold">Tu Rol</TableHead>
            <TableHead class="text-center font-bold">Creador</TableHead>
            <TableHead class="text-center font-bold">Fecha de Inicio</TableHead>
            <TableHead class="text-center font-bold">Fecha Objetivo</TableHead>
            <TableHead class="text-center font-bold">Opciones</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody class="text-base">
          <TableRow
            class="font-medium"
            v-for="(project, index) in projects"
            :key="project.project_id"
          >
            <TableCell class="text-center">{{ index + 1 }}</TableCell>
            <TableCell class="text-center text-blue-500"
              ><button
                class="hover:underline"
                @click="
                  viewProject(
                    project.project_id,
                    project.project_name,
                    project.profile_desc
                  )
                "
              >
                {{ project.project_name }}
              </button></TableCell
            >
            <TableCell class="text-center">{{
              project.profile_desc
            }}</TableCell>
            <TableCell class="text-center">{{ project.creator }}</TableCell>
            <TableCell class="text-center">{{
              project.start_date.split("T")[0]
            }}</TableCell>
            <TableCell class="text-center">{{
              project.end_date.split("T")[0]
            }}</TableCell>
            <TableCell class="text-center">
              <button type="submit">
                <LogOut class="h-6 w-6 inline hover:text-red-500" />
              </button>

              <button
                type="submit"
                v-if="
                  project.profile_desc == 'Project Manager' ||
                  project.profile_desc == 'Arquitecto Software'
                "
              >
                <Edit
                  v-if="
                    project.profile_desc == 'Project Manager' ||
                    project.profile_desc == 'Arquitecto Software'
                  "
                  class="ml-4 mr-5 h-6 w-6 inline hover:text-blue-600"
                />
              </button>
              <button
                type="submit"
                v-if="
                  project.profile_desc !== 'Project Manager' &&
                  project.profile_desc !== 'Arquitecto Software'
                "
                disabled
              >
                <Edit class="ml-4 mr-5 h-6 w-6 inline text-gray-400" />
              </button>

              <button
                type="submit"
                v-if="
                  project.profile_desc == 'Project Manager' ||
                  project.profile_desc == 'Arquitecto Software'
                "
              >
                <Trash2 class="h-6 w-6 inline hover:text-amber-900" />
              </button>
              <button
                type="submit"
                v-if="
                  project.profile_desc !== 'Project Manager' &&
                  project.profile_desc !== 'Arquitecto Software'
                "
              >
                <Trash2 class="h-6 w-6 inline text-gray-400" />
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
