import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/add.dart';
import 'package:quircks_task/productData.dart';
import 'package:quircks_task/products.dart';

import '../database/data_model.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductData>(context, listen: false).getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text("Products Lists"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddProducts()));
              },
              icon: Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              child: Center(child: ProductsList()),
            ))
          ],
        ),
      ),
    );
  }
}
