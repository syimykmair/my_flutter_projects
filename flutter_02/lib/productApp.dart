import 'package:flutter/material.dart';
import 'package:flutter_02/productCard.dart';

class ProductApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Товары'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        ),
        body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
         child: SingleChildScrollView( 
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: ProductCard(
                  image: 'images/nike.jpg',
                  title: 'Nike Air Max',
                  price: '\$99',
                  category: 'Shoes',
                  rating: 4,
                  sale: true,
                ),),
                SizedBox(width: 12),
                Expanded(child: ProductCard(
                  image: 'images/leatherbag.jpg', 
                  title: 'Leather Bag',
                   price: '\$120',
                   category: 'Bags',
                   rating: 4,),),
                   
              ],
             
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: ProductCard(image: 'images/headphones.jpg',
                 title: 'Headphones',
                 price: '\$100',
                 category: 'Audio',
                 rating: 5,
                 sale: true),),
                 
                 SizedBox(width: 12),

                 Expanded(child: ProductCard(
                  image: 'images/watch.jpg', 
                  title: 'Apple Watch', 
                  category: 'Gadgets',
                  price: '\$150',
                  rating: 4,),
                  ),
              ],
            )
          ],
        ),
        ),
      ),
      )),);
  }
}