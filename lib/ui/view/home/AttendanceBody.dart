import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kiti/utils/Log.dart';

import '../../../utils/Globals.dart';

class AttendanceBody extends StatefulWidget {
  const AttendanceBody({Key? key}) : super(key: key);

  @override
  State<AttendanceBody> createState() => _AttendanceBodyState();
}

class _AttendanceBodyState extends State<AttendanceBody> {
  RewardedAd? _rewardedAd;

  var request = const AdRequest();

  @override
  void initState() {
    super.initState();
    _createRewardedAd();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              this.setState(() {
                Globals.gold += 10;
              });
            },
            child: Text("Điểm danh")),
        ElevatedButton(
            onPressed: () {
              _showRewardedAd();
            },
            child: Text("Show ad")),
      ],
    );
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            Log.d('$ad loaded.');
            _rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            Log.d('RewardedAd failed to load: $error');
            _createRewardedAd();
          },
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      Log.d('Warning: attempt to show rewarded before loaded.');
      Get.snackbar("Thông báo", "Đang tải quảng cáo...");
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          Log.d('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        Log.d('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        Log.d('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      Log.d('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedAd = null;
  }

  @override
  void dispose() {
    super.dispose();
    _rewardedAd?.dispose();
  }
}
