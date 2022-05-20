import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wholesale/widgets/ripple.dart';
import 'package:auto_route/auto_route.dart';
import '../../utils/app_text_styles.dart';
import 'views/order_type_view.dart';

class DeliveryDatePage extends StatefulWidget {
  final OrderType orderType;
  const DeliveryDatePage({required this.orderType, Key? key}) : super(key: key);

  @override
  State<DeliveryDatePage> createState() => _DeliveryDatePageState();
}

class _DeliveryDatePageState extends State<DeliveryDatePage> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  final timeSlots = [
    "9:00 am - 10:00 am",
    "2:00 pm - 3:00 pm",
    "4:00 pm - 6:00 pm",
    "6:00 pm - 7:00 pm",
    "7:00 pm - 9:00 pm",
  ];
  String? selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.orderType.isDelivery ? 'Delivery Time' : 'Pick-up Time')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CalendarView(
                focusedDay: _focusedDay,
                selectedDay: _selectedDay,
                orderType: widget.orderType,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = selectedDay;
                  });
                },
              ),
              if (_selectedDay != null) ...[
                _TimeSlotView(
                  timeSlots: timeSlots,
                  selectedTimeSlot: selectedTimeSlot,
                  orderType: widget.orderType,
                  onSelect: (timeSlot) {
                    setState(() {
                      selectedTimeSlot = timeSlot;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: selectedTimeSlot != null
                        ? () {
                            context.popRoute();
                          }
                        : null,
                    child: Text(
                      'Confirm',
                      style: AppTextStyles.bold(fontSize: 16),
                    ),
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CalendarView extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final OrderType orderType;
  final Function(DateTime, DateTime) onDaySelected;
  const _CalendarView({
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.orderType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            orderType.isDelivery
                ? 'Select Delivery Date'
                : 'Select Pick-up Date',
            style: AppTextStyles.medium(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TableCalendar(
            firstDay: DateTime.utc(2022, 4, 1),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            enabledDayPredicate: (day) {
              return !day.isBefore(
                DateTime.now().subtract(
                  const Duration(days: 1),
                ),
              );
            },
            onDaySelected: onDaySelected,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: AppTextStyles.medium(fontSize: 14),
              weekendStyle: AppTextStyles.medium(
                fontSize: 14,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonShowsNext: false,
              formatButtonVisible: false,
              titleCentered: true,
              headerPadding: const EdgeInsets.only(bottom: 8),
              headerMargin: EdgeInsets.zero,
              titleTextStyle: AppTextStyles.bold(
                fontSize: 18,
                color: Colors.orange,
              ),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              weekendTextStyle: AppTextStyles.regular(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeSlotView extends StatelessWidget {
  final List<String> timeSlots;
  final String? selectedTimeSlot;
  final Function(String) onSelect;
  final OrderType orderType;
  const _TimeSlotView({
    required this.timeSlots,
    required this.selectedTimeSlot,
    required this.onSelect,
    required this.orderType,
    Key? key,
  }) : super(key: key);

  generateTimeSlot() {
    return timeSlots.map((tag) => timeSlotWidget(tag)).toList();
  }

  timeSlotWidget(name) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Ripple(
        onTap: () {
          onSelect(name);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: selectedTimeSlot == name
                ? Colors.orange.withOpacity(0.25)
                : Colors.transparent,
            border: Border.all(
              color: selectedTimeSlot == name
                  ? Colors.orange
                  : Colors.grey.withOpacity(0.4),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Text(
            name,
            style: selectedTimeSlot == name
                ? AppTextStyles.medium(
                    color: Colors.orange,
                  )
                : AppTextStyles.regular(
                    color: Colors.black,
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            orderType.isDelivery
                ? 'Select Delivery Time'
                : 'Select Pick-up Time',
            style: AppTextStyles.medium(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: <Widget>[...generateTimeSlot()],
          ),
        ],
      ),
    );
  }
}
