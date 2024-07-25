<script setup>
import { ScrollArea } from "@/components/ui/scroll-area";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { onMounted, ref } from "vue";

const invoices = ref([
  {
    fecha: '25-7-2024 8:38pm.',
    reporte: `Marlon Urdaneta (@Levizz) cambió el progreso de la actividad Pochoclo a 80% con el siguiente anuncio: "Acabo de terminar el Backend, pasando a conectar".`,
  },
  {
    fecha: '26-7-2024 9:41pm.',
    reporte: `andres garcia (@atlas) cambió el progreso de la actividad Vacas II a 100% con el siguiente anuncio: "Conectado el front al back con exito.".`,
  },
]);

</script>

<template>
<h1
    class="absolute text-4xl font-bold italic top-[14%] left-[17.5%] -translate-x-[50%] tracking-tight text-white underline underline-offset-4"
  >
    Últimos Reportes
  </h1>

  <div
    id="reportediv"
    class="absolute bg-white top-[23%] left-[2%] w-[31%] h-[71.5%] rounded-[25px] shadow-xl"
  >
    <ScrollArea class="h-[93%] w-[93%] mt-[0.75%] ml-[3.5%]">
      <Table>
        <TableHeader class="text-lg italic">
          <TableRow>
            <TableHead class="text-center font-bold">Fecha</TableHead>
            <TableHead class="text-center font-bold">Reporte</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          <TableRow
            v-for="(invoice, index) in invoices"
            :key="index"
          >
            <TableCell class="text-center font-medium">
              {{ invoice.fecha }}
            </TableCell>
            <TableCell class="text-center italic w-[60%]">
              {{ invoice.reporte }}
            </TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </ScrollArea>
  </div>

</template>