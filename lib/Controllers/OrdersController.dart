import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_test/Model/OrderModel.dart';

class OrdersController {

  static Future getOrders() async {
    var response = await http.get(
      Uri.parse('https://62f4b229ac59075124c1e40b.mockapi.io/api/v1/orders'),
    );

    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);
      List<OrderModel> models = [];
      for (var j in urjson['data']) models.add(OrderModel.fromJson(j));
      return models;
    }
  }
}
