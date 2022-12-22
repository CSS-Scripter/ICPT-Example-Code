package main

import (
	"fmt"
	"strconv"
)

const (
	YEAR   = "years"
	MONTH  = "months"
	DAY    = "days"
	HOUR   = "hours"
	MINUTE = "minute"
)

type ValidEntry struct {
	Identifier string
	IsValid    bool
}

var amounts = make(map[string]int)
var valid = make(map[string]bool)

func main() {
	labels := []string{"jaren: ", "maanden: ", "dagen: ", "uren: ", "minuten: "}
	identifiers := []string{YEAR, MONTH, DAY, HOUR, MINUTE}
	for i := 0; i < len(labels); {
		err := askForInput(labels[i], identifiers[i])
		if err != nil {
			fmt.Println("Looks like that not a number, try again!")
			continue
		}
		i++
	}

	isValidChannel := make(chan ValidEntry)

	go isYearValid(isValidChannel)
	go isMonthValid(isValidChannel)
	go isDayValid(isValidChannel)
	go isHourValid(isValidChannel)
	go isMinuteValid(isValidChannel)

	for i := 0; i < len(labels); i++ {
		entry := <-isValidChannel
		valid[entry.Identifier] = entry.IsValid
	}

	fmt.Printf("\nJaren: %v\nMaanden: %v\nDagen: %v\nUren: %v\nMinuten: %v\n",
		valid[YEAR], valid[MONTH], valid[DAY], valid[HOUR], valid[MINUTE])
}

func askForInput(label string, identifier string) error {
	var input string
	fmt.Print(label)
	fmt.Scanln(&input)
	amount, err := strconv.Atoi(input)
	if err != nil {
		return err
	}
	amounts[identifier] = amount
	return nil
}

func findMaxDays() int {
	if amounts[MONTH] <= 0 || amounts[MONTH] > 12 {
		return 0
	}
	yearDays := []int{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
	years := amounts[YEAR]
	if years%4 == 0 && (years%100 != 0 || years%400 == 0) {
		yearDays[1] = 29
	}
	return yearDays[amounts[MONTH]-1]
}

func isYearValid(validChan chan ValidEntry) {
	validChan <- ValidEntry{YEAR, true}
}

func isMonthValid(validChan chan ValidEntry) {
	validChan <- ValidEntry{MONTH, amounts[MONTH] >= 1 && amounts[MONTH] <= 12}
}

func isDayValid(validChan chan ValidEntry) {
	validChan <- ValidEntry{DAY, amounts[DAY] >= 0 && amounts[DAY] <= findMaxDays()}
}

func isHourValid(validChan chan ValidEntry) {
	validChan <- ValidEntry{HOUR, amounts[HOUR] >= 0 && amounts[HOUR] <= 23}
}

func isMinuteValid(validChan chan ValidEntry) {
	validChan <- ValidEntry{MINUTE, amounts[MINUTE] >= 0 && amounts[MINUTE] < 60}
}
