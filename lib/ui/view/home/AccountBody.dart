import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UserInfoPage.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 56,
          ),
          title: Text("Title"),
          subtitle: Text("subtitle"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: onUserInfo,
        ),
      ),
    );
  }

  onUserInfo() {
    Get.to(const UserInfoPage());
  }
}
