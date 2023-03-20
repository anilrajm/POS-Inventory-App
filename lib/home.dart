import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/masters/pages/masterDashboard.dart';
import 'package:quircks_task/pages/productList.dart';
import 'package:quircks_task/productData.dart';
import 'package:quircks_task/products.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductData>(context, listen: false).getProducts();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.lightGreen,
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: "Account")
        ],
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Home"),
        actions: [
          Icon(Icons.search_rounded),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: 80,
              width: 230,
              child: Image.asset(
                  "assets/WhatsApp Image 2022-11-30 at 2.52.41 PM.jpeg"),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: (4 / 2.6),
              crossAxisSpacing: 5,
              mainAxisSpacing: 4,
              //physics:BouncingScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-total-sales-48.png"),
                        Text(
                          "Sales",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-return-48.png"),
                        Text(
                          "Sales Return",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductList()));
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Card(elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/3d-illustration-delivery-cart-product-box_106547-129.jpeg",
                            width: 63,
                            height: 63,
                          ),
                          Text(
                            "Products",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector( onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MasterDash()));
                },
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Card(elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons8-expert-64.png"),
                          Text(
                            "Masters",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-purchase-58.png"),
                        Text(
                          "Purchase",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-u-turn-to-left-40.png"),
                        Text(
                          "Purchase Return",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-quotation-64.png"),
                        Text(
                          "Quotation",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-note-48.png"),
                        Text(
                          "Delivery Note",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-brand-vouchers-58.png"),
                        Text(
                          "Vouchers",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Card(elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons8-documents-64.png"),
                        Text(
                          "Parameters",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
