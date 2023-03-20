import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/database/data_model.dart';
import 'package:quircks_task/widgets/toast.dart';

import '../productData.dart';

class EditProduct extends StatefulWidget {
  final Products currentProduct;

  const EditProduct({required this.currentProduct});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  late String prname;
  String? arabicN;
  String? cattogry;
  String? Scattogry;
  String? unitt;
  num? slprice1;
  num? slprice2;
  num? pchsrprice;
  int? opnstock;
  num? reodpnt;
  num? vattP;
  String? barrC ;
  XFile? imagee;
  String? sImage;

  void _editAssociate(context) {
    if (prname == null) {
      toastWidget("Give product name");
      return;
    }
    if (prname.length < 2) {
      toastWidget("Get a longer name ");
      return;
    }

    Provider.of<ProductData>(context, listen: false).editProduct(
        products: Products(
            pdName: prname,
            imageUrl:imagee?.path?? sImage,
            pdNameArb: arabicN,
            category: cattogry,
            subCategory: Scattogry,
            barCode: barrC,
            unit: unitt,
            vatperc: vattP,
            purchacePrice: pchsrprice ,
            salePrice1: slprice1 ,
            salePrice2: slprice2 ,
            reOrderPoint: reodpnt ,
            openingStock: opnstock ),
        productsKey: widget.currentProduct.key);
    Navigator.pop(context);
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pchrpriceController = TextEditingController();
  final TextEditingController _slpprice1Controller = TextEditingController();
  final TextEditingController _slpprice2Controller = TextEditingController();
  final TextEditingController _reodpntController = TextEditingController();
  final TextEditingController _opnstockController = TextEditingController();
  final TextEditingController _arabicN_Controller = TextEditingController();
  final TextEditingController _cattogryController = TextEditingController();
  final TextEditingController _ScattogryController = TextEditingController();
  final TextEditingController _barrCController = TextEditingController();
  final TextEditingController _unittController = TextEditingController();
  final TextEditingController _vattPController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.currentProduct.pdName;
    prname = widget.currentProduct.pdName;

    _pchrpriceController.text = widget.currentProduct.purchacePrice.toString();
    pchsrprice = widget.currentProduct.purchacePrice;

    _slpprice1Controller.text = widget.currentProduct.salePrice1.toString();
    slprice1 = widget.currentProduct.salePrice1;

    _slpprice2Controller.text = widget.currentProduct.salePrice2.toString();
    slprice2 = widget.currentProduct.salePrice2;

    _reodpntController.text = widget.currentProduct.reOrderPoint.toString();
    reodpnt = widget.currentProduct.reOrderPoint;

    _opnstockController.text = widget.currentProduct.openingStock.toString();
    opnstock = widget.currentProduct.openingStock;

    _arabicN_Controller.text = widget.currentProduct.pdNameArb!;
    arabicN = widget.currentProduct.pdNameArb;

    _cattogryController.text = widget.currentProduct.category!;
    cattogry = widget.currentProduct.category;

    _ScattogryController.text = widget.currentProduct.subCategory!;
    Scattogry = widget.currentProduct.subCategory;

    _unittController.text = widget.currentProduct.unit!;
    unitt = widget.currentProduct.unit;

    _barrCController.text = widget.currentProduct.barCode!;
    barrC = widget.currentProduct.barCode;

    _vattPController.text = widget.currentProduct.vatperc.toString();
    vattP = widget.currentProduct.vatperc;
     sImage=widget.currentProduct.imageUrl;
    super.initState();
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
      barrC = barcodeScanRes;
    });
  }

  Future pickImage(ImageSource source ) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() { imagee = image;

      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');

    }

  }







  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 3.0,
        title: Text("Edit Page"),
        actions: [
          IconButton(
            onPressed: () {
              _editAssociate(context);
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
            Card(
                elevation: 3,
                child: Column(children: <Widget>[
                  CircleAvatar(
                      backgroundImage: imagee != null
                          ? Image.file(File(imagee!.path)).image
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
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                onChanged: (v) {
                  setState(() {
                    prname = v;
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
                controller: _arabicN_Controller,
                decoration: InputDecoration(
                  labelText: "Products Name in Arabic",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                onChanged: (v) {
                  setState(() {
                    arabicN = v;
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
                controller: _cattogryController,
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  setState(() {
                    cattogry = v;
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
                controller: _ScattogryController,
                decoration: InputDecoration(
                  labelText: "Sub-Category",
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  setState(() {
                    Scattogry = v;
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
                controller: _unittController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Unit",
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  setState(() {
                    unitt = v;
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
                controller: _slpprice1Controller,
                decoration: InputDecoration(
                  labelText: "Sales Price 1",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                onChanged: (v) {
                  setState(() {
                    slprice1 = int.parse(v);
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
                controller: _slpprice2Controller,
                decoration: InputDecoration(
                  labelText: "Sales Price 2",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                onChanged: (v) {
                  setState(() {
                    slprice2 = int.parse(v);
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
                controller: _pchrpriceController,
                decoration: InputDecoration(
                  labelText: "Purchase Price",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                onChanged: (v) {
                  setState(() {
                    pchsrprice = int.parse(v);
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
                controller: _opnstockController,
                decoration: InputDecoration(
                  labelText: "Opening Stock",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                onChanged: (v) {
                  setState(() {
                    opnstock = int.parse(v);
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
                controller: _vattPController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "VAT%",
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  setState(() {
                    vattP = int.parse(v);
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
                controller: _reodpntController,
                decoration: InputDecoration(
                  labelText: "Re-Order Point",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                onChanged: (v) {
                  setState(() {
                    reodpnt = int.parse(v);
                  });
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),  Card(
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
                    Text(barrC!,
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

            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: MediaQuery.of(context).size.width / 28,
            //   ),
            //   child: TextFormField(initialValue: barrC,
            //     controller:   _barrCController,
            //     keyboardType: TextInputType.number,
            //     decoration: InputDecoration(
            //       labelText: "Bar Code",
            //       border: OutlineInputBorder(),
            //       prefixIcon: Icon(Icons.verified_user_outlined),
            //     ),
            //     onChanged: (v) {
            //       setState(() {
            //         barrC = (v);
            //       });
            //     },
            //   ),
            // ),
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
    _nameController.dispose();
    _pchrpriceController.dispose();
    _slpprice1Controller.dispose();
    _slpprice2Controller.dispose();
    _reodpntController.dispose();
    _opnstockController.dispose();
  }
}
