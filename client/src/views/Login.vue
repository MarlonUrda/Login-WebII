<script setup lang="ts">
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

const email = ref("");
const password = ref("");

const sendData = async () => {
  console.log("hola");

  const response = await fetch("http://localhost:3000/get-session", {
    credentials: "include",
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      email: email.value,
      password: password.value,
    }),
  });

  const data = await response.json();
  console.log(data);
};
</script>

<template>
  <Card class="mx-auto max-w-sm">
    <CardHeader>
      <CardTitle class="text-2xl"> Login </CardTitle>
      <CardDescription>
        Enter your email below to login to your account
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="grid gap-2">
          <Label for="email">Email</Label>
          <Input
            v-model="email"
            id="email"
            type="email"
            placeholder="m@example.com"
            required
          />
        </div>
        <div class="grid gap-2">
          <div class="flex items-center">
            <Label for="password">Password</Label>
            <router-link
              to="/ForgotPass"
              class="ml-auto inline-block text-sm underline"
            >
              Forgot your password?
            </router-link>
          </div>
          <Input v-model="password" id="password" type="password" required />
        </div>
        <Button @click="sendData" type="submit" class="w-full"> Login </Button>
      </div>
      <div class="mt-4 text-center text-sm">
        Don't have an account?
        <router-link to="/Register" class="underline"> Sing up </router-link>
      </div>
    </CardContent>
  </Card>
</template>

<style scoped></style>
