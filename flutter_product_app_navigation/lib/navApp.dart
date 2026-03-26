import 'package:flutter/material.dart';
import 'package:flutter_product_app_navigation/productListPage.dart';

class NavApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );
  }

}