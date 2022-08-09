import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:kiti/api/AccessTradeApi.dart';
import 'package:kiti/ui/model/VoucherModel.dart';
import 'package:kiti/utils/Log.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mã khuyến mãi"),
        centerTitle: true,
      ),
      body: const VoucherBody(),
    );
  }
}

class VoucherBody extends StatefulWidget {
  const VoucherBody({Key? key}) : super(key: key);

  @override
  State<VoucherBody> createState() => _VoucherBodyState();
}

class _VoucherBodyState extends State<VoucherBody> {
  @override
  void initState() {
    super.initState();
    // var list = AccessTradeApi().getVouchers();
    // list.then((value) {
    //   print("AccessTradeApi ${value}");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Response>(
        future: AccessTradeApi().getVouchers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var response = snapshot.data?.body["data"];

            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                Data data = Data.fromJson(response[index]);

                Log.d(data.campaignName);
                return ListTile(
                  title: Text(""),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
