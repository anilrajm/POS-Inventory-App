
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/masters/widgets/customerData.dart';

import 'package:quircks_task/widgets/toast.dart';

import 'package:quircks_task/database/data_model.dart';

class AddCustomers extends StatefulWidget {
  @override
  State<AddCustomers> createState() => _AddCustomersState();
}

class _AddCustomersState extends State<AddCustomers> {
  late String customerName;
  String customerNameArb='';
  String street='';
  String streetArb= '';
  String buildingNo='';
  String buildingNoArb='';
  String addNo='';
  String addNoArb= '';
  String city='';
  String cityArb='';
  String state='';
  String stateArb= '';
  String country='';
  String countryArb='';
  String zipCode='';
  String zipCodeArb= '';
  String contactNo='';
  String contactNoArb='';
  String email='';
  String tinNo='';
  String tinNoArb= '';
  String crn='';
  String crnArb='';
  String opnBal='';
  String payType= '';
  String remarks='';


  void _addCustomer(context) {
    if (customerName == null) {
      toastWidget("Give product name");
      return;
    }
    if (customerName.length < 2) {
      toastWidget("Get a longer name ");
      return;
    }

    Provider.of<CustomerData>(context, listen: false).addCustomer(
        Customers(
          CustomerName:customerName,
          CustomerNameArb: customerNameArb,
          Street: street,
          StreetArb: streetArb,
          BuildingNo: buildingNo,
          BuildingNoArb: buildingNoArb,
          ADDNo: addNo,
          ADDNoArb: addNoArb,
          City: city,
          CityArb: cityArb,
          State: state,
          StateArb: stateArb,
          Country: country,
          CountryArb: countryArb,
          ZipCode: zipCode,
          ZipCodeArb: zipCodeArb,
          ContactNo: contactNo,
          Email: email,
          TINNo: tinNo,
          TINNoArb: tinNoArb,
          CRN: crn,
          CRNArb: crnArb,
          OpnBal: opnBal,
          PayType: payType,
          Remarks: remarks,
            ContactNoArb: contactNoArb
        )

    );
    Navigator.pop(context);
  }




  @override
  Widget build(BuildContext context) {
    Widget divider = SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 3.0,
        title: Text("Add Customer"),
        actions: [
          IconButton(
            onPressed: () {
              _addCustomer(context);
            },
            icon: Icon(Icons.save),
            iconSize: 24,
            color: Colors.white,
            tooltip: "save",
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Customer Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      customerName = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Customer Name in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      customerNameArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user_outlined),
                    labelText: "Street",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    setState(() {
                      street = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user_outlined),
                    labelText: "Street in Arabic",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    setState(() {
                      streetArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Building No",prefixIcon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    setState(() {
                      buildingNo = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: " Building No in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      buildingNoArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Add No",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      addNo =  v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "ADD No in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      addNoArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    setState(() {
                      city = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "City in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      cityArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "State",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      state = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "State in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      stateArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Country",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      country = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Country in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      countryArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Zip Code",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      zipCode = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Zip Code in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      zipCodeArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Contact No",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      contactNo = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Contact No in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      contactNoArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      email = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "TIN No",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      tinNo = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "TIN No in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      tinNoArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "CRN",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      crn = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "CRN in Arabic",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      crnArb = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Opening Balance ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      opnBal = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Pay Type",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      payType = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Remarks",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_outlined),
                  ),
                  onChanged: (v) {
                    setState(() {
                      remarks = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),],
          )),
    );

  }
}
