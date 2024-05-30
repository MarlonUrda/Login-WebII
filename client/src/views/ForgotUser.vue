<script setup lang="ts">
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
</script>

<template>
  <Card class="mx-auto max-w-sm">
    <CardHeader>
      <CardTitle class="text-2xl">
        Enter your email address
      </CardTitle>
      <CardDescription>
        Recovering your username starts with the email linked to your account.
      </CardDescription>
    </CardHeader>
    <CardContent>
      <div class="grid gap-4">
        <div class="grid gap-2">
            <Label for="email">Email</Label>
          <Input
            id="email"
            type="email"
            placeholder="m@example.com"
            required
          />
        </div>
        <Button type="submit" class="w-full">
          Next
        </Button>
      </div>
      <div class="mt-4 text-center text-sm">
        
        <router-link to="/Forgot" class="underline">
            Forgot your password?
        </router-link>

      </div>
    </CardContent>
  </Card>
</template>

<style scoped>

</style>
