import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late int currentDay;

  @override
  void initState() {
    super.initState();
    // Initialize the current day
    DateTime now = DateTime.now();
    currentDay = now.day;

    // Start a timer to check for day change
    Timer.periodic(const Duration(days: 1), (timer) {
      DateTime newTime = DateTime.now();
      if (newTime.day != currentDay) {
        setState(() {
          currentDay = newTime.day;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String dayOfMonth = currentDay.toString();
    return SizedBox(
      width: 33,
      height: 33,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/Calendar.svg",
            height: 33,
            width: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                dayOfMonth,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
