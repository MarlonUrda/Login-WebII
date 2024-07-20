<script setup>
import { Button } from '../components/ui/button';
import { ScrollArea } from "@/components/ui/scroll-area";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { UserRoundPlus } from "lucide-vue-next";
</script>

<template>
    <Button
    type="submit"
    variant="default"
    class="text-white bg-blue-400 w-[11.5%] h-[5%] top-[11%] left-[98%] -translate-x-full absolute hover:bg-white hover:text-black"
    ><UserRoundPlus class="mt-[2%] mr-2 h-4 w-4 inline" />Añadir Integrantes</Button>
    <!-- <Dialog>
    </Dialog> -->
</template>