package main

import (
	"fmt"
	"math/rand"
	"time"
)

// function to compare guessed number to randomly chosen number
func compare(guess, random int) string {
	if guess == random {
		return "Correct!"
	} else {
		return "Incorrect!"
	}
}

// main
func main() {
	// change seed so random number is different every run
	rand.Seed(time.Now().UnixNano())

	// generate random number
	random := rand.Intn(20)

	fmt.Println("I am thinking of a random number between 0 and 20.\nEnter your guess: ")
	// get user guess
	var guess int
	fmt.Scanln(&guess)

	// is the guess the same as the random number?
	fmt.Println(compare(guess, random))

	// what was the random number?
	fmt.Println("I was thinking of: ")
	fmt.Println(random)
}
