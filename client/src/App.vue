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
    Integrantes,
    Background,
    TitleCard,
    Titlebar,
    ProjectSheet,
    //GoalsSheet,
  },
  setup() {
    const route = useRoute();
    const showComponents = computed(() => {
      return !["/Home", "/Goals"].includes(route.path);
    });
    const showGoalSheet = computed(() => {
      return route.path === "/Goals";
    });
    const showIntegrantes = computed(() => {
      return !["/Home", "/Goals"].includes(route.path);
    });
    return { showComponents, showGoalSheet, showIntegrantes };
  },
};
</script>

<template>
  <div id="app">
    <TitleCard v-if="showComponents" />
    <Titlebar v-if="!showComponents" />
    <Integrantes v-if="showGoalSheet" />
    <ProjectSheet v-if="!showComponents" />
    <!-- <GoalsSheet v-if="showGoalSheet" /> -->
    <Background />
    <router-view />
  </div>
</template>
