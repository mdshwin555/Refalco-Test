// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'Controllers/FavoritesController.dart';
// import 'ShowView.dart';
//
// class OrderItem extends StatelessWidget {
//   final ShowView order;
//
//   OrderItem({required this.order});
//
//   @override
//   Widget build(BuildContext context) {
//     final favoriteOrdersController = Get.find<FavoriteOrdersController>();
//
//     return GetX<FavoriteOrdersController>(
//       init: FavoriteOrdersController(),
//       builder: (_) => ListTile(
//         title: Text(order.),
//         subtitle: Text(order.description),
//         trailing: IconButton(
//           icon: Icon(
//             favoriteOrdersController.isFavorite(order)
//                 ? Icons.favorite
//                 : Icons.favorite_border,
//           ),
//           onPressed: () {
//             if (favoriteOrdersController.isFavorite(order)) {
//               favoriteOrdersController.removeFromFavorites(order);
//             } else {
//               favoriteOrdersController.addToFavorites(order);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
