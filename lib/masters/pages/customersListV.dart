import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/add.dart';
import 'package:quircks_task/masters/widgets/customerData.dart';
import 'package:quircks_task/productData.dart';
import 'package:quircks_task/widgets/productsTile.dart';

import '../widgets/customersTile.dart';

class CustomersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) { Provider.of<CustomerData>(context, listen: false).getCustomers();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CustomerTile(tileIndex: index);
        },
        itemCount: Provider.of<CustomerData>(context).customerCount,
        padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
      ),
    );
  }
}
