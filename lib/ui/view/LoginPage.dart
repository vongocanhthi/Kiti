import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiti/ui/model/UserModel.dart';
import 'package:kiti/ui/view/home/HomePage.dart';
import 'package:kiti/utils/Constants.dart';
import 'package:kiti/utils/Log.dart';

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

  GoogleSignInAccount? _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        Log.d(_currentUser);
        createAccount(_currentUser!);
        Get.to(const HomePage());
      }
    });
  }

  Future<void> createAccount(GoogleSignInAccount currentUser) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(Constants.USERS);

    await ref.set(UserModel(
      id: currentUser.id,
      name: currentUser.displayName,
      avatar: currentUser.photoUrl,
      email: currentUser.email,
    ).toJson());
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
            // Row(
            //   children: [
            //     Image.asset(
            //       Images.IC_VIETNAM,
            //       width: 50,
            //       height: 50,
            //     ),
            //     const Padding(padding: EdgeInsets.only(left: 10)),
            //     const Text(
            //       "(+84)",
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     const Padding(padding: EdgeInsets.only(left: 10)),
            //     const Text(
            //       "Việt Nam",
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ],
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10)),
            // TextFormField(
            //   onChanged: (value) {
            //     setState(() {
            //       isPhoneNumber = true;
            //     });
            //   },
            //   controller: _controllerTextPhoneNumber,
            //   keyboardType: TextInputType.phone,
            //   maxLength: 11,
            //   decoration: InputDecoration(
            //     // icon: Icon(Icons.phone),
            //     labelText: Strings.PHONE_NUMBER.tr,
            //     errorText: isPhoneNumber ? null : Strings.PHONE_NUMBER_FAIL.tr,
            //     border: const OutlineInputBorder(),
            //     suffixIcon: const Icon(
            //       Icons.check_circle,
            //     ),
            //   ),
            // ),
            // Opacity(
            //   opacity: _controllerTextPhoneNumber.text.isNotEmpty ? 1 : 0.6,
            //   child: ElevatedButton(
            //     onPressed: onLogin,
            //     child: Text(Strings.LOGIN.tr),
            //   ),
            // ),

            ElevatedButton(
              onPressed: _handleSignIn,
              child: Text(Strings.LOGIN.tr),
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

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      Log.e(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
}
