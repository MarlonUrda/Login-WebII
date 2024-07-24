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
import { onMounted, onUpdated, ref, watch } from "vue";
import { toProcess } from "@/utils/toProcess";

const emit = defineEmits(['create', 'update', 'delete', 'leave']);
const role = ref('true');

const props = defineProps({
  data: Object,
  headers: Array,
  permit: String
});

onMounted(async () => {
  console.log("data", props.data, "headers", props.headers, "permit", props.permit);
});

watch(() => props, (newParams, oldParams) => {
  console.log("newParams", newParams.data, newParams.headers, newParams.permit);

  

}, { deep: true });



const deleteData = async (id) => {
  console.log("deleteData",id);

}


const updateData = async () => {
  console.log("updateData");
};

const leaveData = async () => {
  console.log("leaveData");
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
            <TableHead v-for="(header, index) in props.headers" :key="index" class="text-center font-bold">{{ header }}</TableHead>
          </TableRow>
        </TableHeader>

        <TableBody class="text-base">
          <TableRow
            class="font-medium"
            v-for="(objeto, index) in props.data"
            :key="Object.values(objeto)[0]"
          >
            <TableCell class="text-center">
              {{ index + 1 }}
            </TableCell>

            <TableCell class="text-center text-blue-500">
              <button class="hover:underline">
                {{ Object.values(objeto)[1] }}
              </button>
            </TableCell>

            
              <!-- Repite un TableCell por cada valor en el objeto empezando desde el tercer valor -->
            <TableCell class="text-center" v-for="(valor, i) in Object.values(objeto).slice(2)" :key="`cell-${index}-${i}`">
              {{ valor }}
            </TableCell>
          


            <TableCell class="text-center" v-if="role">
              <button>
                <Trash2
                class="h-6 w-6 inline hover:text-red-700"
                  @click="deleteData(Object.values(objeto)[0])"
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
