<script setup >
import { ref } from "vue";
import { Button } from "../components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { Input } from "../components/ui/input";
import { Label } from "../components/ui/label";
import { useRouter } from 'vue-router';

const email = ref("");
const password = ref("");
const username = ref("");
const errorMessage = ref("");
const router = useRouter();

const sendUser = async () => {
  console.log("sendUser");

  try{

    const response = await fetch("http://localhost:3000/register", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email: email.value,
        password: password.value,
        username: username.value,
      }),
    })



    const data = await response.json();

    console.log(data);
    

    if (response.status > 300) {
      errorMessage.value = data.message;
    } else {
      errorMessage.value = "";
      router.push({name:'Registered',  params: { email:email.value, password:password.value,username:username.value } });
    }
    email.value = "";
    password.value = "";
    username.value = "";

  }catch(err){
    console.log(err)
  }
};
</script>

<template>
  <div id="pos">
  <Card class="shadow-none border-none">
    <CardHeader>
      <CardTitle class="text-3xl">404 Not found </CardTitle>
      <CardDescription>
      
      </CardDescription>
    </CardHeader>
    <CardContent>
 
    </CardContent>
  </Card>
</div>
</template>

<style scoped>
#pos {
  position: absolute;
  width: 50%;
  top: 20.5%;
  max-height: 100%;
  right: 4.8%;
  z-index: 50;
}
</style>
