# multiple-functions-concurrently-in-go

# One of the popular features of the Go language is its first-class support for concurrency, or the ability of a program to do multiple things at once. Being able to run code concurrently is becoming a larger part of programming as computers move from running a single stream of code faster to running more streams of code simultaneously. To run programs faster, a programmer needs to design their programs to run concurrently, so that each concurrent part of the program can be run independently of the others. Two features in Go, goroutines and channels, make concurrency easier when used together. Goroutines solve the difficulty of setting up and running concurrent code in a program, and channels solve the difficulty of safely communicating between the code running concurrently.

# In a modern computer, the processor, or CPU, is designed to run as many streams of code as possible at the same time. These processors have one or more “cores,” each capable of running one stream of code at the same time. So, the more cores a program can use simultaneously, the faster the program will run. However, in order for programs to take advantage of the speed increase that multiple cores provide, programs need to be able to be split into multiple streams of code. Splitting a program into parts can be one of the more challenging things to do in programming, but Go was designed to make this easier.

# One way Go does this is with a feature called goroutines. A goroutine is a special type of function that can run while other goroutines are also running. When a program is designed to run multiple streams of code at once, the program is designed to run concurrently. Typically, when a function is called, it will finish running completely before the code after it continues to run. This is known as running in the “foreground” because it prevents your program from doing anything else before it finishes. With a goroutine, the function call will continue running the next code right away while the goroutine runs in the “background”. Code is considered running in the background when it doesn’t prevent other code from running before it finishes.

# The power goroutines provide is that each goroutine can run on a processor core at the same time. If your computer has four processor cores and your program has four goroutines, all four goroutines can run simultaneously. When multiple streams of code are running at the same time on different cores like this, it’s called running in parallel.

mkdir multifunc
cd multifunc

sudo nano main.go
sudo vi main.go

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

go run main.go

# You’ll see the functions run one after the other, with printNumbers running first and generateNumbers running second.

# Now, imagine that printNumbers and generateNumbers each takes three seconds to run. When running synchronously, or one after the other like the last example, your program would take six seconds to run. First, printNumbers would run for three seconds, and then generateNumbers would run for three seconds. In your program, however, these two functions are independent of the other because they don’t rely on data from the other to run. You can take advantage of this to speed up this hypothetical program by running the functions concurrently using goroutines. When both functions are running concurrently the program could, in theory, run in half the time. If both the printNumbers and the generateNumbers functions take three seconds to run and both start at exactly the same time, the program could finish in three seconds. (The actual speed could vary due to outside factors, though, such as how many cores the computer has or how many other programs are running on the computer at the same time.)

# Running a function concurrently as a goroutine is similar to running a function synchronously. To run a function as a goroutine (as opposed to a standard synchronous function), you only need to add the go keyword before the function call.

# However, for the program to run the goroutines concurrently, you’ll need to make one additional change. You’ll need to add a way for your program to wait until both goroutines have finished running. If you don’t wait for your goroutines to finish and your main function completes, the goroutines could potentially never run, or only part of them could run and not complete running.

# To wait for the functions to finish, you’ll use a WaitGroup from Go’s sync package. The sync package contains “synchronization primitives”, such as WaitGroup, that are designed to synchronize various parts of a program. In your case, the synchronization keeps track of when both functions have finished running so you can exit the program.

# The WaitGroup primitive works by counting how many things it needs to wait for using the Add, Done, and Wait functions. The Add function increases the count by the number provided to the function, and Done decreases the count by one. The Wait function can then be used to wait until the count reaches zero, meaning that Done has been called enough times to offset the calls to Add. Once the count reaches zero, the Wait function will return and the program will continue running.

sudo nano main2.go
sudo vi main2.go

package main

import (
	"fmt"
	"sync"
)

func generateNumbers(total int, wg *sync.WaitGroup) {
	defer wg.Done()

	for idx := 1; idx <= total; idx++ {
		fmt.Printf("Generating number %d\n", idx)
	}
}

func printNumbers(wg *sync.WaitGroup) {
	defer wg.Done()

	for idx := 1; idx <= 3; idx++ {
		fmt.Printf("Printing number %d\n", idx)
	}
}

func main() {
	var wg sync.WaitGroup

	wg.Add(2)
	go printNumbers(&wg)
	go generateNumbers(3, &wg)

	fmt.Println("Waiting for goroutines to finish...")
	wg.Wait()
	fmt.Println("Done!")
}

# After declaring the WaitGroup, it will need to know how many things to wait for. Including a wg.Add(2) in the main function before starting the goroutines will tell wg to wait for two Done calls before considering the group finished. If this isn’t done before the goroutines are started, it’s possible things will happen out of order or the code may panic because the wg doesn’t know it should be waiting for any Done calls.

# Each function will then use defer to call Done to decrease the count by one after the function finishes running. The main function is also updated to include a call to Wait on the WaitGroup, so the main function will wait until both functions call Done to continue running and exit the program.

go run main2.go

# One of the more difficult parts of concurrent programming is communicating safely between different parts of the program that are running simultaneously. If you’re not careful, you might run into problems that are only possible with concurrent programs. For example, a data race can happen when two parts of a program are running concurrently, and one part tries to update a variable while the other part is trying to read it at the same time. When this happens, the reading or writing can happen out of order, leading to one or both parts of the program using the wrong value. The name “data race” comes from both parts of the program “racing” each other to access the data.

# While it’s still possible to run into concurrency issues like data races in Go, the language is designed to make it easier to avoid them. In addition to goroutines, channels are another feature that makes concurrency safer and easier to use. A channel can be thought of like a pipe between two or more different goroutines that data can be sent through. One goroutine puts data into one end of the pipe and another goroutine gets that same data out. The difficult part of making sure the data gets from one to the other safely is handled for you.

sudo nano main3.go
sudo vi main3.go

package main

import (
	"fmt"
	"sync"
)

func generateNumbers(total int, ch chan<- int, wg *sync.WaitGroup) {
	defer wg.Done()

	for idx := 1; idx <= total; idx++ {
		fmt.Printf("sending %d to channel\n", idx)
		ch <- idx
	}
}

func printNumbers(ch <-chan int, wg *sync.WaitGroup) {
	defer wg.Done()

	for num := range ch {
		fmt.Printf("read %d from channel\n", num)
	}
}

func main() {
	var wg sync.WaitGroup
	numberChan := make(chan int)

	wg.Add(2)
	go printNumbers(numberChan, &wg)

	generateNumbers(3, numberChan, &wg)

	close(numberChan)

	fmt.Println("Waiting for goroutines to finish...")
	wg.Wait()
	fmt.Println("Done!")
}

go run main3.go


sudo vi main4.go

package main

import (
	"fmt"
	"sync"
)

func generateNumbers(total int, ch chan<- int, wg *sync.WaitGroup) {
	for idx := 1; idx <= total; idx++ {
		fmt.Printf("sending %d to channel\n", idx)
		ch <- idx
	}
}

func printNumbers(idx int, ch <-chan int, wg *sync.WaitGroup) {
	defer wg.Done()

	for num := range ch {
		fmt.Printf("%d: read %d from channel\n", idx, num)
	}
}

func main() {
	var wg sync.WaitGroup
	numberChan := make(chan int)

	for idx := 1; idx <= 3; idx++ {
		wg.Add(1)
		go printNumbers(idx, numberChan, &wg)
	}

	generateNumbers(5, numberChan, &wg)

	close(numberChan)

	fmt.Println("Waiting for goroutines to finish...")
	wg.Wait()
	fmt.Println("Done!")
}

