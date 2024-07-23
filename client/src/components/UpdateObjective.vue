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
import { Textarea } from "./ui/textarea";
import { Edit } from "lucide-vue-next";
import { Calendar } from "./ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "./ui/popover";
import {
  CalendarDate,
  getLocalTimeZone,
  DateFormatter,
} from "@internationalized/date";
import { CalendarFold } from "lucide-vue-next";
import { computed, onMounted, ref } from "vue";
import { toProcess } from "@/utils/toProcess";
import { CirclePlus } from "lucide-vue-next";
import { useToast } from "vue-toast-notification";

const toast = useToast();
const props = defineProps(["name", "description", "objectiveId", "role"]);
console.log(props.role);

const objectiveName = ref(props.name);
const objectiveDesc = ref(props.description);
const date = ref(new CalendarDate(2024, 1, 2));

const df = new DateFormatter("en-US", {
  dateStyle: "short",
});

const isDisabled = computed(() => {
  return (
    props.role !== "Project Manager" && props.role !== "Arquitecto Software"
  );
});

console.log(isDisabled);

const updateObjective = async () => {
  const limitFormatted = date.value.toString();
  const data = await toProcess("Proyecto", "Objectives", "updateObjective", {
    newName: objectiveName.value,
    newDesc: objectiveDesc.value,
    newDateLimit: limitFormatted,
    idOb: props.objectiveId,
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
      <button type="submit" :disabled="isDisabled">
        <Edit
          v-if="isDisabled"
          class="ml-4 mr-5 h-6 w-6 inline text-gray-400"
        />
        <Edit class="ml-4 mr-5 h-6 w-6 inline hover:text-blue-600" v-else />
      </button>
    </SheetTrigger>
    <SheetContent>
      <SheetHeader>
        <SheetTitle class="text-center"
          >Actualizar Objetivo: {{ props.name }}</SheetTitle
        >
        <SheetDescription class="text-center">
          A continuacion, sustituye la informacion de los campos que quieres
          actualizar
        </SheetDescription>
      </SheetHeader>
      <form @submit.prevent="updateObjective()">
        <div class="grid gap-4 py-4">
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="objective-name" class="text-center">
              Nombre del objetivo
            </Label>
            <Input
              id="objective-name"
              v-model="objectiveName"
              placeholder="Nombre del objetivo..."
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="objective-desc" class="text-center">
              Descripcion del objetivo
            </Label>
            <Textarea
              id="objective-desc"
              placeholder="De que se trata el objetivo?.."
              v-model="objectiveDesc"
              class="col-span-3"
            />
          </div>
          <div class="grid grid-cols-4 items-center gap-4">
            <Popover>
              <PopoverTrigger>
                <Button variant="outline" type="button">
                  <CalendarFold class="mr-2 h-4 m-4 text-center" />
                  {{
                    date
                      ? df.format(date.toDate(getLocalTimeZone()))
                      : "Escoge una fecha"
                  }}
                </Button>
              </PopoverTrigger>
              <PopoverContent class="w-auto p-0">
                <Calendar v-model="date" initial-focus />
              </PopoverContent>
            </Popover>
          </div>
        </div>
        <SheetClose>
          <Button variant="default" type="submit">Actualizar</Button>
        </SheetClose>
      </form>
    </SheetContent>
  </Sheet>
</template>
