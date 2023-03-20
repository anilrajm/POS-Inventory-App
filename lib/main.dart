import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/login.dart';
import 'package:quircks_task/masters/pages/masterDashboard.dart';
import 'package:quircks_task/masters/widgets/customerData.dart';
import 'package:quircks_task/pages/productList.dart';
import 'package:quircks_task/productData.dart';

import 'database/data_model.dart';
import 'masters/pages/customerList.dart';

void main() {WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ProductsAdapter());
  Hive.registerAdapter(CustomersAdapter());
  runApp(ProductApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class ProductApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  return MultiProvider(child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'HappyPOS',
    theme: ThemeData(primaryColor: Colors.lightGreenAccent),
    initialRoute: "/",
    routes: {
      "/": (context) => FutureBuilder(
          future: _initHive(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                print(snapshot.error);
                return Scaffold(
                  body: Center(
                    child: Text("Error establishing connection to hive"),
                  ),
                );
              } else {
                return Login();
              }
            } else
              return Scaffold();
          }),
      "/AddAssociatePage": (context) => Login()
    },
  ),
    providers: [ChangeNotifierProvider<ProductData>(
      create: (context) => ProductData(),
    ),ChangeNotifierProvider<CustomerData>(create: (context)=>CustomerData(),
    child: CustomerList(),)],

  );
  }
}