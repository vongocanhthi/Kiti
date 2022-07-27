import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/Globals.dart';

class AttendanceBody extends StatefulWidget {
  const AttendanceBody({Key? key}) : super(key: key);

  @override
  State<AttendanceBody> createState() => _AttendanceBodyState();
}

class _AttendanceBodyState extends State<AttendanceBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {
          this.setState(() {
            Globals.gold += 10;
          });
        }, child: Text("Điểm danh"))
      ],
    );
  }
}
