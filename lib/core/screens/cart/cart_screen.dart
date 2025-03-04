import 'package:animations/core/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowCart extends StatefulWidget {
  const ShowCart({super.key});

  @override
  State<ShowCart> createState() => _ShowCart();
}

class _ShowCart extends State<ShowCart> {
  double _total = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.blue[50],
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Container(
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(4, 4)
                        )
                      ]
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('My Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  cartProvider.cart.isEmpty ? SizedBox(
                    height: screenHeight - 200,
                    child: Center(child: Text("No products in your Cart yet", style: TextStyle(color: Colors.black54, fontSize: 20,),),),
                  )
                  : SizedBox(
                    child: Column(
                      children: cartProvider.cart.map((product) {
                        _total += product["total"];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(4, 4)
                              )
                            ]
                          ),
                          height: 120,
                          width: screenWidth,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 100,
                                height: 120,
                                child: Image.asset(product["image"] as String),
                              ),
                              Expanded(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(product["name"] as String, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                      SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cartProvider.removeFromCart(product);
                                              _total -= product["total"];
                                            });
                                          },
                                          child: Icon(Icons.delete, size: 30,),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  SizedBox(
                                    // decoration: BoxDecoration(border: Border.all()),
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Color: ${product["color"] as String}", style: TextStyle(fontSize: 14),),
                                        Text("Size: ${product["size"] as String}", style: TextStyle(fontSize: 14),),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text('Quantite: ${(product["qte"] as int).toString()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text('\$${(product["total"] as double).toString()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),),
                                        ),
                                        ),
                                      ),
                                      
                                    ],
                                  )
                                ],
                              ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

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
                child: Center(child: Text("Checkout \$${cartProvider.total.toStringAsFixed(2)}", style: TextStyle(color: Colors.white, fontSize: 20),),),
              ),
            ),
          )
        ],
      ),
    );
  }
}