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
        Crea tu Cuenta
      </CardTitle>
      <CardDescription>
        Llena la información abajo para crear una nueva cuenta.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="mt-5 grid gap-2">
          <Label for="email">Correo Electrónico</Label>
          <Input
            id="email"
            type="email"
            placeholder="correo@ejemplo.com"
            required
          />
          <Label for="">Usuario</Label>
          <Input
            id="user"
            type="text"
            placeholder="Ingresa tu nombre de usuario."
            required
          />
          <Label for="">Contraseña</Label>
          <Input
            id="password"
            type="password"
            placeholder="Ingresa tu nueva contraseña."
            required
          />
        </div>
        <Button type="submit" class="mt-6 w-full">
          Registrarse
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
