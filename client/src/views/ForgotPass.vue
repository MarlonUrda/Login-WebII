<script setup lang="ts">
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
</script>

<template>
  <Card class="mx-auto max-w-sm">
    <CardHeader>
      <CardTitle class="text-2xl"> Enter your username </CardTitle>
      <CardDescription> The one that you use to sign in with. </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="grid gap-2">
          <Label for="">User</Label>
          <Input
            id="user"
            type="text"
            placeholder="Enter your username"
            required
          />
        </div>
        <Button type="submit" class="w-full"> Next </Button>
      </div>
      <div class="mt-4 text-center text-sm">
        <router-link to="/ForgotUser" class="underline">
          Forgot your username?
        </router-link>
      </div>
    </CardContent>
  </Card>
</template>

<style scoped></style>
