import 'dart:async';

import 'package:flutter/material.dart';

class atom extends StatefulWidget {
  atom({Key? key, required this.number}) : super(key: key);

  int number;

  @override
  State<atom> createState() => _atomState();
}

class _atomState extends State<atom> {
  double size = 130;

  late Timer timer1;
  late Timer timer2;
  late Timer timer3;

  double angle1 = 0;
  double angle2 = 0;
  double angle3 = 0;

  @override
  void initState() {
    timer1 = Timer.periodic(
      Duration(milliseconds: 10),
      (timer) {
        angle1 += 0.01;
        setState(() {});
      },
    );
    timer2 = Timer.periodic(
      Duration(milliseconds: 15),
      (timer) {
        angle2 += 0.01;
        setState(() {});
      },
    );
    timer3 = Timer.periodic(
      Duration(milliseconds: 20),
      (timer) {
        angle3 += 0.01;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer1.cancel();
    timer2.cancel();
    timer3.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: center(),
        ),
        Center(
          child: Transform.rotate(
            angle: angle1,
            child: level_1(),
          ),
        ),
        widget.number > 2
            ? Center(
                child: Transform.rotate(
                  angle: angle2,
                  child: level_2(),
                ),
              )
            : SizedBox(),
        widget.number > 10
            ? Center(
                child: Transform.rotate(
                  angle: angle3,
                  child: level_3(),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Stack center() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(1),
          height: size - 120,
          width: size - 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(),
          ),
        ),
      ],
    );
  }

  List<double> level_1_y = [-4, 44];
  List<double> level_1_x = [20, 20];

  Stack level_1() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (var i = 0; (i < widget.number && i < 2); i++)
          Positioned(
            top: level_1_y[i],
            left: level_1_x[i],
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.all(1),
          height: size - 80,
          width: size - 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Stack level_2() {
    List<double> level_2_y = [-5, 84, 40, 40, 8.5, 71.5, 8.5, 71.5];
    List<double> level_2_x = [40, 40, -5, 84, 8.5, 71.5, 71.5, 8.5];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (var i = 0; (i < widget.number - 2 && i < 8); i++)
          Positioned(
            top: level_2_y[i],
            left: level_2_x[i],
            child: Container(
              padding: EdgeInsets.all(1),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.all(1),
          height: size - 40,
          width: size - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Stack level_3() {
    List<double> level_3_y = [
      -5,
      124,
      29,
      91,
      28,
      91,
      0,
      11,
      120,
      109,
      0,
      11,
      120,
      109,
      //-
      49,
      71,
      49,
      71,
    ];
    List<double> level_3_x = [
      60,
      60,
      4,
      116,
      116,
      4,
      38,
      19,
      83,
      102,
      83,
      102,
      36,
      18,
      //-
      -4,
      -4,
      124,
      124,
    ];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (var i = 0; (i < widget.number - 10 && i < 18); i++)
          Positioned(
            top: level_3_y[i],
            left: level_3_x[i],
            // top: 124,
            // left: 60,
            child: Container(
              padding: EdgeInsets.all(1),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.all(1),
          height: size - 0,
          width: size - 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
