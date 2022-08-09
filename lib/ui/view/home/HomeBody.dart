import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiti/ui/view/VoucherPage.dart';
import 'package:kiti/utils/Auth.dart';
import 'package:provider/provider.dart';

import '../../../utils/Constants.dart';
import '../../../utils/Images.dart';
import '../../../utils/Log.dart';
import '../../../utils/Utils.dart';
import '../../model/HomeModel.dart';
import '../../viewmodel/HomeViewModel.dart';
import '../LoginPage.dart';
import '../StepPage.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<HomeModel> imgList = Constants.imageHomeModelList;

  FirebaseDatabase database = FirebaseDatabase.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    super.initState();
    startPageAnimation();

    // refTest();
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel vm = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: Utils.getScreenWidth(context),
            height: Utils.getScreenWidth(context) * 9 / 16,
            child: PageView(
              controller: _pageController,
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              // crossAxisSpacing: 5.0,
              // mainAxisSpacing: 5.0,
            ),
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(const StepPage());
                      break;
                    case 1:
                      Get.to(const VoucherPage());
                      break;
                    case 2:
                      break;
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      imgList[index].icon.toString(),
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      imgList[index].title.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) =>
                  _handleSignOut().then((value) => Get.to(const LoginPage())));
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }

  void startPageAnimation() {
    try {
      Future.delayed(const Duration(seconds: 4), () {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
        startPageAnimation();
      });
    } catch (e) {
      Log.e(e);
    }
  }

  Future<void> refTest() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

    await ref.set({
      "name": "John",
      "age": 18,
      "address": {"line1": "100 Mountain View"}
    });
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
}
