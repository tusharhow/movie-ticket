import 'package:flutter/material.dart';



class ScreenPicker extends StatefulWidget {
  const ScreenPicker({Key? key}) : super(key: key);

  @override
  _ScreenPickerState createState() => _ScreenPickerState();
}

class _ScreenPickerState extends State<ScreenPicker> {
  int selectedIndex = 0;
  final List<String> _screen = [
    "2D",
    "3D",
    "4DX",
    "IMAX",
    "8D",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _buildScreenPicker(index),
          ),
        ),
      ),
    );
  }

  Widget _buildScreenPicker(int index) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          height: 60,
          width: 75,
          decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              _screen[index],
              style: TextStyle(
                color:
                    selectedIndex == index ? Colors.orangeAccent : Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
