import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final String productTitle;
  OrderPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Заказ и оплата')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ваш заказ: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(productTitle),
            SizedBox(height: 24),
            Text(
              'Способы опаты',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Банковская карта'),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Электронный кошелек'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context)=>OrderConfirmation(
                  productTitle: productTitle,
                 )),);
                },
                child: Text('Оплатить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class OrderConfirmation extends StatelessWidget {
  final String productTitle;
  OrderConfirmation({required this.productTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Icon(Icons.check_circle, color: Colors.green,size: 80,),
            SizedBox(height: 8),
            Text('Заказ успешно оформлен!',style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            SizedBox(height: 8),
            Text(productTitle),
            SizedBox(height: 24),
           ElevatedButton(onPressed: 
        (){
          Navigator.popUntil(
            context, (route) => route.isFirst
            );
        },
        
         child: Text('Вернуться в каталог')),]
      ),
       ),
    );
     }
   
}
