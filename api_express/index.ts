import express from "express"

import userRouter from "./src/routes/users"

const app = express()
const PORT: number = 5050

app.use(express.json())
app.use("/users", userRouter)

app.listen(PORT, () => {
  console.log(`Listening on PORT ${PORT}`)
})

