<script setup>
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/sheet";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Calendar } from "@/components/ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
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
  DialogClose,
} from '@/components/ui/dialog';
import { Label } from '@/components/ui/label';



const activityName = ref("");
const activityDesc = ref("");
const dates = ref(new CalendarDate(2024, 1, 2));


const props = defineProps({
  nombre: {
    type: String,
    default: "Actividad",
  },
  actividad: {
    type: String,
    default: "Actividad",
  },
  idProject: {
    type: Number,
    default: 1,
  },
});

onMounted(() => {
  console.log("mounted");
  console.log("nombre", props.nombre);
  
});


const objectiveDesc = ref("");
const activityPercentage = ref(0);


const emit = defineEmits(['activityCreated']);



const sendReport = async () => {
  try {
    const  progreso = activityPercentage.value;
    const  comentario = objectiveDesc.value;
    const fecha = Date.now();
    const response = await toProcess("Basico", "Report", "newReport", {
        nombre: props.nombre, // Asumiendo que `props` es un objeto accesible y `nombre` es una propiedad de ese objeto
        actividad,
        progreso,
        comentario,
        fecha,
        idProject
    });

    let data = await response.json();
    
    if(data.success){

      toast.success(data.message, { duration: 3000, position: "bottom-right" })
    } 

  } catch (error) {  
    console.error('Error:', error);
  }
}


</script>

<template>
    <div class="Dialog-content">
      <div class="Dialog">

  <Dialog>
    <DialogTrigger as-child>

      <button class="hover:underline">
        {{props.nombre}}
              </button>

    </DialogTrigger>


    <DialogContent >

      <DialogHeader>
        <DialogTitle class="text-center font-bold text-2xl text-gray-800 my-1">Reporte de actividad:{{ props.nombre }}</DialogTitle>
      </DialogHeader>

      <form @submit.prevent="sendReport()">
        <div class="grid gap-4 py-4">
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="objective-desc" class="text-center">
              Notas de la actividad
            </Label>
            <Textarea
              id="objective-desc"
              placeholder="De que se trata el objetivo?.."
              v-model="objectiveDesc"
              class="col-span-3"
            />
          </div>
        </div>

        <div class="flex justify-start text left-0">
          <div class="w-1/2">
            <div class="flex items-center gap-4 py-1">
              <label for="activityPercentage" class="block text-sm font-medium text-gray-700">Porcentaje de la actividad hecha</label>
              <input type="number" id="activityPercentage" 
              min="1" max="100" step="1" 
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"  
              v-model="activityPercentage" required>
            </div>
          </div>
        </div>

        <DialogClose>
          <Button variant="default" type="submit">Enviar Reporte</Button>
        </DialogClose>
      </form>
      
      


    </DialogContent>
  </Dialog>

</div>
</div>
</template>

<style scoped>

</style>
