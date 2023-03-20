

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId:0)
class Products extends HiveObject{
  @HiveField(0)
  final String pdName;
  @HiveField(1)
  final String? pdNameArb;
  @HiveField (2)
  final String? category;
  @HiveField(3)
  final String? subCategory;
  @HiveField(4)
  final String? unit;
  @HiveField(5)
  final num?  salePrice1;
  @HiveField (6)
  final num? salePrice2;
  @HiveField(7)
  final num? purchacePrice;
  @HiveField(8)
  final int? openingStock;
  @HiveField(9)
  final num? vatperc;
  @HiveField (10)
  final num? reOrderPoint;
  @HiveField (11)
  final String? barCode;
  @HiveField (12)
  String? imageUrl;


  Products(
      {required this.pdName,  this.pdNameArb, this.category,  this.subCategory,  this.openingStock,   this.purchacePrice
      , this.unit, this.reOrderPoint ,this.salePrice1,  this.salePrice2,this.vatperc,
        this.barCode,this.imageUrl}
      );
}

@HiveType(typeId:1)
class Customers extends HiveObject {

  @HiveField (1)
  String? CustomerName;
  @HiveField (2)
  String? CustomerNameArb;
  @HiveField (3)
  String? Street;
  @HiveField (4)
  String? StreetArb;
  @HiveField (5)
  String? BuildingNo;
  @HiveField (6)
  String? BuildingNoArb;
  @HiveField (7)
  String? ADDNo;
  @HiveField (8)
  String? ADDNoArb;
  @HiveField (9)
  String? City;
  @HiveField (10)
  String? CityArb;
  @HiveField (11)
  String? State;
  @HiveField (12)
  String? StateArb;
  @HiveField (13)
  String? Country;
  @HiveField (14)
  String? CountryArb;
  @HiveField (15)
  String? ZipCode;
  @HiveField (16)
  String? ZipCodeArb;
  @HiveField (17)
  String? ContactNo;
  @HiveField (18)
  String? Email;
  @HiveField (19)
  String? TINNo;
  @HiveField (20)
  String? TINNoArb;
  @HiveField (21)
  String? CRN;
  @HiveField (22)
  String? CRNArb;
  @HiveField (23)
  String? OpnBal;
  @HiveField (24)
  String? PayType;
  @HiveField (25)
  String? Remarks;
  @HiveField (26)
  String? ContactNoArb;


  Customers(
      {this.ADDNo,this.State,this.ADDNoArb,this
          .BuildingNo,this.BuildingNoArb,this.City,this.CityArb,this.ContactNo,this.Country,
        this.CountryArb,this.CRN,this.CRNArb,required this.CustomerName,this.CustomerNameArb,
        this.Email,this.OpnBal,this.PayType,this.Remarks,this.StateArb,this.Street,this.StreetArb,this.TINNo,
        this.TINNoArb,this.ZipCode,this.ZipCodeArb,this.ContactNoArb}
      );
}



