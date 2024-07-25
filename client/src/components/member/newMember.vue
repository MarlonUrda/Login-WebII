<script setup>
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "../ui/sheet";
import { Button } from "../ui/button";
import { Input } from "../ui/input";
import { Textarea } from "../ui/textarea";
import { Calendar } from "../ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "../ui/popover";
import {  CalendarDate,getLocalTimeZone,DateFormatter } from "@internationalized/date";
import { CalendarFold } from "lucide-vue-next";
import { onMounted, ref } from "vue";
import { toProcess } from "@/utils/toProcess";
import { CirclePlus } from "lucide-vue-next";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog';
import { Label } from '@/components/ui/label';
import dataTable from "@/components/member/dataTable.vue";

const activityName = ref("");
const activityDesc = ref("");
const dates = ref(new CalendarDate(2024, 1, 2));

const props = defineProps({
  idObjective: Number,
});
const emit = defineEmits(['activityCreated']);

const df = new DateFormatter("en-US", {
  dateStyle: "short",
});

const createActivity = async () => {
  const limitFormatted = dates.value.toString();
  const data = await toProcess("Proyecto", "Task", "createTask", {
    taskName: activityName.value,
    taskDesc: activityDesc.value,
    idOb: props.idObjective,
    
    deadline: limitFormatted,
  });
  emit('activityCreated', { /* datos de la actividad */ });
  return data;
};
</script>

<template>
  <Dialog>
    <DialogTrigger as-child>
      <Button
        type="submit"
        variant="default"
        class="text-black bg-white w-[12.8%] h-[6%] top-[25%] left-[79%] absolute text-lg hover:text-white border-2 border-white"
      >
        <CirclePlus class="mt-[1%] mr-2 h-4 w-4" />Añadir Miembros</Button
      >
    </DialogTrigger>
    <DialogContent class="custom-dialog-content">
      
      <DialogHeader>
        <DialogTitle class="text-center">Añadir Miembros</DialogTitle>
        <DialogDescription class="text-center">
          Busca y añade miembros al proyecto para que puedan colaborar en las tareas. 
        </DialogDescription>
      </DialogHeader>

      <data-table/>
    </DialogContent>
  </Dialog>
</template>

<style>
.custom-dialog-content {
  width: 90vw; /* Ajusta la anchura al 90% del ancho de la ventana */
  height: 80vh; /* Ajusta la altura al 80% del alto de la ventana */
  max-width: 1000px; /* Opcional: establece un ancho máximo */
  max-height: 600px; /* Opcional: establece una altura máxima */
  /* Agrega cualquier otro estilo que necesites */
}
</style>
