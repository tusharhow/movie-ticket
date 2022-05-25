import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int selectedIndex = 0;
  final List<String> _dayNum = [
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
  ];
  final List<String> _day = [
    "TH",
    "FR",
    "SA",
    "SU",
    "MO",
    "TU",
    "WE",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //  height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _buildDatePicker(index),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(int index) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 60,
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? Colors.orangeAccent
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _dayNum[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _day[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white24,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
