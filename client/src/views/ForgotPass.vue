<script setup lang="ts">
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
</script>

<template>
  <Card class="mt-36 max-w-md shadow-none border-none" id="pos">
    <CardHeader>
      <CardTitle class="text-3xl">
        Olvidé mi Contraseña
      </CardTitle>
      <CardDescription>
        Escribe tu correo electrónico y recupera tus datos.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="mt-20 grid gap-2">
            <Label for="">Correo de verificación</Label>
          <Input
            id="mail"
            type="text"
            placeholder="correo@ejemplo.com"
            required
          />
        </div>
        <Button type="submit" class="w-full">
          Siguiente
        </Button>
      </div>
      <div class="mt-2 text-center text-sm">
        <router-link to="/Login" class="underline">
            Volver al inicio de sesión
        </router-link>
      </div>
    </CardContent>
  </Card>
</template>

<style scoped>
#pos{
  position: absolute;
  width: 50%;
  max-height: 100%;
  right: 4.5%;
  z-index: 50;
}
</style>
