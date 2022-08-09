import 'dart:convert';

import 'package:get/get.dart';
import 'package:kiti/ui/model/VoucherModel.dart';
import 'package:kiti/utils/Log.dart';

class AccessTradeApi extends GetConnect {
  //url
  String BASE_URL = "https://api.accesstrade.vn/v1/";

  //voucher
  String COUPON = "offers_informations/coupon";

  var HEADERS = {
    "Authorization": "Token QbgqXLRelWqdE4-aLveGoC5KFoxXhlGW",
    "Content-Type": "application/json"
  };

  // Future<List<Data>> getVouchers() async {
  //   var response = await get(BASE_URL + COUPON, headers: HEADERS);
  //   List jsonResponse = json.decode(response.body)["data"];
  //   Log.d(jsonResponse);
  //   return jsonResponse.map((data) => Data.fromJson(data)).toList();
  // }

  Future<Response> getVouchers() async {
    var response = await get(BASE_URL + COUPON, headers: HEADERS);
    // List jsonResponse = json.decode(response.body)["data"];
    // Log.d(jsonResponse);
    return response;
  }
}
