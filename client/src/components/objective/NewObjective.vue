<script setup>
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
  SheetClose,
} from "../ui/sheet";
import { Button } from "../ui/button";
import { Input } from "../ui/input";
import { Textarea } from "../ui/textarea";
import { Calendar } from "../ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "../ui/popover";
import {
  CalendarDate,
  getLocalTimeZone,
  DateFormatter,
} from "@internationalized/date";
import { CalendarFold } from "lucide-vue-next";
import { onMounted, ref } from "vue";
import { toProcess } from "@/utils/toProcess";
import { CirclePlus } from "lucide-vue-next";
import { useToast } from "vue-toast-notification";

const toast = useToast();
const succesMessage = ref("");
const errorMessage = ref("");
const objectiveName = ref("");
const objectiveDesc = ref("");
const dates = ref(new CalendarDate(2024, 1, 2));

const emit = defineEmits(["create"]);

const props = defineProps(["idProject"]);

const df = new DateFormatter("en-US", {
  dateStyle: "short",
});

const createObjective = async () => {
  try {
    const limitFormatted = dates.value.toString();
    const data = await toProcess("Proyecto", "Objectives", "createObjective", {
      nameP: objectiveName.value,
      objdesc: objectiveDesc.value,
      idProject: props.idProject,
      dateLimit: limitFormatted,
    });

    if (!data.success) {
      errorMessage.value = data.message;
      toast.error(errorMessage.value, {duration: 3000,position: "bottom-right"});
    } 
    
    succesMessage.value = data.message;
    toast.success(succesMessage.value, {
      duration: 3000,
      position: "bottom-right",
    });
    emit("create");
    return data;
    
  } catch (error) {
    console.log(error.message);
    
  }

  
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
        <CirclePlus class="mt-[1%] mr-2 h-4 w-4" />Nuevo Objetivo</Button
      >
    </SheetTrigger>
    <SheetContent>
      <SheetHeader>
        <SheetTitle class="text-center">Nuevo Objetivo</SheetTitle>
        <SheetDescription class="text-center">
          Hazle saber a tus compañeros de trabajo que metas deben lograr!. No te
          preocupes por equivocarte, siempre podras modificar los detalles del
          objetivo.
        </SheetDescription>
      </SheetHeader>
      <form @submit.prevent="createObjective()">
        <div class="grid gap-4 py-4">
          <div class="grid grid-cols-4 items-center gap-4">
            <Label for="objective-name" class="text-center">
              Nombre del objetivo:
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
            <Label for="objective-desc" class="text-center">
              Fecha Inicio
            </Label>
            <Popover>
              <PopoverTrigger>
                <Button variant="outline" type="button">
                  <CalendarFold class="mr-2 h-4 m-4 text-center" />
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
        <SheetClose>
          <Button variant="default" type="submit">Crear Objetivo</Button>
        </SheetClose>
      </form>
    </SheetContent>
  </Sheet>
</template>
