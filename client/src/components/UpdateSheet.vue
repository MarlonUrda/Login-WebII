<script setup>
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "./ui/sheet";
import { Button } from "./ui/button";
import { Input } from "./ui/input";
import { RangeCalendar } from "./ui/range-calendar";
import { Edit } from "lucide-vue-next";
import { Popover, PopoverContent, PopoverTrigger } from "./ui/popover";
import {
  CalendarDate,
  getLocalTimeZone,
  DateFormatter,
} from "@internationalized/date";
import { Calendar } from "lucide-vue-next";
import { onMounted, ref } from "vue";
import { toProcess } from "@/utils/toProcess";
import { CirclePlus } from "lucide-vue-next";

const props = defineProps(["nameP", "typeP", "idProject"]);

const projectName = ref(props.nameP);
const projectType = ref(props.typeP);
const dates = ref({
  start: new CalendarDate(2024, 1, 20),
  end: new CalendarDate(2024, 1, 20).add({ days: 20 }),
});

const df = new DateFormatter("en-US", {
  dateStyle: "short",
});

const updateProject = async () => {
  const startFormatted = dates.value.start.toString();
  const endFormatted = dates.value.end.toString();
  const data = await toProcess("Proyecto", "Project", "updateProject", {
    newName: projectName.value,
    newType: projectType.value,
    newStart: startFormatted,
    newEnd: endFormatted,
    idProject: props.idProject,
  });

  return data;
};

onMounted(() => {
  console.log(props.nameP, props.typeP);
});
</script>

<template>
  <Sheet>
    <SheetTrigger as-child>
      <button type="submit">
        <Edit class="ml-4 mr-5 h-6 w-6 inline hover:text-blue-600" />
      </button>
    </SheetTrigger>

    <SheetContent>
      <SheetHeader>
        <SheetTitle>Actualizar Proyecto {{ props.nameP }}</SheetTitle>
        <SheetDescription>
          A continuacion, sustituye la informacion de los campos que quieres
          actualizar
        </SheetDescription>
      </SheetHeader>
      <form @submit.prevent="updateProject()">
        <div class="grid gap-4 py-4">
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="project-name" class="text-right">
              Nombre del proyecto:
            </Label>
            <Input id="project-name" v-model="projectName" class="col-span-3" />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="project-type" class="text-right">
              De que trata el proyecto?:
            </Label>
            <Input id="project-name" v-model="projectType" class="col-span-3" />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Popover>
              <PopoverTrigger>
                <Button variant="default" class="col-span-3">
                  <Calendar class="mr-2 h-4 m-4" />
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
                    <div>Seleccione las nuevas fechas del proyecto</div>
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
        <Button variant="default" type="submit">Actualizar Proyecto</Button>
      </form>
    </SheetContent>
  </Sheet>
</template>
