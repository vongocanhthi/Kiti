import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Images.dart';
import '../../utils/Strings.dart';
import 'OtpPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const LoginBody());
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _controllerTextPhoneNumber =
      TextEditingController();
  bool isPhoneNumber = true, isEntering = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  Images.IC_VIETNAM,
                  width: 50,
                  height: 50,
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                const Text(
                  "(+84)",
                  style: TextStyle(fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                const Text(
                  "Việt Nam",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  isPhoneNumber = true;
                });
              },
              controller: _controllerTextPhoneNumber,
              keyboardType: TextInputType.phone,
              maxLength: 11,
              decoration: InputDecoration(
                // icon: Icon(Icons.phone),
                labelText: Strings.PHONE_NUMBER.tr,
                errorText: isPhoneNumber ? null : Strings.PHONE_NUMBER_FAIL.tr,
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(
                  Icons.check_circle,
                ),
              ),
            ),
            Opacity(
              opacity: _controllerTextPhoneNumber.text.isNotEmpty ? 1 : 0.6,
              child: ElevatedButton(
                onPressed: onLogin,
                child: Text(Strings.LOGIN.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLogin() {
    String phoneNumber = _controllerTextPhoneNumber.text.trim();
    if (phoneNumber.isNotEmpty) {
      setState(() {
        isPhoneNumber = GetUtils.isPhoneNumber(phoneNumber);

        if (isPhoneNumber) {
          Get.to(const OtpPage(), arguments: phoneNumber);
        }
      });
    }
  }
}
