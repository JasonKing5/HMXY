
/**
 * 获取这个月日历显示的第一天
 * @param date
 * @returns
 */
export function getStartDate(date: number[]): number[] {
  var dateTime = new Date(date[0], date[1] - 1, 1);
  dateTime = new Date(dateTime.setDate(dateTime.getDate() - dateTime.getDay()));
  return [(dateTime.getFullYear()), (dateTime.getMonth() + 1), (dateTime.getDate())]
}

export function getNextNMonth(date: number[], n: number): number[] {
  var dateTime = new Date(date[0], date[1] - 1, date[2]);
  dateTime = new Date(dateTime.setMonth(dateTime.getMonth() + n));
  return [(dateTime.getFullYear()), (dateTime.getMonth() + 1), (dateTime.getDate())]
}

/**
 * 获取下n天
 * @param date
 * @param n
 * @returns
 */
export function getNextNDay(date: number[], n: number): number[] {
  var dateTime = new Date(date[0], date[1] - 1, date[2]);
  dateTime = new Date(dateTime.setDate(dateTime.getDate() + n));
  return [(dateTime.getFullYear()), (dateTime.getMonth() + 1), (dateTime.getDate())]
}

export function getToday(): number[] {
  return [new Date().getFullYear(), new Date().getMonth() + 1, new Date().getDate()];
}