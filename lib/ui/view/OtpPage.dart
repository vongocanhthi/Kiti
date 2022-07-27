import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Log.dart';
import '../../utils/Strings.dart';
import '../../utils/Utils.dart';
import '../model/UserModel.dart';
import 'home/HomePage.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nhập mã OTP"),
          centerTitle: true,
        ),
        body: const OtpBody());
  }
}

class OtpBody extends StatefulWidget {
  const OtpBody({Key? key}) : super(key: key);

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  String phoneNumber = Get.arguments;
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Users");

  final TextEditingController _controllerTextOtp = TextEditingController();

  late Timer _timer;
  int TIME_RETRY = 300;
  int _start = 120;
  String verificationIdReceived = "";
  bool verifyError = false, isClickConfirm = false;

  @override
  void initState() {
    super.initState();
    sendOtp(phoneNumber);
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Utils.hideKeyboard(),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("OTP đang gửi đến số điện thoại"),
            Text(
              "+84$phoneNumber",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  if (_controllerTextOtp.text.length == 6) {
                    onVefify();
                  } else {
                    setState(() {
                      verifyError = false;
                    });
                  }
                });
              },
              controller: _controllerTextOtp,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                // icon: Icon(Icons.phone),
                labelText: "6 chữ số",
                errorText: verifyError ? Strings.OTP_FAIL.tr : null,
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(
                  Icons.check_circle,
                ),
              ),
            ),
            Visibility(
              visible: _start == 0 ? false : true,
              child: Text("$_start"),
            ),
            Visibility(
              visible: _start == 0 ? true : false,
              child: TextButton(
                onPressed: onNotReceivedOtp,
                child: const Text("Không nhận được mã OTP"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> sendOtp(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+84$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        verifySuccess(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Log.e(e.message);
      },
      codeSent: (String verificationId, int? resendToken) async {
        verificationIdReceived = verificationId;

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: _controllerTextOtp.text,
        );

        verifySuccess(credential);

        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Log.e("codeAutoRetrievalTimeout");
      },
    );
  }

  Future<void> verifySuccess(PhoneAuthCredential credential) async {
    // Sign the user in (or link) with the credential
    try {
      await auth.signInWithCredential(credential).then((value) => {
            ref
                .child(auth.currentUser!.uid)
                .set(
                  UserModel(
                    uid: auth.currentUser!.uid,
                    name: "User${Random().nextInt(9999990) + 1000}",
                    money: "0",
                    phoneNumber: phoneNumber,
                  ).toJson(),
                )
                .then((value) {
              Get.to(const HomePage());
            })
          });
    } catch (e) {
      setState(() {
        if (isClickConfirm) {
          verifyError = true;
        }
      });
    }
  }

  void onVefify() {
    isClickConfirm = true;
    Utils.hideKeyboard();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIdReceived,
      smsCode: _controllerTextOtp.text,
    );
    verifySuccess(credential);
  }

  void onNotReceivedOtp() {
    sendOtp(phoneNumber);
    _start = TIME_RETRY;
    startTimer();
  }
}
