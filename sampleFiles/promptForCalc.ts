import {prompt} from 'inquirer'
import { calculate } from './calculate'

export const ops = {
    ADD: 'Add',
    SUBTRACT: 'Subtract',
    MULTIPLY: 'Multiply',
    DIVIDE: 'Divide',
}

export const operations = Object.values(ops)

const questions = [
    {
        type: 'list',
        name: 'operation',
        message: 'What operation do you want',
        choices: operations,
    },
    {
        type: 'input',
        name: 'first',
        message: "What's the first number",
    },
    {
        type: 'input',
        name: 'second',
        message: "What's the second number",
    },
]

export async function promptForCalc() {
    const answers = await prompt(questions)
    
    return calculate(
        answers.operation,
        +answers.first,
        +answers.second
    )
}