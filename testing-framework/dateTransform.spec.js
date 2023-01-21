import { TestSuite, RunAllSuites } from "./TestFramework/Suite.js";
import dateTransform from "./dateTransform.js";

let seconds;
new TestSuite("getYears")
  .beforeEach(() => { seconds = 60 * 60 * 24 * 365; })
  .addTest("getYearsExact", (t) => {
    const yearsAboveBorder = dateTransform.getYears(seconds);
    const yearsBelowBorder = dateTransform.getYears(seconds - 1);

    t.assertStrictEquals(yearsAboveBorder, 1);
    t.assertStrictEquals(yearsBelowBorder, 0);
  });

new TestSuite("getMonths")
  .beforeEach(() => { seconds = 60 * 60 * 24 * 30; })
  .addTest("getMonthsExact", (t) => {
    const monthsAboveBorder = dateTransform.getMonths(seconds);
    const monthsBelowBorder = dateTransform.getMonths(seconds - 1);

    t.assertStrictEquals(monthsAboveBorder, 1);
    t.assertStrictEquals(monthsBelowBorder, 0);
  });

new TestSuite("getDays")
  .beforeEach(() => { seconds = 60 * 60 * 24; })
  .addTest("getDaysExact", (t) => {
    const daysAboveBorder = dateTransform.getDays(seconds);
    const daysBelowBorder = dateTransform.getDays(seconds - 1);

    t.assertStrictEquals(daysAboveBorder, 1);
    t.assertStrictEquals(daysBelowBorder, 0);
  });

new TestSuite("getHours")
  .beforeEach(() => { seconds = 60 * 60; })
  .addTest("getHoursExact", (t) => {
    const hoursAboveBorder = dateTransform.getHours(seconds);
    const hoursBelowBorder = dateTransform.getHours(seconds - 1);

    t.assertStrictEquals(hoursAboveBorder, 1);
    t.assertStrictEquals(hoursBelowBorder, 0);
  });

new TestSuite("getMinutes")
  .beforeEach(() => { seconds = 60; })
  .addTest("getMinutesExact", (t) => {
    const minutesAboveBorder = dateTransform.getMinutes(seconds);
    const minutesBelowBorder = dateTransform.getMinutes(seconds - 1);

    t.assertStrictEquals(minutesAboveBorder, 1);
    t.assertStrictEquals(minutesBelowBorder, 0);
  })