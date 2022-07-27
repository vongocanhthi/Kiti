import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/Globals.dart';
import '../../../utils/Images.dart';
import '../../../utils/Log.dart';
import 'AccountBody.dart';
import 'AttendanceBody.dart';
import 'HomeBody.dart';
import 'TaskBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: replaceIcon(),
        title: replaceTitle(),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        // toolbarHeight: 100,
        actions: [
          IconButton(
            icon: Image.asset(
              Images.STEPBOX_COIN,
              width: 25,
              height: 25,
            ),
            onPressed: () {
              withdrawMoney();
            },
          ),
          // const Padding(padding: EdgeInsets.only(left: 5)),
          Center(
            child: GestureDetector(
              onTap: () {
                withdrawMoney();
              },
              child: Text(
                Globals.gold.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 20)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: replaceBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Nhiệm vụ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: "Điểm danh"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Tài khoản"),
        ],
        onTap: onNavigationBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void onNavigationBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  replaceBody() {
    switch (_selectedIndex) {
      case 0:
        return const HomeBody();
      case 1:
        return const TaskBody();
      case 2:
        return const AttendanceBody();
      case 3:
        return const AccountBody();
    }
  }

  replaceTitle() {
    switch (_selectedIndex) {
      case 0:
        return const Text("Home");
      case 1:
        return const Text("Task");
      case 2:
        return const Text("Attendance");
      case 3:
        return const Text("Account");
    }
  }

  replaceIcon() {
    switch (_selectedIndex) {
      case 0:
        return const Icon(Icons.home);
      case 1:
        return const Icon(Icons.task);
      case 2:
        return const Icon(Icons.card_giftcard);
      case 3:
        return const Icon(Icons.account_circle);
    }
  }

  void withdrawMoney() {
    Log.d("withdrawMoney");
  }
}
