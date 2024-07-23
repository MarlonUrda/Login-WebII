<script>
import Background from "./components/Background.vue";
import TitleCard from "./views/TitleCard.vue";
import Titlebar from "./components/Titlebar.vue";
import Integrantes from "./components/Integrantes.vue";
import ProjectSheet from "./components/ProjectSheet.vue";
//import GoalsSheet from "./components/GoalsSheet.vue";
import { computed } from "vue";
import { useRoute } from "vue-router";

export default {
  name: "App",
  components: {
    // Integrantes,
    Background,
    TitleCard,
    Titlebar,
    ProjectSheet,
    //GoalsSheet,
  },
  setup() {
    const route = useRoute();
    const showComponents = computed(() => {
      const pathLower = route.path.toLowerCase();
      return !["/home", "/goals", "/activities"].includes(pathLower);
    });
    const showGoalSheet = computed(() => {
      return route.path.toLowerCase() === "/goals";
    });
    const showIntegrantes = computed(() => {
      const pathLower = route.path.toLowerCase();
      return !["/home", "/goals"].includes(pathLower);
    });
    return { showComponents, showGoalSheet, showIntegrantes };
  },
};
</script>

<template>
  <div id="app">
    <TitleCard v-if="showComponents" />
    <Titlebar v-if="!showComponents" />
    <!-- <Integrantes v-if="showGoalSheet" /> -->
    <ProjectSheet v-if="!showComponents" />
    <!-- <GoalsSheet v-if="showGoalSheet" /> -->
    <Background />
    <router-view />
  </div>
</template>
