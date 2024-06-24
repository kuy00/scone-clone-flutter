import 'package:jiffy/jiffy.dart';

num dateDiff(DateTime startDate, DateTime endDate,
    {Unit unit = Unit.microsecond}) {
  var a = Jiffy.parseFromDateTime(startDate)
      .diff(Jiffy.parseFromDateTime(endDate), unit: unit);
  return a;
}

DateTime dateAdd(
  DateTime date, {
  int microseconds = 0,
  int milliseconds = 0,
  int seconds = 0,
  int minutes = 0,
  int hours = 0,
  int days = 0,
  int weeks = 0,
  int months = 0,
  int years = 0,
}) {
  return Jiffy.parseFromDateTime(date)
      .add(
          microseconds: microseconds,
          milliseconds: milliseconds,
          seconds: seconds,
          minutes: minutes,
          hours: hours,
          days: days,
          weeks: weeks,
          months: months,
          years: years)
      .dateTime;
}

String dateFormat(DateTime date, String pattern) {
  return Jiffy.parseFromDateTime(date).format(pattern: pattern);
}

bool isToday(DateTime date) {
  return Jiffy.now().isSame(Jiffy.parseFromDateTime(date), unit: Unit.day);
}

bool isSameDate(DateTime date, DateTime date2) {
  return Jiffy.parseFromDateTime(date)
      .isSame(Jiffy.parseFromDateTime(date2), unit: Unit.day);
}

bool isBetween(DateTime date, DateTime startDate, DateTime endDate) {
  return Jiffy.parseFromDateTime(date).isBetween(
      Jiffy.parseFromDateTime(startDate), Jiffy.parseFromDateTime(endDate));
}

bool isAfter(DateTime date, DateTime date2) {
  return Jiffy.parseFromDateTime(date).isAfter(Jiffy.parseFromDateTime(date2));
}
