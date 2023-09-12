import { Router } from "express"
import * as UsersController from "../controllers/users_controller"

const userRouter = Router()

userRouter.get('/', UsersController.index)
userRouter.get('/:id', UsersController.show)
userRouter.post('/', UsersController.create)
userRouter.patch('/:id', UsersController.update)
userRouter.delete('/:id', UsersController.destroy)

export default userRouter;
