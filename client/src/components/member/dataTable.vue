<script setup>
import { ref, computed, onMounted, defineProps } from 'vue'
import tableBO from '../tableBO.vue';
const props = defineProps({
  users: {
    type: Array,
    required: true
  },
  headers: {
    type: Array,
    required: true
  }
})

const users= [
  { name: 'Joshn', age: 25, email: 'fff'},
  { name: 'Johdn', age: 25, email: 'fff'},
  { name: 'Johfn', age: 25, email: 'fff'},
  { name: 'Johhn', age: 25, email: 'fff'}, 
  { name: 'Joyhn', age: 25, email: 'fff'}
]

const headers = ['name', 'age', 'email']

const nameFilter = ref('')
const filteredUsers = computed(() => {
  return users.filter(user => user.name.includes(nameFilter.value))
})

onMounted(() => {
  console.log('mounted',filteredUsers.value)

})
</script>

<template>
    <tableBO :data="filteredUsers" :headers="headers" permit="true"/>
</template>
