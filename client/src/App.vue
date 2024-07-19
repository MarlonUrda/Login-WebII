<script>
import Background from './components/Background.vue'
import TitleCard from './views/TitleCard.vue'
import Titlebar from './components/Titlebar.vue'
import { computed } from 'vue'
import { useRoute } from 'vue-router'

export default {
  name: 'App',
  components: {
    Background,
    TitleCard,
    Titlebar
  },
  setup() {
    const route = useRoute()
    const showComponents = computed(() => {
      return !['/Home', '/Goals'].includes(route.path)
    })
    return { showComponents }
  }
}
</script>

<template>
  <div id="app">
    <TitleCard v-if="showComponents" />
    <Titlebar v-if="!showComponents"/>
    <Background/>
    <router-view/>
  </div>
</template>