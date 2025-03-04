import 'package:animations/core/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    final double totalprice = args is double ? args : 0.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            color: Colors.blue[50],
            width: screenWidth,
            height: screenHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios_new_outlined),
                        ),
                      ),
                      Expanded(
                        child: Center(child: Text("My Order", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)
                      ),
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          onPressed: () {
                            
                          },
                          icon: Icon(Icons.notifications_rounded),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 200,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text("Credit Card", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text("4032 0367 9082 9335", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("John Due", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                              Image.network(
                              "https://img.icons8.com/?size=50&id=62765&format=png&color=000000" 
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: screenWidth,
                    child: Padding(padding: EdgeInsets.only(left: 20), child: Text("Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.only(left: 20), child: Text("John Smith", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),),
                        Padding(padding: EdgeInsets.only(left: 20), child: Text("123 Test Street, Sample City, ST 45678, USA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),),),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            margin: EdgeInsets.only(right: 20),
                            padding: EdgeInsets.all(5),
                            child: Text("Change Address", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),),
                          )
                        )
                      ],
                    )
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: Padding(padding: EdgeInsets.only(left: 20), child: Text("Payment Method", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network(
                            "https://img.icons8.com/?size=50&id=vizert0k77Jn&format=png&color=000000" 
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network(
                            "https://img.icons8.com/?size=50&id=62765&format=png&color=000000" 
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network(
                            "https://img.icons8.com/?size=50&id=1429&format=png&color=000000" 
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/196/196539.png" 
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: screenWidth,
                    child: Padding(padding: EdgeInsets.only(left: 20), child: Text("Payment Method", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 40, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("John Smith", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),)
                  ),
                  ),
                  const SizedBox(height: 90,),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout', arguments: cartProvider.total);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.deepOrangeAccent)
              ),
              child: SizedBox(
                height: 60,
                child: Center(child: Text("Confirm \$${cartProvider.total.toStringAsFixed(2)}", style: TextStyle(color: Colors.white, fontSize: 20),),),
              ),
            ),
          )
        ],
      )
    );
  }
}