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
import '../../Controllers/HomeController.dart';
import '../Widgets/ShowView.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());
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
        limit += 0;
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
      body: PageView(
        //physics: NeverScrollableScrollPhysics(),
        controller: homeController.pageController,
        children: [
          FutureBuilder<dynamic>(
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
          FavoriteList(),
        ],
      ),
      bottomNavigationBar: GetX<HomeController>(builder: (controller) {
        return CircleNavBar(
          cornerRadius: BorderRadius.vertical(
            top: Radius.circular(25.sp),
            bottom: Radius.circular(25.sp),
          ),
          padding: EdgeInsets.only(bottom: 2.h, left: 5.w, right: 5.w),
          circleColor: Color(0xff454545),
          activeIcons: [
            Icon(CupertinoIcons.house_fill),
            Icon(CupertinoIcons.heart_fill),
          ],
          inactiveIcons: [
            Icon(
              CupertinoIcons.home,
              color: Color(0xff454545),
            ),
            Icon(
              CupertinoIcons.heart,
              color: Color(0xff454545),
            ),
          ],
          color: Color(0xffE8E2E2),
          height: 8.h,
          activeIndex: controller.pageInx.value,
          onTap: (index) => controller.toPage(index),
          circleWidth: 8.h,
          iconDurationMillSec: 400,
          tabCurve: Curves.easeOutQuart,
        );
      }),
    );
  }
}
