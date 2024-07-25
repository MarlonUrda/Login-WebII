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
import { onMounted, ref, watch } from "vue";
import { toProcess } from "@/utils/toProcess";
import { set } from "zod";
import { CalendarDate, getLocalTimeZone, DateFormatter } from "@internationalized/date";


const props=defineProps({
  id_proyecto: Number,

});

const id_proyecto = ref(0);




const invoices = ref([]);

onMounted(async () => {
  id_proyecto.value = props.id_proyecto;
  const df = new DateFormatter({
  year: "numeric",
  month: "numeric",
  day: "numeric",
  hour: "numeric",
  minute: "numeric",
  hour12: true, 
  timeZone: getLocalTimeZone()
});




  const response = await toProcess("Basico", "Report", "getReport", {
    id_proyecto: id_proyecto.value,
  }).then((data) => {
    console.log("data", data.data);

    for (let objeto of data.data){

      const customFormattedDate = formatISODateToCustomString(objeto.fecha);


      invoices.value.unshift({
        fecha: customFormattedDate,
        reporte: `${objeto.nombre} cambió el progreso de la actividad ${objeto.actividad} a ${objeto.progreso}% con el siguiente anuncio: "${objeto.comentario}".`,
      });
    }
    console.log("invoices", invoices.value);

  });



});

watch(props, (newParams, oldParams) => {
    console.log("change props", newParams);
    id_proyecto.value = props.id_proyecto;
  }, { deep: true });



  function formatISODateToCustomString(isoDateString) {
    const date = new Date(isoDateString);
    const day = date.getDate();
    const month = date.getMonth() + 1; // Los meses en JavaScript comienzan en 0
    const year = date.getFullYear();
    let hours = date.getHours();
    const minutes = date.getMinutes();
    const ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // La hora '0' debe ser '12'
    const formatted = `${day}-${month}-${year} ${hours}:${minutes < 10 ? '0' + minutes : minutes}${ampm}`;
    return formatted;
  }
  
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