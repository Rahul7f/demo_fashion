// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      productCount: fields[0] as num?,
      products: (fields[1] as List?)?.cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.productCount)
      ..writeByte(1)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 2;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      season: fields[0] as String?,
      brand: fields[1] as String?,
      mood: fields[2] as String?,
      gender: fields[3] as String?,
      theme: fields[4] as String?,
      category: fields[5] as String?,
      name: fields[6] as String?,
      color: fields[7] as String?,
      option: fields[8] as String?,
      mrp: fields[9] as num?,
      subCategory: fields[10] as String?,
      collection: fields[11] as String?,
      fit: fields[12] as String?,
      description: fields[13] as String?,
      qrCode: fields[14] as String?,
      looks: fields[15] as String?,
      looksImageUrl: fields[16] as dynamic,
      looksImage: fields[17] as dynamic,
      fabric: fields[18] as String?,
      finish: fields[19] as String?,
      availableSizes: (fields[20] as List?)?.cast<String>(),
      material: fields[21] as String?,
      quality: fields[22] as String?,
      qrCode2: fields[23] as String?,
      displayName: fields[24] as String?,
      displayOrder: fields[25] as num?,
      minQuantity: fields[26] as num?,
      maxQuantity: fields[27] as num?,
      qpsCode: fields[28] as String?,
      demandType: fields[29] as dynamic,
      image: fields[30] as String?,
      imageUrl: fields[31] as dynamic,
      imageUrl2: fields[32] as dynamic,
      imageUrl3: fields[33] as dynamic,
      imageUrl4: fields[34] as dynamic,
      imageUrl5: fields[35] as dynamic,
      imageUrl6: fields[36] as dynamic,
      imageUrl7: fields[37] as dynamic,
      imageUrl8: fields[38] as dynamic,
      imageUrl9: fields[39] as dynamic,
      imageUrl10: fields[40] as dynamic,
      imageUrl11: fields[41] as dynamic,
      imageUrl12: fields[42] as dynamic,
      technology: fields[43] as String?,
      imageAlt: fields[44] as String?,
      technologyImage: fields[45] as dynamic,
      technologyImageUrl: fields[46] as dynamic,
      isCore: fields[47] as bool?,
      minimumArticleQuantity: fields[48] as num?,
      likeabilty: fields[49] as double?,
      brandRank: fields[50] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(51)
      ..writeByte(0)
      ..write(obj.season)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.mood)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.theme)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.option)
      ..writeByte(9)
      ..write(obj.mrp)
      ..writeByte(10)
      ..write(obj.subCategory)
      ..writeByte(11)
      ..write(obj.collection)
      ..writeByte(12)
      ..write(obj.fit)
      ..writeByte(13)
      ..write(obj.description)
      ..writeByte(14)
      ..write(obj.qrCode)
      ..writeByte(15)
      ..write(obj.looks)
      ..writeByte(16)
      ..write(obj.looksImageUrl)
      ..writeByte(17)
      ..write(obj.looksImage)
      ..writeByte(18)
      ..write(obj.fabric)
      ..writeByte(19)
      ..write(obj.finish)
      ..writeByte(20)
      ..write(obj.availableSizes)
      ..writeByte(21)
      ..write(obj.material)
      ..writeByte(22)
      ..write(obj.quality)
      ..writeByte(23)
      ..write(obj.qrCode2)
      ..writeByte(24)
      ..write(obj.displayName)
      ..writeByte(25)
      ..write(obj.displayOrder)
      ..writeByte(26)
      ..write(obj.minQuantity)
      ..writeByte(27)
      ..write(obj.maxQuantity)
      ..writeByte(28)
      ..write(obj.qpsCode)
      ..writeByte(29)
      ..write(obj.demandType)
      ..writeByte(30)
      ..write(obj.image)
      ..writeByte(31)
      ..write(obj.imageUrl)
      ..writeByte(32)
      ..write(obj.imageUrl2)
      ..writeByte(33)
      ..write(obj.imageUrl3)
      ..writeByte(34)
      ..write(obj.imageUrl4)
      ..writeByte(35)
      ..write(obj.imageUrl5)
      ..writeByte(36)
      ..write(obj.imageUrl6)
      ..writeByte(37)
      ..write(obj.imageUrl7)
      ..writeByte(38)
      ..write(obj.imageUrl8)
      ..writeByte(39)
      ..write(obj.imageUrl9)
      ..writeByte(40)
      ..write(obj.imageUrl10)
      ..writeByte(41)
      ..write(obj.imageUrl11)
      ..writeByte(42)
      ..write(obj.imageUrl12)
      ..writeByte(43)
      ..write(obj.technology)
      ..writeByte(44)
      ..write(obj.imageAlt)
      ..writeByte(45)
      ..write(obj.technologyImage)
      ..writeByte(46)
      ..write(obj.technologyImageUrl)
      ..writeByte(47)
      ..write(obj.isCore)
      ..writeByte(48)
      ..write(obj.minimumArticleQuantity)
      ..writeByte(49)
      ..write(obj.likeabilty)
      ..writeByte(50)
      ..write(obj.brandRank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
