import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/database/data_model.dart';

import '../pages/editProducts.dart';
import '../productData.dart';

class ProductTile extends StatelessWidget {
  final int tileIndex;

  const ProductTile({Key? key, required this.tileIndex} );

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(
      builder: (context, productData, child) {
        Products currentProduct = productData.getProduct(tileIndex);
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Card(elevation: 3,
            child: ListTile(
              leading:    CircleAvatar(
                  backgroundImage:
                       Image.file(File(currentProduct.imageUrl.toString())).image
                      ,
                  radius: 45),
              title: Text(
                currentProduct.pdName ?? "",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(currentProduct.salePrice1.toString() ?? "",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
onTap: (){ Navigator.push(context,
    MaterialPageRoute(builder: (context) => EditProduct(currentProduct:currentProduct)));
},          ),
          ),
        );
      },
    );
  }
}
