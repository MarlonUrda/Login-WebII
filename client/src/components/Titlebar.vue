<script setup>
import { ref, onMounted } from 'vue';
import { Button } from '../components/ui/button';
import { LogIn } from 'lucide-vue-next';
import { CirclePlus } from 'lucide-vue-next';
import { LogOut } from 'lucide-vue-next';
import { CircleUserRound } from 'lucide-vue-next';
import { useRouter } from 'vue-router';

const userdata = ref({})
const router = useRouter()

const closeSession = async () => {
  try {
    let headersList = {
      'Content-Type': 'application/json',
    }

    let response = await fetch("http://localhost:3000/logout", { 
      method: "GET",
      credentials: 'include',
      headers: headersList
    });

    let data = await response.json();
    console.log(data);
    router.push({path: '/Login'});
  } catch (error) {  
    console.error('Error:', error);
  }
}

const getSession = async () => {
  const res = await fetch("http://localhost:3000/user-data", {
    method: "GET",
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
    },
  });

  if (res.ok) {
    const data = await res.json();
    return data;
  }
};

onMounted(async () => {
  userdata.value = await getSession();
  console.log(userdata);
});

</script>

<template>
    <body>
        <div id="titlebar" class="absolute bg-white top-0 left-0 w-full h-[8%] rounded-b-3xl"/>
        <div class="w-[12%] h-[12%] top-[0%] left-[0.5%] absolute"><img src="@/imgs/Logo.png"></img></div>
        
        <div>
            <Button type="submit" variant="default" class="bg-blue-500 w-[10.3%] top-[1.5%] left-[13%] absolute"> <CirclePlus class=" mt-[2%] mr-2 h-4 w-4"/>Nuevo Proyecto</Button>
            <h1 class="whitespace-nowrap overflow-hidden text-ellipsis text-gray-500 text-lg underline-offset-4 -translate-x-full tracking-tight italic font-semibold top-[2%] left-[86.3%] absolute"><CircleUserRound class=" mt-[-2%] mr-2 h-6 w-6 inline"/>{{ userdata.name + " " + userdata.lastname }} - @{{ userdata.user }}</h1>
            <Button type="submit" variant="link" class="bg-slate-800 text-white w-[9.5%] h-[5%] top-[1.5%] left-[98%] -translate-x-full absolute" @click="closeSession"> <LogOut class=" mt-[2%] mr-2 h-4 w-4"/>Cerrar Sesión</Button>
        </div>
    </body>
</template>