import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);


  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int selectedIndex = 0;
  final List<String> _time = [
    "11:00",
    "12:30",
    "14:30",
    "16:00",
    "17:30",
    "19:00",
    "20:30",
  ];
  final List<String> _price = [
    "From \$5",
    "From \$10",
    "From \$15",
    "From \$20",
    "From \$25",
    "From \$30",
    "From \$35",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        physics:  const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _buildTimePicker(index),
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(int index) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          height: 70,
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  selectedIndex == index ? Colors.orangeAccent : Colors.white10,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _time[index],
                style: TextStyle(
                  color: selectedIndex == index
                      ? Colors.orangeAccent
                      : Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _price[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.white24,
                  fontSize: 18.0,
                  fontWeight: selectedIndex == index ? FontWeight.bold : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
