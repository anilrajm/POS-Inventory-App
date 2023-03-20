import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/database/data_model.dart';
import 'package:quircks_task/masters/widgets/customerData.dart';
import 'package:quircks_task/widgets/toast.dart';



class EditCustomer extends StatefulWidget {
  final Customers currentCustomer;

  const EditCustomer({required this.currentCustomer});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  late String customerNamE;
  String? customerNameArB;
  String? streeT;
  String? streetArB;
  String? buildingNO;
  String? buildingNoArB;
  String? addNO;
  String? addNoArB;
  String? citY;
  String? cityArB;
  String? statE;
  String? stateArB;
  String? countrY;
  String? countryArB;
  String? zipCodE;
  String? zipCodeArB;
  String? contactNO;
  String? contactNoArB;
  String? emaiL;
  String? tinNO;
  String? tinNoArB;
  String? crN;
  String?crnArB;
  String? opnBaL;
  String? payTypE;
  String? remarkS;

  void _editCustomer(context) {
    if (customerNamE == null) {
      toastWidget("Give product name");
      return;
    }

    if (customerNamE.length < 2) {
      toastWidget("Get a longer name ");
      return;
    }

    Provider.of<CustomerData>(context, listen: false).editCustomer(
        customer: Customers(
            CustomerName:customerNamE,
            CustomerNameArb: customerNameArB,
            Street: streeT,
            StreetArb: streetArB,
            BuildingNo: buildingNO,
            BuildingNoArb: buildingNoArB,
            ADDNo: addNO,
            ADDNoArb: addNoArB,
            City: citY,
            CityArb: cityArB,
            State: statE,
            StateArb: stateArB,
            Country: countrY,
            CountryArb: countryArB,
            ZipCode: zipCodE,
            ZipCodeArb: zipCodeArB,
            ContactNo: contactNO,
            Email: emaiL,
            TINNo: tinNO,
            TINNoArb: tinNoArB,
            CRN: crN,
            CRNArb: crnArB,
            OpnBal: opnBaL,
            PayType: payTypE,
            Remarks: remarkS,
            ContactNoArb: contactNoArB),
        customerKey: widget.currentCustomer.key);
    Navigator.pop(context);
  }

  final TextEditingController _CustomerNameController       = TextEditingController();
  final TextEditingController _CustomerNameArbController   = TextEditingController();
  final TextEditingController _StreetController             = TextEditingController();
  final TextEditingController _StreetArbController         = TextEditingController();
  final TextEditingController _BuildingNoController        = TextEditingController();
  final TextEditingController _BuildingNoArbController     = TextEditingController();
  final TextEditingController _ADDNoController                = TextEditingController();
  final TextEditingController _ADDNoArbController           = TextEditingController();
  final TextEditingController _CityController                = TextEditingController();
  final TextEditingController _CityArbController           = TextEditingController();
  final TextEditingController _StateController                = TextEditingController();
  final TextEditingController _StateArbController              = TextEditingController();
  final TextEditingController _CountryController            =      TextEditingController();
  final TextEditingController _CountryArbController                = TextEditingController();
  final TextEditingController _ZipCodeController              = TextEditingController();
  final TextEditingController _ZipCodeArbController               = TextEditingController();
  final TextEditingController _ContactNoController           = TextEditingController();
  final TextEditingController _ContactNoArbController            = TextEditingController();
  final TextEditingController _EmailController              = TextEditingController();
  final TextEditingController _TINNoController              = TextEditingController();
  final TextEditingController _TINNoArbController              = TextEditingController();
  final TextEditingController _CRNController               = TextEditingController();
  final TextEditingController _CRNArbController                     = TextEditingController();
  final TextEditingController _OpnBalController                 = TextEditingController();
  final TextEditingController _PayTypeController                     = TextEditingController();
  final TextEditingController _RemarksController                  = TextEditingController();


  @override
  void initState() {
    _CustomerNameController.text = widget.currentCustomer.CustomerName!;
    customerNamE = widget.currentCustomer.CustomerName!;

    _CustomerNameArbController.text = widget.currentCustomer.CustomerNameArb!;
    customerNameArB = widget.currentCustomer.CustomerNameArb;

    _StreetController.text = widget.currentCustomer.Street!;
    streeT = widget.currentCustomer.Street;

    _StreetArbController.text = widget.currentCustomer.StreetArb!;
    streetArB = widget.currentCustomer.StreetArb;

    _BuildingNoController.text = widget.currentCustomer.BuildingNo!;
    buildingNO = widget.currentCustomer.BuildingNo;

    _BuildingNoArbController.text = widget.currentCustomer.BuildingNoArb!;
    buildingNoArB = widget.currentCustomer.BuildingNoArb;

    _ADDNoController.text = widget.currentCustomer.ADDNo!;
    addNO = widget.currentCustomer.ADDNo;

    _ADDNoArbController.text = widget.currentCustomer.ADDNoArb!;
    addNoArB = widget.currentCustomer.ADDNoArb;

    _CityController.text = widget.currentCustomer.City!;
    citY = widget.currentCustomer.City;

    _CityArbController.text = widget.currentCustomer.CityArb!;
    cityArB = widget.currentCustomer.CityArb;

    _StateController.text = widget.currentCustomer.State!;
    statE = widget.currentCustomer.State;

    _StateArbController.text = widget.currentCustomer.StateArb!;
    stateArB = widget.currentCustomer.StateArb;

    _CountryController.text = widget.currentCustomer.Country!;
    countrY = widget.currentCustomer.Country;

    _CountryArbController.text = widget.currentCustomer.CountryArb!;
    countryArB = widget.currentCustomer.CountryArb;

    _ZipCodeController.text = widget.currentCustomer.CustomerNameArb!;
    zipCodE = widget.currentCustomer.CustomerNameArb;

    _ZipCodeArbController.text = widget.currentCustomer.ZipCode!;
    zipCodeArB = widget.currentCustomer.ZipCode;

    _ContactNoController.text = widget.currentCustomer.ContactNo!;
    contactNO = widget.currentCustomer.ContactNo;

    _ContactNoArbController.text = widget.currentCustomer.ContactNoArb!;
    contactNoArB = widget.currentCustomer.ContactNoArb;

    _EmailController.text = widget.currentCustomer.Email!;
    emaiL = widget.currentCustomer.Email;

    _TINNoController.text = widget.currentCustomer.TINNo!;
    tinNO = widget.currentCustomer.TINNo;

    _TINNoArbController.text = widget.currentCustomer.TINNoArb!;
    tinNoArB = widget.currentCustomer.TINNoArb;

    _CRNController.text = widget.currentCustomer.CRN!;
    crN = widget.currentCustomer.CRN;

    _OpnBalController.text = widget.currentCustomer.OpnBal!;
    opnBaL = widget.currentCustomer.OpnBal;

    _PayTypeController.text = widget.currentCustomer.PayType!;
    payTypE = widget.currentCustomer.PayType;

    _RemarksController.text = widget.currentCustomer.Remarks!;
    remarkS = widget.currentCustomer.Remarks;

    _CRNArbController.text = widget.currentCustomer.CRNArb!;
    crnArB = widget.currentCustomer.CRNArb
    ;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 3.0,
        title: Text("Customer Edit Page"),
        actions: [
          IconButton(
            onPressed: () {
              _editCustomer(context);
            },
            icon: Icon(Icons.save),
            iconSize: 24,
            color: Colors.white,
            tooltip: "save",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 28,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.name,controller: _CustomerNameController,
                    decoration: InputDecoration(
                      labelText: "Customer Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        customerNamE = v;
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
                  child: TextFormField(controller: _CustomerNameArbController,
                    decoration: InputDecoration(
                      labelText: "Customer Name in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        customerNameArB = v;
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
                  child: TextFormField(controller: _StreetController,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user_outlined),
                      labelText: "Street",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) {
                      setState(() {
                        streeT = v;
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
                  child: TextFormField(controller: _StreetArbController,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user_outlined),
                      labelText: "Street in Arabic",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) {
                      setState(() {
                        streetArB = v;
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
                  child: TextFormField(controller: _BuildingNoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Building No",prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) {
                      setState(() {
                        buildingNO = v;
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
                  child: TextFormField(controller: _BuildingNoArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: " Building No in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        buildingNoArB = v;
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
                  child: TextFormField(controller: _ADDNoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Add No",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        addNO =  v;
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
                  child: TextFormField(controller: _ADDNoArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "ADD No in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        addNoArB = v;
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
                  child: TextFormField(controller: _CityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) {
                      setState(() {
                        citY = v;
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
                  child: TextFormField(controller: _CityArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "City in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        cityArB = v;
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
                  child: TextFormField(controller: _StateController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "State",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        statE = v;
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
                  child: TextFormField(controller: _StreetArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "State in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        stateArB = v;
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
                  child: TextFormField(controller: _CountryController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Country",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        countrY = v;
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
                  child: TextFormField(controller: _CountryArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Country in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        countryArB = v;
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
                  child: TextFormField(controller: _ZipCodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Zip Code",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        zipCodE = v;
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
                  child: TextFormField(controller: _ZipCodeArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Zip Code in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        zipCodeArB = v;
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
                  child: TextFormField(controller: _ContactNoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Contact No",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        contactNO = v;
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
                  child: TextFormField(controller: _ContactNoArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Contact No in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        contactNoArB = v;
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
                  child: TextFormField(controller: _EmailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        emaiL= v;
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
                  child: TextFormField(controller: _TINNoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "TIN No",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        tinNO = v;
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
                  child: TextFormField(controller: _TINNoArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "TIN No in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        tinNoArB = v;
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
                  child: TextFormField(controller: _CRNController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "CRN",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        crN = v;
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
                  child: TextFormField(controller: _CRNArbController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "CRN in Arabic",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        crnArB = v;
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
                  child: TextFormField(controller: _OpnBalController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Opening Balance ",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        opnBaL = v;
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
                  child: TextFormField(controller: _PayTypeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Pay Type",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        payTypE= v;
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
                  child: TextFormField(controller: _RemarksController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Remarks",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    onChanged: (v) {
                      setState(() {
                        remarkS = v;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                )
              ],
            )),
      ),
    );
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _CustomerNameController.dispose();
    _CustomerNameArbController.dispose();
    _StreetController.dispose();
    _StreetArbController.dispose();
    _BuildingNoController.dispose();
    _BuildingNoArbController.dispose();
    _ADDNoController.dispose();
    _ADDNoArbController.dispose();
    _CityController.dispose();
    _CityArbController.dispose();
    _StateController.dispose();
    _StateArbController.dispose();
    _CountryController.dispose();
    _CountryArbController.dispose();
    _ZipCodeController.dispose();
    _ZipCodeArbController.dispose();
    _ContactNoController.dispose();
    _ContactNoArbController.dispose();
    _EmailController.dispose();
    _TINNoController.dispose();
    _TINNoArbController.dispose();
    _CRNController.dispose();
    _CRNArbController.dispose();
    _OpnBalController.dispose();
    _PayTypeController.dispose();
    _RemarksController .dispose();
  }
}
