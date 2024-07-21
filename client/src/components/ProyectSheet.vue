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
import { Popover, PopoverContent, PopoverTrigger } from "./ui/popover";
import { CalendarDate, getLocalTimeZone } from "@internationalized/date";
import { Calendar } from "lucide-vue-next";
import { ref, defineEmits } from "vue";
import { toProcess } from "@/utils/toProcess";

const projectName = ref("");
const projectType = ref("");
const dates = ref({
  start: new CalendarDate(),
  end: new CalendarDate(),
});
const members = ref([]);

const props = defineProps(["showSheet"]);

const emits = defineEmits(["sheetTrigger"]);

const createProject = (projectName, projectType, dates, members) => {
  console.log(
    projectName,
    projectType,
    dates.start.value,
    dates.end.value,
    members
  );
};
//async (
//   nameP,
//   typeP,
//   startDate,
//   endDate,
//   members,
//   idProject
// ) => {
//   const data = await toProcess("Proyecto", "Project", "createProject", {
//     nameP: nameP,
//     typeP: typeP,
//     startDate: startDate,
//     endDate: endDate,
//     membersDefault: members,
//     idProject: idProject,
//   });

//   return data;
// };
</script>

<template>
  <Sheet v-if="showSheet">
    <SheetContent>
      <SheetHeader>
        <SheetTitle>Nuevo Proyecto</SheetTitle>
        <SheetDescription>
          Explora lo que es posible al colaborar con tu equipo. Edita los
          detalles del proyecto cuando quieras desde los ajustes.
        </SheetDescription>
      </SheetHeader>
      <form @submit.prevent="">
        <div class="grid gap-4 py-4">
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="project-name" class="text-right">
              Nombre del proyecto:
            </Label>
            <Input
              id="project-name"
              v-model="projectName"
              placeholder="Nombre del Proyecto..."
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="project-type" class="text-right">
              De que trata el proyecto?:
            </Label>
            <Input
              id="project-name"
              v-model="projectType"
              placeholder="Ej: Tecnologia..."
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Popover>
              <PopoverTrigger>
                <Button variant="primary" class="col-span-3">
                  Selección de fechas
                </Button>
              </PopoverTrigger>
              <PopoverContent>
                <RangeCalendar
                  v-model="dates"
                  startLabel="Fecha de inicio"
                  endLabel="Fecha de finalización"
                />
              </PopoverContent>
            </Popover>
          </div>
        </div>
        <Button variant="primary" type="submit">Crear Proyecto</Button>
      </form>
    </SheetContent>
  </Sheet>
</template>
