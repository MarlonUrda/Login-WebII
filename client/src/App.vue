<script>
import Background from './components/Background.vue'
import TitleCard from './views/TitleCard.vue'
import { computed } from 'vue'
import { useRoute } from 'vue-router'

export default {
  name: 'App',
  components: {
    Background,
    TitleCard
  },
  setup() {
    const route = useRoute()
    const showComponents = computed(() => {
      return !['/Registered', '/LoggedIn'].includes(route.path)
    })
    return { showComponents }
  }
}
</script>

<template>
  <div id="app">
    <!-- <TitleCard v-if="showComponents" /> -->
    <!-- <Background v-if="showComponents" /> -->
    <TitleCard/>
    <Background/>
    <router-view/>
  </div>
</template>