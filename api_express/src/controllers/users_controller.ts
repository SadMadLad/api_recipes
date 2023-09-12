import { User } from "../types/models"

import * as UserRecord from "../models/user"
import { Request, Response } from "express"

const index = (async (req: Request, res: Response): Promise<void> => {
  const users: User[] = await UserRecord.all()
  res.json(users)
})

const show = (async (req: Request, res: Response): Promise<void> => {
  const id: number = Number(req.params.id)
  const user: User | null = await UserRecord.find(id)

  if (!user) {
    res.status(404).send("User not found")
  } else {
    res.json(user)
  }
})

const create = (async (req: Request, res: Response): Promise<void> => {
  const data: User = req.body
  const user: User = await UserRecord.create(data)
  res.json(user)
})

const update = (async (req: Request, res: Response): Promise<void> => {
  const id: number = Number(req.params.id)
  const user: User | null = await UserRecord.find(id)

  if(!user) {
    res.status(404).send("User not found")
  } else {
    const data: User = req.body
    const user: User = await UserRecord.update(id, data)
    res.json(user)
  }
})

const destroy = (async (req: Request, res: Response): Promise<void> => {
  const id: number = Number(req.params.id)
  const user: User | null = await UserRecord.find(id)

  if(!user) {
    res.status(404).send("User not found")
  } else {
    await UserRecord.destroy(id)
    res.send("User deleted successfully")
  }
})

export { index, show, create, update, destroy }
