<script setup>
import { ScrollArea } from "@/components/ui/scroll-area";
import { Trash2 } from "lucide-vue-next";
import {Table,TableBody,TableCaption,TableCell,TableHead,TableHeader,TableRow,} from "@/components/ui/table";
import { onMounted,ref } from "vue";

const activities = ref([]);
const role =  ref("Basico")

const props = defineProps({
  id_proyecto: Number,
  id_objetivo: Number,
  activities: Array
});  



/* const id_objetivo = 1
const id_proyecto  = 1 */

onMounted(async () => {
  try {

    console.log("id_proyecto",props.id_proyecto);
    console.log("id_objetivo",props.id_objetivo);
    console.log("fff")
    
    console.log("activities", activities.value);
    activities.value = props.activities

  }catch (error) {
    console.log(error.message);
  }
});


</script>

<template>
        <div
            id="projectlist"
            class="absolute bg-white top-[34%] left-[50%] -translate-x-[50%] w-[92.5%] h-[57.5%] rounded-[70px] shadow-xl"
        >
    <ScrollArea class="h-[93%] w-[93%] mt-[0.75%] ml-[3.5%]">
      <Table>
        <TableHeader class="text-lg italic">
          <TableRow>
            <TableHead class="text-center font-bold">N°.</TableHead>
            <TableHead class="text-center font-bold">Actividad</TableHead>
            <TableHead class="text-center font-bold">Descripcion</TableHead>
            <TableHead class="text-center font-bold">Fecha Fin</TableHead>
            <TableHead class="text-center font-bold">Estado</TableHead>
            <TableHead class="text-center font-bold">Opciones</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody class="text-base">
          <TableRow
            class="font-medium"
            v-for="(activity, index) in activities"
            :key="activity.task_id"
          >
            <TableCell class="text-center">{{ index + 1 }}</TableCell>
            <TableCell class="text-center text-blue-500">
                <button 
                    class="hover:underline" 
                >
                    {{ activity.task_name }}
                </button>
            </TableCell>

            <TableCell
              class="text-center overflow-hidden text-nowrap text-ellipsis"
              >{{ activity.task_desc }}</TableCell
            >


            <TableCell class="text-center">
              {{activity.deadline.split("T")[0]}}
            </TableCell>

            <TableCell
              class="text-center overflow-hidden text-nowrap text-ellipsis"
              >{{ props.id_objetivo }}</TableCell
            >

            <TableCell class="text-center">

              <button
                type="submit"
                v-if="
                  role === 'Project Manager' || role === 'Arquitecto Software'
                "
              >
                <Trash2
                  v-if="
                    role === 'Project Manager' || role === 'Arquitecto Software'
                  "
                  class="h-6 w-6 inline hover:text-red-700"
                  @click="deleteActivity(activity.task_id)"
                />
              </button>
              <button
                type="submit"
                v-if="
                  role !== 'Project Manager' && role !== 'Arquitecto Software'
                "
                disabled
              >
                <Trash2
                  v-if="
                    role !== 'Project Manager' && role !== 'Arquitecto Software'
                  "
                  class="h-6 w-6 inline text-gray-400"
                />
              </button>
            </TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </ScrollArea>
  </div>
</template>

<style scoped>
#pos {
  text-shadow: 0px 0px 10px #000000;
}
</style>

