<script setup lang="ts">
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
</script>

<template>
  <div class="max-w-md" id="pos">
  <Card class="shadow-none border-none">
    <CardHeader>
      <CardTitle class=" text-3xl">
        Inicio de Sesión
      </CardTitle>
      <CardDescription>
        Ingresa tu correo para iniciar sesión en tu cuenta.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="mt-8 grid gap-2">
          <Label for="email">Correo Electrónico</Label>
          <Input
            id="email"
            type="email"
            placeholder="correo@ejemplo.com"
            required
          />
        </div>
        <div class="grid gap-2">
          <div class="flex items-center">
            <Label for="password">Contraseña</Label>
            <router-link to="/ForgotPass" class="ml-auto inline-block text-sm underline">
              ¿Olvidaste tu contraseña?
            </router-link>
          </div>
          <Input id="password" type="password" placeholder="Ingresa la contraseña de tu cuenta." required />
        </div>
        <Button type="submit" class="mt-10 w-full">
          Iniciar Sesión
        </Button>

      </div>
      <div class="mt-2 text-center text-sm" id ="link">
        ¿No tienes una cuenta?
        <router-link to="/Register" class="underline">
              Regístrate
        </router-link>
      </div>
    </CardContent>
  </Card>
</div>
</template>

<style scoped>
#pos{
  position: absolute;
  width: 50%;
  top: 20.5%;
  max-height: 100%;
  right: 4.8%;
  z-index: 50;
}
#link{
  z-index: 10;
}
</style>