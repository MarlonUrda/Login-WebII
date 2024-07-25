<script setup>
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,SheetClose
} from "@/components/ui/sheet";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Calendar } from "lucide-vue-next";
import { RangeCalendar } from "@/components/ui/range-calendar";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import {  CalendarDate, getLocalTimeZone, DateFormatter } from "@internationalized/date";
import { onMounted, ref } from "vue";
import { toProcess } from "@/utils/toProcess";
import { CirclePlus } from "lucide-vue-next";

const activityName = ref("");
const activityDesc = ref("");
// const dates = ref(new CalendarDate(2024, 1, 2));
const dates = ref({
  start: new CalendarDate(2024, 7, 25),
  end: new CalendarDate(2024, 7, 25).add({ days: 20 }),
});

const props = defineProps({
  idObjective: Number,
});
const emit = defineEmits(['activityCreated']);

const df = new DateFormatter("en-US", {
  dateStyle: "short",
});

const createActivity = async () => {
  const startFormatted = dates.value.start.toString();
  const endFormatted = dates.value.end.toString();
  // const limitFormatted = dates.value.toString();
  const data = await toProcess("Proyecto", "Task", "createTask", {
    taskName: activityName.value,
    taskDesc: activityDesc.value,
    idOb: props.idObjective,
    startDate: startFormatted,
    endDate: endFormatted,
    // deadline: limitFormatted,
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
        <SheetTitle class="text-center">Nueva Actividad</SheetTitle>
        <SheetDescription class="text-center">
          Comparte con tus compañeros de equipo las actividades que deben
          completar para cumplir la meta. Te recordamos que, si te equivocas...
          ¡No importa! Siempre puedes modificar la actividad.
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
              placeholder="Nombre de la actividad..."
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="activity-desc" class="text-center">
              Descripcion de la Actividad
            </Label>
            <Textarea
              id="activity-desc"
              placeholder="¿De qué se trata el actividad?"
              v-model="activityDesc"
              class="col-span-3"
            />
          </div>
          <!-- <div class="grid grid-cols-4 items-center gap-4">
            <Label for="objective-desc" class="text-center">
              Fechas de Inicio y Fin
            </Label>
            <Popover>
              <PopoverTrigger>
                <Button variant="outline" type="button">
                  <CalendarFold class="-ml-2 mr-2 h-4 m-4" />
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
          </div> -->
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="objective-desc" class="text-center">
              Fechas de Inicio y Fin
            </Label>
            <Popover>
              <PopoverTrigger>
                <Button variant="default" class="col-span-3" type="button">
                  <Calendar class="-ml-1 mr-2 h-4 m-4" />
                  <template v-if="dates.start">
                    <template v-if="dates.end">
                      {{ df.format(dates.start.toDate(getLocalTimeZone())) }} -
                      {{ df.format(dates.end.toDate(getLocalTimeZone())) }}
                    </template>
                    <template v-else>
                      {{ df.format(dates.start.toDate(getLocalTimeZone())) }}
                    </template>
                  </template>
                  <template v-else>
                    <div>Seleccione las fechas del proyecto</div>
                  </template>
                </Button>
              </PopoverTrigger>
              <PopoverContent class="w-auto p-0">
                <RangeCalendar
                  v-model="dates"
                  initial-focus
                  :number-of-months="2"
                  @update:start-value="(startDate) => (dates.start = startDate)"
                />
              </PopoverContent>
            </Popover>
          </div>
        </div>
        <SheetClose>
          <Button variant="default" type="submit">Crear actividad</Button>
        </SheetClose>
      </form>
    </SheetContent>
  </Sheet>
</template>
