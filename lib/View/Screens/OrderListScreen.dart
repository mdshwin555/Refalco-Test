import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:technical_test/View/Screens/FavoriteList.dart';
import 'package:technical_test/Model/OrderModel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/Images.dart';
import '../../Controllers/FavoritesController.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/ShowView.dart';

class OrderList extends StatefulWidget {
  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final HomeController homeController = Get.put(HomeController());
  final FavoriteOrdersController favoriteOrdersController = Get.put(FavoriteOrdersController());
  late final List<OrderModel> favoriteOrders;
  ScrollController _scrollController = ScrollController();
  int limit = 10;
  int page = 1;
  bool isLoadMore = false;
  List<OrderModel> _orders = [];

  Future<List<OrderModel>> getOrders() async {
    var response = await http.get(Uri.parse(
        'https://62f4b229ac59075124c1e40b.mockapi.io/api/v1/orders?page=$page&limit=$limit'));

    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);
      List<OrderModel> models = [];
      for (var j in urjson['data']) models.add(OrderModel.fromJson(j));
      return models;
    }
    // Return an empty list if there are no OrderModel objects to return
    return [];
  }

  @override
  void initState() {
    super.initState();
    getOrders().then((value) {
      setState(() {
        _orders = value;
      });
    });

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoadMore = true;
        });
        limit +=0;
        page += 1;
        List<OrderModel> newOrders = await getOrders();
        setState(() {
          _orders.addAll(newOrders);
          isLoadMore = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Order List'),
      ),
      body:  FutureBuilder<dynamic>(
        future: getOrders(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting&& isLoadMore == false) {
          //   return Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Lottie.asset(
          //           Images.loading,
          //           height: 10.h,
          //         ),
          //         Text(
          //           'Loading',
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 15.sp,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     ),
          //   );
          // }
          //else
          if (snapshot.connectionState == ConnectionState.waiting &&
              isLoadMore == true) {
            return AnimationLimiter(
              child: GridView.count(
                controller: _scrollController,
                crossAxisCount: 2,
                children: List.generate(
                  isLoadMore == true ? _orders.length + 1 : _orders.length,
                      (int index) {
                    if (index == _orders.length && isLoadMore == true) {
                      return Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: 100.w,
                        child: Transform.translate(
                          offset: Offset(25.w, 0),
                          child: Lottie.asset(
                            Images.loading,
                            height: 10.h,
                          ),
                        ),
                      );
                    }
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: Duration(milliseconds: 375),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: ShowView(_orders[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return AnimationLimiter(
              child: GridView.count(
                controller: _scrollController,
                crossAxisCount: 2,
                children: List.generate(
                  isLoadMore == true ? _orders.length + 1 : _orders.length,
                      (int index) {
                    if (index == _orders.length && isLoadMore == true) {
                      return Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: 100.w,
                        child: Transform.translate(
                          offset: Offset(25.w, 0),
                          child: Lottie.asset(
                            Images.loading,
                            height: 10.h,
                          ),
                        ),
                      );
                    }
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: Duration(milliseconds: 375),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: ShowView(_orders[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),

            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    Images.loading,
                    height: 10.h,
                  ),
                  Text(
                    'Loading',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
