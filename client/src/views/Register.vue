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
        Create an account

      </CardTitle>
      <CardDescription>
        Fill out the form below to create a new account.
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
          <Label for="">User</Label>
          <Input
            id="user"
            type="text"
            placeholder="Enter your username"
            required
          />
          <Label for="">Password</Label>
          <Input
            id="password"
            type="password"
            placeholder="Enter your password"
            required
          />
        </div>
        <Button type="submit" class="w-full">
          Sing up
        </Button>
      </div>

    </CardContent>
  </Card>
</template>

<style scoped>

</style>
