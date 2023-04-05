import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/FavoritesController.dart';
import 'Model/OrderModel.dart';

class FavoriteList extends StatelessWidget {
  final FavoriteOrdersController controller = Get.put(FavoriteOrdersController());
  // final OrderModel model;
  //
  // FavoriteList(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => ListView.builder(
        itemCount: controller.favoriteOrders.length,
        itemBuilder: (BuildContext context, int index) {
          final order = controller.favoriteOrders[index];
          return ListTile(
            title: Text('name'),
            subtitle: Text('price'),
          );
        },
      )),
    );
  }
}
