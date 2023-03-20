import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/database/data_model.dart';
import 'package:quircks_task/masters/widgets/customerData.dart';

import '../pages/editCustomer.dart';



class CustomerTile extends StatelessWidget {
  final int tileIndex;

  const CustomerTile({Key? key, required this.tileIndex} );

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerData>(
      builder: (context, customerData, child) {
        Customers currentCustomer = customerData.getCustomer(tileIndex);
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Card(elevation: 3,
            child: ListTile(
              title: Text(
                currentCustomer.CustomerName ?? "",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(currentCustomer.OpnBal.toString() ?? "",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
              onTap: (){ Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditCustomer(currentCustomer:currentCustomer)));
              },          ),
          ),
        );
      },
    );
  }
}
