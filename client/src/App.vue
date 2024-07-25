<script setup>
import { computed } from "vue";
import { useRoute } from "vue-router";
//import Integrantes from './components/Integrantes.vue';
import Background from "./components/Background.vue";
import TitleCard from "./views/TitleCard.vue";
import Titlebar from "./components/Titlebar.vue";
import ProjectSheet from "./components/ProjectSheet.vue";
import Gantt from "./components/Gantt.vue";
import tablaReporte from "./components/tableReporte.vue";
// Import GoalsSheet if needed

const route = useRoute();

const isActivityRoute = computed(() => {
  const regex = /^\/Goals\/[^/]+\/Activities\/[^/]+$/i; // probar  /Goals/:token/Activities/:token
  return regex.test(route.path);
});

const isGoalRoute = computed(() => {
  const regex = /^\/Goals\/.+$/i;
  return regex.test(route.path);
});

const isHomeRoute = computed(() => {
  const regex = /^\/Home(\/|$)/i;
  return regex.test(route.path);
});

const isMemberRoute = computed(() => {
  const regex = /^\/Member\/.+$/i;
  return regex.test(route.path);
});

const showComponents = computed(() => {
  return !isHomeRoute.value && !isGoalRoute.value && !isActivityRoute.value  && !isMemberRoute.value
});

const  showGoalSheet = computed(() => {
  return !isGoalRoute.value && isActivityRoute.value && !isMemberRoute.value
});

const showIntegrantes = computed(() => {
  return !isHomeRoute.value && !isGoalRoute.value && !isActivityRoute.value;
});
</script>

<template>
  <div id="app">
    <!-- <Gantt/>
    <tablaReporte/> -->
    <TitleCard v-if="showComponents" />
    <Titlebar v-if="!showComponents" />
    <!-- <Integrantes v-if="showGoalSheet" /> -->
    <ProjectSheet v-if="!showComponents" />
    <!-- <GoalsSheet v-if="showGoalSheet" /> Uncomment if GoalsSheet is used -->
    <Background />
    <router-view />
  </div>
</template>