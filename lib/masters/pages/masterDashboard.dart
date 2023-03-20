import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/masters/pages/customerList.dart';
import 'package:quircks_task/masters/widgets/customerData.dart';


class MasterDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Master DashBoard"),
      ),
   body: ListView(children: [SizedBox(height: 25,),
     Column(
       children: [

         GridView.count(
           shrinkWrap: true,
           crossAxisCount: 2,
           childAspectRatio: (4 / 2.6),
           crossAxisSpacing: 5,
           mainAxisSpacing: 15,
           //physics:BouncingScrollPhysics(),
           padding: EdgeInsets.all(10.0),
           children: [
             GestureDetector( onTap: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => CustomerList()));},
               child: Container(
                 width: 30,
                 height: 30,
                 child: Card(elevation: 3,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset("assets/Masters/man (1).png"),
                       Text(
                         "Customers",
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
                     Image.asset("assets/icons8-return-48.png"),
                     Text(
                       "Suppliers",
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
                       Image.asset(
                         "assets/3d-illustration-delivery-cart-product-box_106547-129.jpeg",
                         width: 63,
                         height: 63,
                       ),
                       Text(
                         "Category",
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
                     Image.asset("assets/icons8-expert-64.png"),
                     Text(
                       "Sub Category",
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
                     Image.asset("assets/icons8-purchase-58.png"),
                     Text(
                       "Unit",
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
                       "Sales Man",
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
                       "Firm Data",
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
                       "Printer",
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
   ]) );
  }
}
