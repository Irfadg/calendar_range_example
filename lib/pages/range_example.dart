import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_app/pages/widgets/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../utils.dart';

class TableRangeExample extends StatefulWidget {
  @override
  _TableRangeExampleState createState() => _TableRangeExampleState();
}

class _TableRangeExampleState extends State<TableRangeExample>
    with SingleTickerProviderStateMixin {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  bool isDaySelected = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Calander'),
            ToggleSwitch(
              minWidth: 60.0,
              fontSize: 16.0,
              initialLabelIndex: isDaySelected?1:0,
              activeBgColor: [Colors.blue],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.black,
              totalSwitches: 2,
              labels: ['Week', 'Day'],
              onToggle: (index) {
                if (index == 0) {
                  setState(() {
                    isDaySelected = false;
                  });
                } else if (index == 0) {
                  setState(() {
                    isDaySelected = true;
                  });
                }
                // Handle toggle changes
                print('Switched to: $index');
                // setState(() {
                // index == 0 ? isDaySelected = false : isDaySelected = true;
                // });
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            isDaySelected
                ? TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      )
                : TableCalendar(
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    calendarFormat: _calendarFormat,
                    rangeSelectionMode: _rangeSelectionMode,
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          _rangeStart = null; // Important to clean those
                          _rangeEnd = null;
                          _rangeSelectionMode = RangeSelectionMode.toggledOff;
                        });
                      }
                    },
                    onRangeSelected: (start, end, focusedDay) {
                      setState(() {
                        _selectedDay = null;
                        _focusedDay = focusedDay;
                        _rangeStart = start;
                        _rangeEnd = end;
                        _rangeSelectionMode = RangeSelectionMode.toggledOn;
                      });
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
            SizedBox(
              height: 15,
            ),
            TabBar(
              indicatorColor: Colors.grey,
              labelColor: Colors.black,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'ALL (4)',
                ),
                Tab(text: 'HRD (7)'),
                Tab(text: 'Tech1 (7)'),
                Tab(text: 'Follow (8)'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Your content for Tab 1
                  bottomSelectedValues(
                    startDate: _rangeStart,
                    endDate: _rangeEnd,
                  ),
                  // Your content for Tab 2
                  bottomSelectedValues(
                    startDate: _rangeStart,
                    endDate: _rangeEnd,
                  ),
                  // Your content for Tab 3
                  bottomSelectedValues(
                    startDate: _rangeStart,
                    endDate: _rangeEnd,
                  ),
                  // Your content for Tab 4
                  bottomSelectedValues(
                    startDate: _rangeStart,
                    endDate: _rangeEnd,
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


