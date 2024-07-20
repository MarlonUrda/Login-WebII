<script setup>

import {
  Card,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { Button } from "@/components/ui/button"
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
} from '@/components/ui/table'

const projects = ref([
  {
    Project: '1',
    Name: 'Web II',
    Role: 'Diseñador',
    Creator: 'Marlon Urdaneta',
    StartDate: '14-05-24',
    EndDate: '22-07-24',
    toggleVar: 1,
  },
  {
    Project: '2',
    Name: 'Distribuidos',
    Role: 'Documentista',
    Creator: 'Andrés García',
    StartDate: '21-06-24',
    EndDate: '19-07-24',
    toggleVar: 0,
  },
  {
    Project: '3',
    Name: 'Ing. de Software',
    Role: 'Líder de Equipo',
    Creator: 'José Carrillo',
    StartDate: '10-07-24',
    EndDate: '21-07-24',
    toggleVar: 1,
  },
]);

const router = useRouter();

</script>

<template>
  <div id="welcome" class="absolute bg-gradient-to-tr from-blue-700 to-blue-400 top-[12%] left-[50%] -translate-x-[50%] w-[28%] h-[18%] rounded-[35px] border-8 border-white shadow-xl"/>
  <h1 id="pos" class="absolute text-4xl font-bold italic top-[25%] left-[18%] -translate-x-[50%] tracking-tight text-white underline underline-offset-4">Lista de Proyectos</h1>

  <div id="nomorepos">
    <Card class=" top-[10.7%] left-[10%] -translate-x-[50%] shadow-none border-none absolute">
      <CardHeader class="w-full">
        <CardTitle class="text-4xl text-white">¡Bienvenido, Andrés!</CardTitle>
    <div>
            <CardDescription class="text-lg text-white italic">
              (acá va el correo)
        </CardDescription>
        <CardDescription class="text-lg text-white font-bold">
            Elige el proyecto que deseas visualizar:
        </CardDescription>
        </div>
      </CardHeader>
    </Card>
  </div>

  <div id="projectlist" class="absolute bg-white top-[34%] left-[50%] -translate-x-[50%] w-[92.5%] h-[57.5%] rounded-[70px] shadow-xl">
    <ScrollArea  class="h-[93%] w-[93%] mt-[0.75%] ml-[3.5%]">
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
          <TableRow class="font-medium" v-for="Project in projects" :key="Project.Project">
            <TableCell class="text-center">{{ Project.Project }}</TableCell>
            <TableCell class="text-center text-blue-500"><button class="hover:underline">{{ Project.Name }}</button></TableCell>
            <TableCell class="text-center">{{ Project.Role }}</TableCell>
            <TableCell class="text-center">{{ Project.Creator }}</TableCell>
            <TableCell class="text-center">{{ Project.StartDate }}</TableCell>
            <TableCell class="text-center">{{ Project.EndDate }}</TableCell>
            <TableCell class="text-center">
              <button type="submit"><LogOut class="h-6 w-6 inline hover:text-red-500"/></button>

              <button type="submit" v-if="Project.toggleVar === 1"><Edit v-if="Project.toggleVar === 1" class="ml-4 mr-5 h-6 w-6 inline hover:text-blue-600"/></button>
              <button type="submit" v-if="Project.toggleVar === 0" disabled><Edit v-if="Project.toggleVar === 0" class="ml-4 mr-5 h-6 w-6 inline text-gray-400"/></button>

              <button type="submit" v-if="Project.toggleVar === 1"><Trash2 v-if="Project.toggleVar === 1" class="h-6 w-6 inline hover:text-amber-900"/></button>
              <button type="submit" v-if="Project.toggleVar === 0" disabled><Trash2 v-if="Project.toggleVar === 0" class="h-6 w-6 inline text-gray-400"/></button>
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
