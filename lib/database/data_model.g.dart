// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 0;

  @override
  Products read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Products(
      pdName: fields[0] as String,
      pdNameArb: fields[1] as String?,
      category: fields[2] as String?,
      subCategory: fields[3] as String?,
      openingStock: fields[8] as int?,
      purchacePrice: fields[7] as num?,
      unit: fields[4] as String?,
      reOrderPoint: fields[10] as num?,
      salePrice1: fields[5] as num?,
      salePrice2: fields[6] as num?,
      vatperc: fields[9] as num?,
      barCode: fields[11] as String?,
      imageUrl: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.pdName)
      ..writeByte(1)
      ..write(obj.pdNameArb)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.subCategory)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.salePrice1)
      ..writeByte(6)
      ..write(obj.salePrice2)
      ..writeByte(7)
      ..write(obj.purchacePrice)
      ..writeByte(8)
      ..write(obj.openingStock)
      ..writeByte(9)
      ..write(obj.vatperc)
      ..writeByte(10)
      ..write(obj.reOrderPoint)
      ..writeByte(11)
      ..write(obj.barCode)
      ..writeByte(12)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomersAdapter extends TypeAdapter<Customers> {
  @override
  final int typeId = 1;

  @override
  Customers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Customers(
      ADDNo: fields[7] as String?,
      State: fields[11] as String?,
      ADDNoArb: fields[8] as String?,
      BuildingNo: fields[5] as String?,
      BuildingNoArb: fields[6] as String?,
      City: fields[9] as String?,
      CityArb: fields[10] as String?,
      ContactNo: fields[17] as String?,
      Country: fields[13] as String?,
      CountryArb: fields[14] as String?,
      CRN: fields[21] as String?,
      CRNArb: fields[22] as String?,
      CustomerName: fields[1] as String?,
      CustomerNameArb: fields[2] as String?,
      Email: fields[18] as String?,
      OpnBal: fields[23] as String?,
      PayType: fields[24] as String?,
      Remarks: fields[25] as String?,
      StateArb: fields[12] as String?,
      Street: fields[3] as String?,
      StreetArb: fields[4] as String?,
      TINNo: fields[19] as String?,
      TINNoArb: fields[20] as String?,
      ZipCode: fields[15] as String?,
      ZipCodeArb: fields[16] as String?,
      ContactNoArb: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Customers obj) {
    writer
      ..writeByte(26)
      ..writeByte(1)
      ..write(obj.CustomerName)
      ..writeByte(2)
      ..write(obj.CustomerNameArb)
      ..writeByte(3)
      ..write(obj.Street)
      ..writeByte(4)
      ..write(obj.StreetArb)
      ..writeByte(5)
      ..write(obj.BuildingNo)
      ..writeByte(6)
      ..write(obj.BuildingNoArb)
      ..writeByte(7)
      ..write(obj.ADDNo)
      ..writeByte(8)
      ..write(obj.ADDNoArb)
      ..writeByte(9)
      ..write(obj.City)
      ..writeByte(10)
      ..write(obj.CityArb)
      ..writeByte(11)
      ..write(obj.State)
      ..writeByte(12)
      ..write(obj.StateArb)
      ..writeByte(13)
      ..write(obj.Country)
      ..writeByte(14)
      ..write(obj.CountryArb)
      ..writeByte(15)
      ..write(obj.ZipCode)
      ..writeByte(16)
      ..write(obj.ZipCodeArb)
      ..writeByte(17)
      ..write(obj.ContactNo)
      ..writeByte(18)
      ..write(obj.Email)
      ..writeByte(19)
      ..write(obj.TINNo)
      ..writeByte(20)
      ..write(obj.TINNoArb)
      ..writeByte(21)
      ..write(obj.CRN)
      ..writeByte(22)
      ..write(obj.CRNArb)
      ..writeByte(23)
      ..write(obj.OpnBal)
      ..writeByte(24)
      ..write(obj.PayType)
      ..writeByte(25)
      ..write(obj.Remarks)
      ..writeByte(26)
      ..write(obj.ContactNoArb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
