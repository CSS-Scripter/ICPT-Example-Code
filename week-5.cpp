#include <iostream>
#include <algorithm>
#include <utility>
#include <vector>
#include <functional>
#include <exception>
#include <string>
using namespace std;

const string possibleMonths[12] = {
        "january",
        "february",
        "march",
        "april",
        "may",
        "june",
        "july",
        "august",
        "september",
        "october",
        "november",
        "december",
};

class invalid_input: public exception {
    private:
    string message;

    public:
    explicit invalid_input(string msg) : message(std::move(msg)) { }

    public:
    string what() {
        return message;
    }
};

bool isMonthValid(const string& monthInput) {
    for(const string& possibleMonth : possibleMonths) {
        if (possibleMonth == monthInput) {
            return true;
        }
    }
    return false;
}



int findMaxDays(int year, const string& month) {
    int yearDays[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        yearDays[1] = 29;
    }
    for (int i = 0; i < 12; i++) {
        if (possibleMonths[i] == month) {
            return yearDays[i];
        }
    }
    cout << "Something went wrong, weren't able to determine a max amount of days" << "\n";
    return 0;
}

int askForYear() {
    string yearInput;
    int year;

    cout << "Year:";
    cin >> yearInput;
    year = stoi(yearInput);
    return year;
}

string askForMonth() {
    string monthInput;

    cout << "Month:";
    cin >> monthInput;
    transform(monthInput.begin(), monthInput.end(), monthInput.begin(),
              [](unsigned char c) { return tolower(c); });
    if (!isMonthValid(monthInput)) {
        throw invalid_input("That's not a month! Try again.");
    }
    return monthInput;
}

int askForDay(int maxDays) {
    string dayInput;
    int day;

    cout << "Day:";
    cin >> dayInput;
    day = stoi(dayInput);
    if (day <= 0 || day > maxDays) {
        throw invalid_input("That day doesn't exist in the given month and year, try again.");
    }
    return day;
}

int askForHour() {
    string hourInput;
    int hour;

    cout << "Hour:";
    cin >> hourInput;
    hour = stoi(hourInput);
    if (hour < 0 || hour >= 24) {
        throw invalid_input("Please enter a valid 24h clock hour. Try again.");
    }
    return hour;
}


int askForMinute(){
    string minuteInput;
    int minute;
    cout << "Minute:";
    cin >> minuteInput;
    minute = stoi(minuteInput);
    if (minute < 0 || minute > 60) {
        throw invalid_input("Please enter a valid minute, between 0 and 60. Try again.");
    }
    return minute;
}

int main() {
    int year, day, hour, minute;
    string month;

    vector<function<void()>> callList;
    callList.emplace_back([&]() { year = askForYear(); });
    callList.emplace_back([&]() { month = askForMonth(); });
    callList.emplace_back([&]() { day = askForDay(findMaxDays(year, month)); });
    callList.emplace_back([&]() { hour = askForHour(); });
    callList.emplace_back([&]() { minute = askForMinute(); });

    for (const auto& callAction : callList) {
        bool isValid = false;
        while (!isValid) {
            try {
                callAction();
                isValid = true;
            }
            catch (const invalid_argument& e) { cout << "That's not a number, try again." << "\n"; }
            catch (const out_of_range& e) { cout << "That number is way too big, try again." << "\n"; }
            catch (invalid_input& e) { cout << e.what() << "\n"; }
        }
    }

    cout << day << " / " << month << " / " << year << " at " << hour << ":" << minute;

    return 0;
}
