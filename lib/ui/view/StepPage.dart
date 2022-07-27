import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/Log.dart';

class StepPage extends StatelessWidget {
  const StepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step"),
        centerTitle: true,
      ),
      body: StepBody(),
    );
  }
}

class StepBody extends StatefulWidget {
  const StepBody({Key? key}) : super(key: key);

  @override
  State<StepBody> createState() => _StepBodyState();
}

class _StepBodyState extends State<StepBody> {
  @override
  void initState() {
    super.initState();

    permissionHealth();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> permissionHealth() async {
    if (Platform.isAndroid) {
      final permissionStatus = await Permission.activityRecognition.request();
      Log.d(permissionStatus.isGranted);
      if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "activityRecognition permission required to fetch your steps count",
            ),
          ),
        );
        return;
      }

      // create a HealthFactory for use in the app
      HealthFactory health = HealthFactory();

      // define the types to get
      var types = [
        HealthDataType.STEPS,
        HealthDataType.BLOOD_GLUCOSE,
      ];

      // requesting access to the data types before reading them
      bool requested = await health.requestAuthorization(types);

      var now = DateTime.now();

      // fetch health data from the last 24 hours
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          now.subtract(Duration(days: 1)), now, types);

      Log.d(requested);
      Log.d(healthData);
    }
  }
}
