import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quircks_task/database/data_model.dart';



class CustomerData extends ChangeNotifier {
  static const String _boxname = "customerBox";
  List<Customers> _customers = [];


  void getCustomers() async {
    var box = await Hive.openBox<Customers>(_boxname);
    _customers = box.values.toList();
    notifyListeners();
  }

  Customers getCustomer(index) {
    return _customers[index];
  }

  void addCustomer(Customers customer) async {
    var box = await Hive.openBox<Customers>(_boxname);

    await box.add(customer);
    _customers = box.values.toList();
    notifyListeners();
  }

  void deleteCustomer(key) async {
    var box = await Hive.openBox<Customers>(_boxname);

    await box.delete(key);
    _customers = box.values.toList();
    notifyListeners();
  }

  void editCustomer({required Customers customer, required int customerKey}) async {
    var box = await Hive.openBox<Customers>(_boxname);

    await box.put(customerKey,customer);
    _customers = box.values.toList();
    notifyListeners();
  }


  int get customerCount{
    return _customers.length;
  }
}
