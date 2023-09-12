import { User } from "../types/models"

import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

async function all(): Promise<User[]> {
  const users = await prisma.user.findMany()
  return users
}

async function find(id: number): Promise<User | null> {
  const user = await prisma.user.findUnique({ where: { id: id }})
  return user
}

async function create(data: any): Promise<User> {
  const user = await prisma.user.create({ data: data })
  return user
}

async function update(id: number, data: User): Promise<User> {
  const user = await prisma.user.update({
    where: {
      id: id
    },
    data: data
  })
  return user
}

async function destroy(id: number): Promise<void> {
  await prisma.user.delete({ where: {id: id}})
}

export { all, find, create, update, destroy }
