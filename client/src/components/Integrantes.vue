<script setup>
import { Button } from "../components/ui/button";
import { cn } from "@/lib/utils";
import {
  Sheet,
  SheetClose,
  SheetContent,
  SheetDescription,
  SheetFooter,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/sheet";
import { ScrollArea } from "@/components/ui/scroll-area";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
} from "@/components/ui/command";
import {
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";
import { h, onMounted } from "vue";
import { useForm } from "vee-validate";
import { toTypedSchema } from "@vee-validate/zod";
import * as z from "zod";
import { UserRoundPlus } from "lucide-vue-next";
import { Contact } from "lucide-vue-next";
import { Trash2 } from "lucide-vue-next";
import { Check, ChevronsUpDown, Plus } from "lucide-vue-next";
import { ref } from "vue";

const users = ref([]);
const roles = ref([]);
const value = ref("");
const open = ref(true);

const hola = () => {
  console.log("Hola!");
};

const getUsers = async () => {
  try {
    const response = await fetch("http://localhost:3000/get-users", {
      method: "GET",
      credentials: "include",
      headers: {
        "Content-type": "application/json",
      },
    });

    if (response.ok) {
      const data = await response.json();
      console.log(data);
      return data;
    }

    return "jaja no";
  } catch (error) {
    console.log("Errror: ", error.message);
  }
};

const getRoles = async () => {
  try {
    const response = await fetch("http://localhost:3000/get-roles", {
      method: "GET",
      credentials: "include",
      headers: {
        "Content-type": "application/json",
      },
    });

    if (response.ok) {
      const data = await response.json();
      console.log(data);
      return data;
    }
  } catch (error) {
    console.log("Errorr: ", error.message);
  }
};

onMounted(async () => {
  users.value = await getUsers();
  roles.value = await getRoles();
  console.log("ilo");
  console.log(users.value, roles.value);
});

const members = [
  {
    Member: "1",
    Ced: "30465893",
    User: "@atlas",
    Name: "Andrés García",
  },
  {
    Member: "2",
    Ced: "28754692",
    User: "@levizzz",
    Name: "Marlon Urdaneta",
  },
  {
    Member: "3",
    Ced: "29750583",
    User: "@itsfrex",
    Name: "José Carrillo",
  },
];
const languages = [
  //Ejemplo que venía por defecto en el buscador de usuarios
  { label: "English", value: "en" },
  { label: "French", value: "fr" },
  { label: "German", value: "de" },
  { label: "Spanish", value: "es" },
  { label: "Portuguese", value: "pt" },
  { label: "Russian", value: "ru" },
  { label: "Japanese", value: "ja" },
  { label: "Korean", value: "ko" },
  { label: "Chinese", value: "zh" },
];

const formSchema = toTypedSchema(
  z.object({
    auser: z.string({
      required_error: "Por favor elige un usuario.",
    }),
  })
);

//getusers, getroles, insertmember, updatemembers, deletemember

const { handleSubmit, setFieldValue, values } = useForm({
  validationSchema: formSchema,
});
// Ejemplo de onSubmit que creaba un toast con el valor puesto pero no usamos toast ni está instalado
// const onSubmit = handleSubmit((values) => {
//   toast({
//     title: 'You submitted the following values:',
//     description: h('pre', { class: 'mt-2 w-[340px] rounded-md bg-slate-950 p-4' }, h('code', { class: 'text-white' }, JSON.stringify(values, null, 2))),
//   })
// })
</script>

<template>
  <Sheet>
    <SheetTrigger as-child>
      <Button
        type="submit"
        variant="default"
        class="text-white bg-blue-400 w-[11.5%] h-[5%] top-[11%] left-[98%] -translate-x-full absolute hover:bg-white hover:text-black"
        ><UserRoundPlus class="mt-[2%] mr-2 h-4 w-4 inline" />Manejar
        Integrantes</Button
      >
    </SheetTrigger>
    <SheetContent class="sm:w-full" side="bottom">
      <SheetHeader>
        <SheetTitle class="text-center">Lista de Integrantes</SheetTitle>
        <SheetDescription class="text-center mb-4">
          Desde aquí puedes añadir nuevos integrantes a este proyecto, así como
          cambiar su rol o eliminarlos.
        </SheetDescription>
      </SheetHeader>
      <form class="space-y-6 text-center" @submit="onSubmit">
        <FormField name="auser">
          <FormItem class="flex flex-col">
            <Popover>
              <PopoverTrigger as-child>
                <FormControl>
                  <Button
                    variant="outline"
                    role="combobox"
                    :class="
                      cn(
                        'w-[200px] justify-between ml-[50%] -translate-x-1/2 mt-1 -mb-3',
                        !values.auser && 'text-muted-foreground'
                      )
                    "
                  >
                    {{
                      values.auser
                        ? users.find((user) => user.user === values.auser)
                            ?.label
                        : "Elegir persona..."
                    }}
                    <ChevronsUpDown class="ml-2 h-4 w-4 shrink-0 opacity-50" />
                  </Button>
                </FormControl>
              </PopoverTrigger>
              <PopoverContent class="w-[200px] p-0">
                <Command>
                  <CommandInput placeholder="Buscar usuario..." />
                  <CommandEmpty>Nada encontrado.</CommandEmpty>
                  <CommandList>
                    <CommandGroup>
                      <CommandItem
                        v-for="user in users"
                        :key="user.pid"
                        :value="user.user"
                        @select="
                          () => {
                            setFieldValue('auser', user.user);
                          }
                        "
                      >
                        <Check
                          :class="
                            cn(
                              'mr-2 h-4 w-4',
                              user.user === values.auser
                                ? 'opacity-100'
                                : 'opacity-0'
                            )
                          "
                        />
                        {{ user.user }}
                      </CommandItem>
                    </CommandGroup>
                  </CommandList>
                </Command>
              </PopoverContent>
            </Popover>
            <FormMessage />
          </FormItem>
        </FormField>
        <Button type="button" @click="hola"
          ><Plus class="mt-[2%] mr-1 -ml-1 h-4 w-4 inline" />
          Agregar
        </Button>
      </form>
      <ScrollArea class="w-[85%] mt-[1%] mb-[1%] -translate-x-1/2 left-1/2">
        <Table>
          <TableHeader class="text-lg italic">
            <TableRow>
              <TableHead class="text-center font-bold">N°. en Lista</TableHead>
              <TableHead class="text-center font-bold">N°. de Cédula</TableHead>
              <TableHead class="text-center font-bold"
                >Nombre de Usuario</TableHead
              >
              <TableHead class="text-center font-bold"
                >Nombre y Apellido</TableHead
              >
              <TableHead class="text-center font-bold">Opciones</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody class="text-base">
            <TableRow v-for="Member in members" :key="Member.Member">
              <TableCell class="text-center">{{ Member.Member }}</TableCell>
              <TableCell class="text-center">{{ Member.Ced }}</TableCell>
              <TableCell class="text-center italic">{{
                Member.User
              }}</TableCell>
              <TableCell class="text-center">{{ Member.Name }}</TableCell>
              <TableCell class="text-center">
                <Popover v-model="open">
                  <PopoverTrigger as-child>
                    <Button
                      variant="outline"
                      role="combobox"
                      :aria-expanded="open"
                      class="w-[200px] justify-between"
                    >
                      {{
                        value
                          ? roles.find((role) => role.profile_desc === value)
                              ?.label
                          : "Elegir rol a asignar..."
                      }}

                      <ChevronsUpDown
                        class="ml-2 h-4 w-4 shrink-0 opacity-50"
                      />
                    </Button>
                  </PopoverTrigger>
                  <PopoverContent class="w-[200px] p-0">
                    <Command v-model="value">
                      <CommandInput placeholder="Buscar rol..." />
                      <CommandEmpty>Ningún rol encontrado.</CommandEmpty>
                      <CommandList>
                        <CommandGroup>
                          <CommandItem
                            v-for="role in roles"
                            :key="role.profile_id"
                            :value="role.profile_desc"
                            @select="open = false"
                          >
                            <Check
                              :class="
                                cn(
                                  'mr-2 h-4 w-4',
                                  value === role.profile_id
                                    ? 'opacity-100'
                                    : 'opacity-0'
                                )
                              "
                            />
                            {{ role.profile_desc }}
                          </CommandItem>
                        </CommandGroup>
                      </CommandList>
                    </Command>
                  </PopoverContent>
                </Popover>
                <button type="submit">
                  <Trash2 class="ml-5 h-6 w-6 inline hover:text-red-700" />
                </button>
              </TableCell>
            </TableRow>
          </TableBody>
        </Table>
      </ScrollArea>
      <SheetFooter>
        <Sheet>
          <SheetTrigger as-child>
            <Button type="submit" class="left-[1.5%] absolute"
              ><Contact class="mt-[2%] mr-2 h-4 w-4 inline" />Añadir
              Invitado</Button
            >
          </SheetTrigger>
          <SheetContent side="left">
            <SheetHeader>
              <SheetTitle class="text-center">Añadir Invitado</SheetTitle>
              <SheetDescription>
                Ingresa los datos del recurso a añadir en el proyecto.
              </SheetDescription>
            </SheetHeader>
            <div class="grid gap-4 py-4">
              <div class="grid grid-cols-4 items-center gap-4">
                <Label for="cedula" class="text-center"> N°. de Cédula </Label>
                <Input
                  id="cedula"
                  placeholder="Ej.: 12345678"
                  class="col-span-3"
                />
              </div>
              <div class="grid grid-cols-4 items-center gap-4">
                <Label for="name" class="text-center">
                  Nombre y Apellido
                </Label>
                <Input
                  id="name"
                  placeholder="Ej.: Jubert Pérez"
                  class="col-span-3"
                />
              </div>
            </div>
            <SheetFooter>
              <SheetClose as-child>
                <Button type="submit"
                  ><Plus class="mt-[2%] mr-1 -ml-1 h-4 w-4 inline" />
                  Añadir al Proyecto
                </Button>
              </SheetClose>
            </SheetFooter>
          </SheetContent>
        </Sheet>
        <SheetClose as-child>
          <Button type="submit" class="bg-blue-500"
            ><Plus class="mt-[2%] mr-1 -ml-1 h-4 w-4 inline" />
            Añadir al Proyecto
          </Button>
        </SheetClose>
        <SheetClose as-child>
          <Button type="submit" class="bg-blue-500"
            ><Check class="mt-[2%] mr-2 h-4 w-4 inline" />Guardar
            Cambios</Button
          >
        </SheetClose>
      </SheetFooter>
    </SheetContent>
  </Sheet>
</template>
