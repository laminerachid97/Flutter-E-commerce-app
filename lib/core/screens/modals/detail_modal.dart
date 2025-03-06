import 'package:animations/core/helpers/exists_check.dart';
import 'package:animations/core/helpers/helper_color.dart';
import 'package:animations/core/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftModalScreen extends StatefulWidget {
  const LeftModalScreen({super.key,required this.name});

  final dynamic name;

  @override
  State<LeftModalScreen> createState() => _LeftModalScreen();
}

class _LeftModalScreen extends State<LeftModalScreen> {
  
  double _width = 0;
  double _height = 0;
  double _left = -100;
  double _leftName = -200;
  double _opacity = 0;
  double _heartRight = -200;
  double _cartTop = -100;
  String _colorPicked = '';
  String _pickedSize = '';
  int Qte = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _width = MediaQuery.of(context).size.width;
          _height = 400;
        });
      }
    });
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _cartTop = 40;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _heartRight = 30;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _left = MediaQuery.of(context).size.width - 100;
        });
      }
    });
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _leftName = 20;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 2100), () {
      if (mounted) {
        setState(() {
          _opacity = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);

    final exist = checkIfIdExists(widget.name["id"], cartProvider.cart);
    print(exist);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: (widget.name is String) ? ShowString(data: widget.name)
      : SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                // color: Colors.black,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _width,
                  height: _height,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          widget.name["image"],
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 600),
                        right: 20,
                        top: _cartTop,
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/cart'),
                            child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: Image.asset(
                                  "assets/icons/shopping.png",
                                  fit: BoxFit.cover,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 5,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                  ),
                                  child: Center(
                                    child: Text(cartProvider.cart.length.toString(), style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 600),
                        right: _heartRight,
                        bottom: 30,
                        child: Icon(widget.name["liked"] ? Icons.favorite : null,size: 40,color: Colors.red,),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: 100
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 226, 193, 191),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.elasticOut,
                            top: 20,
                            left: _left,
                            child: Text("\$${widget.name["oldprice"]}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red, decoration: TextDecoration.lineThrough, decorationColor: Colors.red, decorationThickness: 2),),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.elasticOut,
                            top: 40,
                            left: _left,
                            child: Text("\$${widget.name["newprice"]}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.elasticOut,
                            top: 20,
                            left: _leftName,
                            child: Text("${widget.name["name"]}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ]
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: _opacity,
                      child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          child: Text(
                          widget.name["description"],
                          style: TextStyle(
                            color: Colors.black38
                          ),
                        ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      opacity: _opacity,
                      child: SizedBox(
                        height: 70,
                        width: screenWidth,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 10), child: Text("material", style: TextStyle(fontSize: 19, color: Colors.black),),),
                            Padding(padding: EdgeInsets.only(left: 10), child: Text(widget.name["material"], style: TextStyle(fontSize: 15, color: Colors.black54),),),
                            
                          ],
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      opacity: _opacity,
                      child: SizedBox(
                        height: 70,
                        width: screenWidth,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 10), child: Text("Colors Available", style: TextStyle(fontSize: 19, color: Colors.black),),),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: (widget.name["colors"] as List<String>).map((color) => (
                                GestureDetector(
                                onTap: () {
                                  print(color);
                                  setState(() {
                                    _colorPicked = color;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: getColorFromString(color),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        child: Icon((color == _colorPicked) ? Icons.check : null, size: 30,color: Colors.white,),
                                      )
                                    ],
                                  ),
                                ),
                                )
                              )).toList(),
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: _opacity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 10), child: Text("Sizes Available", style: TextStyle(fontSize: 19, color: Colors.black),),),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: (widget.name["sizes"] as List<String>).map((size) =>(
                                GestureDetector(
                                  onTap: () {
                                    print(size);
                                    setState(() {
                                      _pickedSize = size;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                      color: (_pickedSize.isNotEmpty && _pickedSize == size) ? Colors.black : null
                                    ),
                                    child: Text(size, style: TextStyle(color : (_pickedSize.isNotEmpty && _pickedSize == size) ? Colors.white : null),),
                                  ),
                                )
                              )).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: _opacity,
                      child: SizedBox(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Padding(padding: EdgeInsets.only(left: 10), child: Text("Quantite ", style: TextStyle(fontSize: 19, color: Colors.black),),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if(!(Qte <= 0)) {
                                          Qte--;
                                        }
                                      });
                                    }, 
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(Colors.grey),
                                    ),
                                    icon: Icon(Icons.remove)
                                  ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(Qte.toString(), style: TextStyle(fontSize: 25),),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Qte++;
                                    });
                                  }, 
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(Colors.grey),
                                  ),
                                  icon: Icon(Icons.add)
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: _opacity,
                      child: SizedBox(
                        height: 60,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            final Map<String, dynamic> product = {
                              "id": widget.name["id"],
                              "name": widget.name["name"],
                              "image": widget.name["image"],
                              "description": widget.name["description"],
                              "category": widget.name["category"],
                              "material": widget.name["material"],
                              "newprice": widget.name["newprice"],
                              "size" : _pickedSize,
                              "color" : _colorPicked,
                              "qte" : Qte,
                              "total" : Qte * widget.name["newprice"],
                            };

                            cartProvider.addToCart(product);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(exist ? Colors.grey :Colors.deepOrangeAccent),

                          ),
                          child: Text(exist ? "Check Your Cart" : "Add To Cart", style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}

class ShowString extends StatelessWidget {
  const ShowString({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: Text(data),),),
    );
  }
}

// child: (name is String) ? Text("This is a left sliding modal! $name") : Text("This is a left sliding modal! ${name["name"].toString()}"),