<script setup>
import { ScrollArea } from "@/components/ui/scroll-area";
import { Trash2 } from "lucide-vue-next";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

const props = defineProps({
  id_proyecto,
  id_objetivo,
});

const getGoals = async (idProject) => {
  const data = await toProcess("Proyecto", "Activities", "get", {idProject});
  return data.objectives;
};

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
            <TableHead class="text-center font-bold">Fecha Inicio</TableHead>
            <TableHead class="text-center font-bold">Fecha Fin</TableHead>
            <TableHead class="text-center font-bold">Estado</TableHead>
            <TableHead class="text-center font-bold">Opciones</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody class="text-base">
          <TableRow
            class="font-medium"
            v-for="(goal, index) in goals"
            :key="goal.objective_id"
          >
            <TableCell class="text-center">{{ index + 1 }}</TableCell>
            <TableCell class="text-center text-blue-500">
                <button 
                    class="hover:underline" 
                    @click="viewProject(goal.objective_id,project.project_name,project.profile_desc)"
                >
                    {{ goal.objective_name }}
                </button>
            </TableCell>

            <TableCell
              class="text-center overflow-hidden text-nowrap text-ellipsis"
              >{{ goal.objective_desc }}</TableCell
            >
            <TableCell class="text-center">{{
              goal.deadline.split("T")[0]
            }}</TableCell>
            <TableCell class="text-center">
              <UpdateObjective
                v-if="
                  role === 'Project Manager' || role === 'Arquitecto Software'
                "
                :name="goal.objective_name"
                :description="goal.objective_desc"
                :objective-id="goal.objective_id"
              />

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
                  @click="deleteObjective(goal.objective_id)"
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

