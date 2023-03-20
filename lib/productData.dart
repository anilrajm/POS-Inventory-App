import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'database/data_model.dart';

class ProductData extends ChangeNotifier {
  static const String _boxname = "productBox";
  List<Products> _products = [];


  void getProducts() async {
    var box = await Hive.openBox<Products>(_boxname);
    _products = box.values.toList();
    notifyListeners();
  }

  Products getProduct(index) {
    return _products[index];
  }

  void addProduct(Products products) async {
    var box = await Hive.openBox<Products>(_boxname);

    await box.add(products);
    _products = box.values.toList();
    notifyListeners();
  }

  void deleteProduct(key) async {
    var box = await Hive.openBox<Products>(_boxname);

    await box.delete(key);
    _products = box.values.toList();
    notifyListeners();
  }

  void editProduct({required Products products, required int productsKey}) async {
    var box = await Hive.openBox<Products>(_boxname);

    await box.put(productsKey,products);
    _products = box.values.toList();
    notifyListeners();
  }


  int get productCount{
    return _products.length;
  }
}
