//
// Created by thoml on 17/11/2022.
//

#include <stdio.h>

#define SECONDS_IN_MINUTE 60
#define SECONDS_IN_HOUR (60 * 60)
#define SECONDS_IN_DAY (60 * 60 * 24)
#define SECONDS_IN_MONTH (60 * 60 * 24 * 30)
#define SECONDS_IN_YEAR (60 * 60 * 24 * 365)

int getMinutes(unsigned long seconds) {
    return (int) (seconds / SECONDS_IN_MINUTE);
}

int getHours(unsigned long seconds) {
    return (int) (seconds / SECONDS_IN_HOUR);
}

int getDays(unsigned long seconds) {
    return (int) (seconds / SECONDS_IN_DAY);
}

int getMonths(unsigned long seconds) {
    return (int) (seconds / SECONDS_IN_MONTH);
}

unsigned long getYears(unsigned long seconds) {
    return seconds / SECONDS_IN_YEAR;
}

void printFormattedSeconds(unsigned long seconds) {
    unsigned long years;
    int months, days, hours, minutes;

    years = getYears(seconds);
    seconds = seconds - (years * SECONDS_IN_YEAR);

    months = getMonths(seconds);
    seconds = seconds - (months * SECONDS_IN_MONTH);

    days = getDays(seconds);
    seconds = seconds - (days * SECONDS_IN_DAY);

    hours = getHours(seconds);
    seconds = seconds - (hours * SECONDS_IN_HOUR);

    minutes = getMinutes(seconds);
    seconds = seconds - (minutes * SECONDS_IN_MINUTE);

    char *yearsIdentifier = (years == 1) ? "jaar" : "jaren";
    char *monthsIdentifier = (months == 1) ? "maand" : "maanden";
    char *daysIdentifier = (days == 1) ? "dag" : "dagen";
    char *hoursIdentifier = (hours == 1) ? "uur" : "uren";
    char *minutesIdentifier = (minutes == 1) ? "minuut" : "minuten";
    char *secondsIdentifier = (seconds == 1) ? "seconde" : "seconden";
    printf("%lu %s, %d %s, %d %s, %d %s, %d %s, %lu %s",
           years, yearsIdentifier,
           months, monthsIdentifier,
           days, daysIdentifier,
           hours, hoursIdentifier,
           minutes, minutesIdentifier,
           seconds, secondsIdentifier
       );
}

int main() {
    unsigned long seconds;
    scanf("%lu", &seconds);
    printFormattedSeconds(seconds);
    return 0;
}
