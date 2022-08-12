package main

import (
	"fmt"
)

func generateNumbers(total int) {
	for idx := 1; idx <= total; idx++ {
		fmt.Printf("Generating number %d\n", idx)
	}
}

func printNumbers() {
	for idx := 1; idx <= 3; idx++ {
		fmt.Printf("Printing number %d\n", idx)
	}
}

func main() {
	printNumbers()
	generateNumbers(3)
}

