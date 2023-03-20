import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/productData.dart';
import 'package:quircks_task/widgets/productFields.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:quircks_task/widgets/toast.dart';

import 'database/data_model.dart';
import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  late String name;
    String arbname='';
  String ctgry='';
   String sctgry= '';
  String unt='';
  num? price1;
  num? price2;
  num? pcprice;
  int? oponstock;
  num? reeodpnt;
  num? vatp;
  String _scanBarcode = '';
  XFile? _image;



  void _addAssociate(context) {
    if (name == null) {
      toastWidget("Give product name");
      return;
    }
    if (name.length < 2) {
      toastWidget("Get a longer name ");
      return;
    }

    Provider.of<ProductData>(context, listen: false).addProduct(
      Products(unit: unt,
          barCode: _scanBarcode,
          pdName: name,
          pdNameArb: arbname,
          purchacePrice: pcprice ?? 0,
          category: ctgry,
          subCategory: sctgry,
          salePrice1: price1 ?? 1,
          salePrice2: price2 ?? 1,
          reOrderPoint: reeodpnt ?? 1,
          openingStock: oponstock ?? 0,
          vatperc: vatp,
        imageUrl: _image?.path
      )

    );
    Navigator.pop(context);
  }

  Future<void> barcodeScan() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future pickImage(ImageSource source ) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() { _image = image;

      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');

    }

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
        title: Text("Add Products"),
        actions: [
          IconButton(
            onPressed: () {
              _addAssociate(context);
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
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Card(
              elevation: 3,
              child: Column(children: <Widget>[
                CircleAvatar(
                    backgroundImage: _image != null
                        ? Image.file(File(_image!.path)).image
                        : Image.asset('assets/icons8-city-buildings-48.png').image,
                    radius: 70),
                // Container(height: MediaQuery
                //     .of(context)
                //     .size
                //     .height * 0.2,
                //
                //     child: image != null
                //         ? Image.file(
                //       image!,
                //       height: 340,
                //       width: MediaQuery
                //           .of(context)
                //           .size
                //           .width,
                //     )
                //         : Text("No image selected yet")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          pickImage(ImageSource.camera);
                        },
                        child: Text("Camera")),
                    ElevatedButton(
                        onPressed: () {
                          pickImage(ImageSource.gallery);
                        },
                        child: Text("Gallery"))
                  ],
                )
              ])),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 28,
            ),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  name = v;
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
                labelText: "Products Name in Arabic",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  arbname = v;
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
                labelText: "Category",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                setState(() {
                  ctgry = v;
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
                labelText: "Sub-Category",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                setState(() {
                  sctgry = v;
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
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Unit",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                setState(() {
                  unt = v;
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
              keyboardType: TextInputType.number,initialValue: "1",
              decoration: InputDecoration(
                labelText: "Sales Price 1",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  price1 = int.parse(v);
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
              keyboardType: TextInputType.number,initialValue: '1',
              decoration: InputDecoration(
                labelText: "Sales Price 2",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  price2 = int.parse(v);
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
              keyboardType: TextInputType.number,initialValue: "0",
              decoration: InputDecoration(
                labelText: "Purchase Price",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  pcprice = int.parse(v);
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
              keyboardType: TextInputType.number,initialValue: "0",
              decoration: InputDecoration(
                labelText: "Opening Stock",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  oponstock = int.parse(v);
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "VAT%",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                setState(() {
                  vatp = int.parse(v);
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
              keyboardType: TextInputType.number,initialValue: "1",
              decoration: InputDecoration(
                labelText: "Re-Order Point",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  reeodpnt = int.parse(v);
                });
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Card(
            elevation: 3,
            child: Container(
                child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Barcode",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Image(
                    image: AssetImage("assets/barcode (3).png"),
                  ),
                  TextButton(
                      onPressed: () => barcodeScan(),
                      child: Text(
                        "Scan Code",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const Image(
                image: AssetImage("assets/business.png"),
                height: 150,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.001,
              ),
              Text(_scanBarcode,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              )
            ])),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 28,
            ),
            child: TextFormField(initialValue: _scanBarcode,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Bar Code",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_outlined),
              ),
              onChanged: (v) {
                setState(() {
                  _scanBarcode = (v);
                });
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          )],
      )),
    );

 }
}
