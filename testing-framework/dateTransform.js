const SECONDS_IN_MINUTE = 60;
const SECONDS_IN_HOUR = SECONDS_IN_MINUTE * 60;
const SECONDS_IN_DAY = SECONDS_IN_HOUR * 24;
const SECONDS_IN_MONTH = SECONDS_IN_DAY * 30;
const SECONDS_IN_YEAR = SECONDS_IN_DAY * 365;

const getMinutes = (seconds) => {
  return Math.floor(seconds / SECONDS_IN_MINUTE);
}

const getHours = (seconds) => {
  return Math.floor(seconds / SECONDS_IN_HOUR);
}

const getDays = (seconds) => {
  return Math.floor(seconds / SECONDS_IN_DAY);
}

const getMonths = (seconds) => {
  return Math.floor(seconds / SECONDS_IN_MONTH);
}

const getYears = (seconds) => {
  return Math.floor(seconds / SECONDS_IN_YEAR);
}

const printFormattedSeconds = (seconds) => {
  const years = getYears(seconds);
  seconds -= (years * SECONDS_IN_YEAR);

  const months = getMonths(seconds);
  seconds -= (months * SECONDS_IN_MONTH);

  const days = getDays(seconds);
  seconds -= days * SECONDS_IN_DAY;

  const hours = getHours(seconds);
  seconds -= hours * SECONDS_IN_HOUR;

  const minutes = getMinutes(seconds);
  seconds -= minutes * SECONDS_IN_MINUTE;

  const yearLabel = (years === 1) ? "jaar" : "jaren";
  const monthLabel = (months === 1) ? "maand" : "maanden";
  const dayLabel = (days === 1) ? "dag" : "dagen";
  const hourLabel = (hours === 1) ? "uur" : "uren";
  const minuteLabel = (minutes === 1) ? "minuut" : "minuten";
  const secondLabel = (seconds === 1) ? "seconde" : "secondes";

  console.log(`
    ${years} ${yearLabel}, 
    ${months} ${monthLabel}, 
    ${days} ${dayLabel}, 
    ${hours} ${hourLabel}, 
    ${minutes} ${minuteLabel}, 
    ${seconds} ${secondLabel}
  `);
}

export default { getMinutes, getHours, getDays, getMonths, getYears, printFormattedSeconds };