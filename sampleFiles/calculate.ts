import { division } from './division';
import { operations, ops } from './promptForCalc';

export function calculate(
    operation: string,
    first: number,
    second: number): number {
    if (!operations.includes(operation))
        throw new Error(`The operation '${operation}' is not supported.`);
    if (operation === ops.ADD)
        return first + second;
    if (operation === ops.SUBTRACT)
        return first - second;
    if (operation === ops.MULTIPLY)
        return first * second;
    return division(first, second);
}
