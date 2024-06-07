<script>
import Background from './components/Background.vue'
import TitleCard from './views/TitleCard.vue'
export default {
  name: 'App',
  components: {
    Background,
    TitleCard
  }
}
</script>

<template>
  <div id="app">
    
    <TitleCard />
    <Background />
    <router-view/>
  </div>
</template>

<style scoped>
</style>