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
      <CardTitle class="text-2xl">
        Olvidé mi Nombre de Usuario
      </CardTitle>
      <CardDescription>
        Escribe tu correo electrónico y recupera tus datos.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="grid gap-2">
            <Label for="email">Correo Electrónico</Label>
          <Input
            id="email"
            type="email"
            placeholder="correo@ejemplo.com"
            required
          />
        </div>
        <Button type="submit" class="w-full">
          Siguiente
        </Button>
      </div>
      <div class="mt-4 text-center text-sm">
        <router-link to="/ForgotPass" class="underline">
            ¿Olvidaste tu Contraseña?
        </router-link>
      </div>
    </CardContent>
  </Card>
</template>
<style>
@import 'https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.2/css/fontawesome.min.css';
</style>
