import express, { Request, Response } from 'express'
import cors from 'cors'
import { UserController } from './database/controller/UserController'
import { AccountController } from './database/controller/AccountController'

const app = express()

app.use(cors())
app.use(express.json())

app.listen(3003, () => {
    console.log(`Servidor rodando na porta ${3003}`)
})

app.get("/ping", async (req: Request, res: Response) => {
    try {
        res.status(200).send({ message: "Pong!" })
    } catch (error) {
        console.log(error)

        if (req.statusCode === 200) {
            res.status(500)
        }

        if (error instanceof Error) {
            res.send(error.message)
        } else {
            res.send("Erro inesperado")
        }
    }
})

const userController = new UserController()
const accountController = new AccountController()

app.get("/users", userController.getUsers)

app.post("/users", userController.postUsers)

app.get("/accounts", accountController.getAccount)

app.get("/accounts/:id/balance", accountController.getAccountById)

app.post("/accounts", accountController.createAccount)

app.put("/accounts/:id/balance", accountController.updateAccount)