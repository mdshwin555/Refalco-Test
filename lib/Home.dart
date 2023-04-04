import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:technical_test/Model/OrderModel.dart';
import 'Constants/Images.dart';
import 'Controllers/OrdersController.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'ShowView.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    OrdersController.getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Order List'),
      ),
      body: FutureBuilder<dynamic>(
        future: OrdersController.getOrders(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
          if (snapshot.connectionState == ConnectionState.done) {
            return AnimationLimiter(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data.length,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: Duration(milliseconds: 375),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: ShowView(snapshot.data[index]),
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
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Lottie.asset(
                    Images.noitems,
                    height: 30.h,
                  ),
                  Text(
                    'noitems',
                    style: TextStyle(
                      //fontFamily: Fonts.h,
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
