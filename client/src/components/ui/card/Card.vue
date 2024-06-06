<script setup>
import { cn } from "@/lib/utils";

const props = defineProps({
  class: { type: null, required: false },
});
</script>

<template>
  <div
    :class="
      cn(' rounded-xl text-card-foreground shadow w-full z-10', props.class)
    "
  >
    <slot />
  </div>
</template>
