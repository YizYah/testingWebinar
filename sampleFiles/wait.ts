import { delay } from "./delay";

export async function wait(time:number): Promise<string> {
    console.log(`about to wait ${time} seconds...`)
    const delayResult = await delay(1000 * time);
    console.log(`...waited ${time} seconds`)
    return `done! ${delayResult}`
}