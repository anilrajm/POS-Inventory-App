import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/masters/pages/addCustomer.dart';
import 'package:quircks_task/masters/widgets/customerData.dart';

import 'customersListV.dart';



class CustomerList extends StatelessWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { Provider.of<CustomerData>(context, listen: false).getCustomers();
    return   Scaffold(
      appBar: AppBar(
        title: Text("Customer List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCustomers()));
              },
              icon: Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  child: CustomersList(),
                ))
          ],
        ),
      ),
    );
  }
}
