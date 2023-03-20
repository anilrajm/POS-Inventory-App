import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/add.dart';
import 'package:quircks_task/productData.dart';
import 'package:quircks_task/widgets/productsTile.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ProductTile(tileIndex: index);
        },
        itemCount: Provider.of<ProductData>(context).productCount,
        padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
      ),
    );
  }
}
