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
  <Sheet>
    <SheetTrigger as-child>
      <Button
        type="submit"
        variant="default"
        class="text-black bg-white w-[12.8%] h-[6%] top-[25%] left-[79%] absolute text-lg hover:text-white border-2 border-white"
      >
        <CirclePlus class="mt-[1%] mr-2 h-4 w-4" />Nueva Actividad</Button
      >
    </SheetTrigger>
    <SheetContent>
      <SheetHeader>
        <SheetTitle class="text-center">Nuevo Actividad</SheetTitle>
        <SheetDescription class="text-center">
          Comparte con tus compañeros de equipo las actividades que deben
          completar para cumplir la meta. Te recirdamos que, si te equivocas...
          No importa!. Siempre puedes modificar la actividad.
        </SheetDescription>
      </SheetHeader>
      <form @submit.prevent="createActivity()">
        <div class="grid gap-4 py-4">
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="activity-name" class="text-center">
              Nombre de la Actividad
            </Label>
            <Input
              id="activity-name"
              v-model="activityName"
              placeholder="Nombre del actividad..."
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="activity-desc" class="text-center">
              Descripcion de la Actividad
            </Label>
            <Textarea
              id="activity-desc"
              placeholder="De que se trata el actividad.."
              v-model="activityDesc"
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Popover>
              <PopoverTrigger>
                <Button variant="outline" type="button">
                  <CalendarFold class="mr-2 h-4 m-4" />
                  {{
                    dates
                      ? df.format(dates.toDate(getLocalTimeZone()))
                      : "Escoge una fecha"
                  }}
                </Button>
              </PopoverTrigger>
              <PopoverContent class="w-auto p-0">
                <Calendar v-model="dates" initial-focus />
              </PopoverContent>
            </Popover>
          </div>
        </div>
        <Button variant="default" type="submit">Crear actividad</Button>
      </form>
    </SheetContent>
  </Sheet>
</template>
