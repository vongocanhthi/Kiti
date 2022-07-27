import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin cá nhân"),
        centerTitle: true,
      ),
    );
  }
}
