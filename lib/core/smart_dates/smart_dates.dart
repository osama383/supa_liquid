import 'package:flutter/material.dart';

import '../models/utc.dart';

enum SmartDates {
  last30Days,
  today,
  yesterday,
  lastMonth,
  lastQuarter,
}

DateTimeRange toDateRange(SmartDates smartRange, Utc now) {
  late final Utc start, end;
  switch (smartRange) {
    case SmartDates.last30Days:
      end = now;
      start = end.subtract(const Duration(days: 30));
    case SmartDates.today:
      end = now;
      start = end;
    case SmartDates.yesterday:
      end = now.copyToStartOfDay().subtract(const Duration(seconds: 1));
      start = end.copyToStartOfDay();
    case SmartDates.lastMonth:
      end = now
          .copyUtc(day: 1)
          .copyToStartOfDay()
          .subtract(const Duration(seconds: 1));
      start = end.copyUtc(day: 1);
    case SmartDates.lastQuarter:
      end = now
          .copyUtc(
            month: now.month - ((now.month + 2) % 3).floor(),
            day: 1,
          )
          .copyToStartOfDay()
          .subtract(const Duration(seconds: 1))
          .copyUtc(
            year: now.year - (now.month > 3 ? 0 : 1),
          );
      start = end.copyUtc(month: end.month - 2, day: 1).copyToStartOfDay();
  }
  return DateTimeRange(
    start: start.copyToStartOfDay().value,
    end: end.copyToEndOfDay().value,
  );
}
