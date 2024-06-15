<script setup>
import { cn } from "@/lib/utils";

const props = defineProps({
  class: { type: null, required: false },
});
</script>

<template>
  <div
    :class="
      cn(' rounded-xl text-card-foreground shadow mx-[40%] w-[60%] z-10', props.class)
    "
  >
    <slot />
  </div>
</template>
