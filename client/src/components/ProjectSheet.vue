<script setup>
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
  SheetClose,
} from "./ui/sheet";
import { Button } from "./ui/button";
import { Input } from "./ui/input";
import { RangeCalendar } from "./ui/range-calendar";
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
import { useToast } from "vue-toast-notification";

const toast = useToast();

const projectName = ref("");
const projectType = ref("");
const dates = ref({
  start: new CalendarDate(2024, 1, 20),
  end: new CalendarDate(2024, 1, 20).add({ days: 20 }),
});
const session = ref({});

const props = defineProps(["showSheet"]);

const df = new DateFormatter("en-US", {
  dateStyle: "short",
});

const getSession = async () => {
  const res = await fetch("http://localhost:3000/user-data", {
    method: "GET",
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
    },
  });

  if (res.ok) {
    const data = await res.json();
    return data;
  }
};

onMounted(async () => {
  session.value = await getSession();
});

const createProject = async () => {
  const startFormatted = dates.value.start.toString();
  const endFormatted = dates.value.end.toString();
  const data = await toProcess("Proyecto", "Project", "createProject", {
    nameP: projectName.value,
    typeP: projectType.value,
    startDate: startFormatted,
    endDate: endFormatted,
    idProject: session.value.idPerson,
  });

  if (data.success) {
    toast.success(data.message, { duration: 3000, position: "bottom-right" });
    return data;
  }

  if (!data.success) {
    toast.error(data.message, { duration: 3000, position: "bottom-right" });
  }
};
</script>

<template>
  <Sheet>
    <SheetTrigger as-child>
      <Button
        type="submit"
        variant="default"
        class="bg-blue-500 w-[10.3%] top-[1.5%] left-[13%] absolute"
      >
        <CirclePlus class="mt-[2%] mr-2 h-4 w-4" />Nuevo Proyecto</Button
      >
    </SheetTrigger>
    <SheetContent>
      <SheetHeader>
        <SheetTitle class="text-center">Nuevo Proyecto</SheetTitle>
        <SheetDescription class="text-center">
          Explora lo que es posible al colaborar con tu equipo. Edita los
          detalles del proyecto cuando quieras desde los ajustes.
        </SheetDescription>
      </SheetHeader>
      <form @submit.prevent="createProject()">
        <div class="grid gap-4 py-4">
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="project-name" class="text-center">
              Nombre del proyecto
            </Label>
            <Input
              id="project-name"
              v-model="projectName"
              placeholder="Nombre del Proyecto..."
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="project-type" class="text-center">
              ¿De qué trata el proyecto?
            </Label>
            <Input
              id="project-name"
              v-model="projectType"
              placeholder="Ej: Tecnologia..."
              class="col-span-3"
            />
          </div>
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
          <Button variant="default" type="submit">Crear Proyecto</Button>
        </SheetClose>
      </form>
    </SheetContent>
  </Sheet>
</template>
