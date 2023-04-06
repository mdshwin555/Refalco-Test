import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'Constants/constants.dart';
import 'View/Screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              toolbarHeight: 10.h,
              color: Colors.black, // sets the background color of the AppBar
              foregroundColor: Colors.white, // sets the text color of the AppBar
              iconTheme: IconThemeData(
                color: Colors.white, // sets the color of the icons in the AppBar
              ),
              titleTextStyle: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Alata',

              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: Routes.Home, page: () => Home()),
          ],
          initialRoute: Routes.Home,
        );
      },
    );
  }
}
