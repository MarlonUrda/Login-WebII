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
} from '@/components/ui/table'

const goals = ref([
  {
    Goal: '1',
    Name: 'Front End',
    Desc: 'Encargado de la planeación y diseño de las interfaces del sistema.',
    EndDate: '22-07-24',
    toggleVar: 1,
  },
  {
    Goal: '2',
    Name: 'Back End',
    Desc: 'Encargado de la lógica, seguridad y funcionamiento de la aplicación.',
    EndDate: '22-07-24',
    toggleVar: 0,
  },
  {
    Goal: '3',
    Name: 'Base de Datos',
    Desc: 'Encargado del mantenimiento y cambios de los diagramas entidad-relación',
    EndDate: '22-07-24',
    toggleVar: 1,
  },
]);

const router = useRouter();

</script>

<template>
  <div id="welcome" class="absolute bg-gradient-to-tr from-blue-700 to-blue-400 top-[12%] left-[50%] -translate-x-[50%] w-[28%] h-[18%] rounded-[35px] border-8 border-white shadow-xl"/>
  <h1 id="pos" class="absolute text-4xl font-bold italic top-[25%] left-[18%] -translate-x-[50%] tracking-tight text-white underline underline-offset-4">Lista de Objetivos</h1>

  <Button type="submit" variant="default" class=" text-black bg-white w-[6.2%] h-[5%] top-[11%] left-[2%] absolute hover:text-white border-2 border-white"><ChevronLeft class=" mt-[2%] mr-2 h-4 w-4 inline"/>Volver</Button>
  <Button type="submit" variant="default" class=" text-white bg-blue-400 w-[11.5%] h-[5%] top-[11%] left-[98%] -translate-x-full absolute hover:bg-white hover:text-black"><UserRoundPlus class=" mt-[2%] mr-2 h-4 w-4 inline"/>Añadir Integrantes</Button>

  <div id="nomorepos">
    <Card class=" top-[10.7%] left-[10%] -translate-x-[50%] shadow-none border-none absolute">
      <CardHeader class="w-full">
        <CardTitle class="text-4xl text-white">¡Hola, Líder de Equipo!</CardTitle>
    <div>
            <CardDescription class="text-lg text-white italic">
              Proyecto: (acá va el nombre) (y arriba va el rol)
        </CardDescription>
        <CardDescription class="text-lg text-white font-bold">
            Elige el objetivo en el que deseas entrar:
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
            <TableHead class="text-center font-bold">Objetivo</TableHead>
            <TableHead class="text-center font-bold">Descripción</TableHead>
            <TableHead class="text-center font-bold">Fecha Objetivo</TableHead>
            <TableHead class="text-center font-bold">Opciones</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody class="text-base">
          <TableRow class="font-medium" v-for="Goal in goals" :key="Goal.Goal">
            <TableCell class="text-center">{{ Goal.Goal }}</TableCell>
            <TableCell class="text-center text-blue-500"><button class="hover:underline">{{ Goal.Name }}</button></TableCell>
            <TableCell class="text-center overflow-hidden text-nowrap text-ellipsis">{{ Goal.Desc }}</TableCell>
            <TableCell class="text-center">{{ Goal.EndDate }}</TableCell>
            <TableCell class="text-center">
              <button type="submit" v-if="Goal.toggleVar === 1"><Edit v-if="Goal.toggleVar === 1" class="ml-4 mr-5 h-6 w-6 inline hover:text-blue-600"/></button>
              <button type="submit" v-if="Goal.toggleVar === 0" disabled><Edit v-if="Goal.toggleVar === 0" class="ml-4 mr-5 h-6 w-6 inline text-gray-400"/></button>

              <button type="submit" v-if="Goal.toggleVar === 1"><Trash2 v-if="Goal.toggleVar === 1" class="h-6 w-6 inline hover:text-red-700"/></button>
              <button type="submit" v-if="Goal.toggleVar === 0" disabled><Trash2 v-if="Goal.toggleVar === 0" class="h-6 w-6 inline text-gray-400"/></button>
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
