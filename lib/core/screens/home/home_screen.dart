import 'package:animations/core/helpers/open_modal_helper.dart';
import 'package:animations/core/helpers/dump_data.dart';
import 'package:animations/core/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _cartLength = 0;

  dynamic _myCart;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 50),
              // ++++++++++++++ Header (Profile Pic and Cart Shopping)
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/images/profile.png",
                          fit: BoxFit.fill,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(child: Text("NOVASHOP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                              child: Image.asset(
                                "assets/icons/shopping.png",
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
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
                    
                  ],
                ),
              ),
              // END +++++++++++++ Header (Profile Pic and Cart Shopping)
              // TITTLE ==================
              Container(
                padding: EdgeInsets.only(top: 25),
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20), child: Text("Fashion Shop", style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.bold,),),),
                    Padding(padding: EdgeInsets.only(left: 20), child: Text("Get Popular Fashion from Home", style: TextStyle(color: Colors.black45,fontSize: 18, fontWeight: FontWeight.bold,),),),
                    SizedBox(height: 20,),
                    SizedBox(
                      child: Stack(
                        children : [
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for Clothes you like",
                            fillColor: Colors.white60,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black, width: 2)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black, width: 1)
                            )
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 5,
                        child: IconButton(
                          onPressed: () => print(cartProvider.cart),
                          icon : Image.network("https://img.icons8.com/?size=90&id=p8VkXMjDOpcE&format=png&color=000000", width: 30,height: 30,)
                        ),
                      )
                      ]
                      ),
                    )
                  ],
                ),
              ),
              // END OF TITTLE =====================
              // CATEGORIES LINE ===================
              const SizedBox(height: 20,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20), child: Text("Categories", style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.bold,),),),
                    Padding(padding: EdgeInsets.only(right: 10), child: Text("See All", style: TextStyle(decoration: TextDecoration.underline, decorationColor: Colors.red,decorationThickness: 2,color: Colors.red,fontSize: 14, fontWeight: FontWeight.bold,),),),
                  ],
                ),
              ),
              // END => CATEGORIES LINE ===================
              // SCROLLS FOR CATEGORIES
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: types.asMap().entries.map((entry){
                      int index = entry.key;
                      String type = entry.value;

                      return Container(
                        width: 160,
                        height: 160,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                        ),
                        child: GestureDetector(
                          onTap: () => openLeftModal(context, type),
                          child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                icons[index],
                                fit: BoxFit.cover,
                              ),
                              Text(type, style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // END ----------- SCROLLS FOR CATEGORIES
              // POPULAR FASHION ---- TITTLE
              const SizedBox(height: 10,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20), child: Text("Popular Fashion", style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.bold,),),),
                    Padding(padding: EdgeInsets.only(right: 10), child: Text("See All", style: TextStyle(decoration: TextDecoration.underline, decorationColor: Colors.red,decorationThickness: 2,color: Colors.red,fontSize: 14, fontWeight: FontWeight.bold,),),),
                  ],
                ),
              ),
              // END ----- POPULAR FASHION ---- TITTLE
              // POPULAR FASHION SECTION ---- START -------------
              SizedBox(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7
                  ),
                  itemCount: popularFashion.length,
                  itemBuilder: (context, index) {
                    String brand = popularFashion.keys.elementAt(index);
                    var item = popularFashion[brand]!;

                    return GestureDetector(
                      onTap: () => openLeftModal(context, item),
                      child: Stack(
                      children: [
                        Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  item["image"],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(item["name"], style: TextStyle(color: Colors.grey, fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\$${item["oldprice"]}",
                                        style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 14,
                                          color: Colors.red,
                                          decorationColor: Colors.red,
                                          decorationThickness: 2
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "\$${item["newprice"]}",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.favorite,
                          color: item["liked"] ? Colors.red : Colors.white,
                        ),
                      )
                    ],
                    ),
                    );
                  },
                ),
              )
              // POPULAR FASHION SECTION ---- END -------------
            ],
          ),
        ),
      ),
    );
  }
}
