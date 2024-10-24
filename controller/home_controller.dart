import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product.dart';

class HomeController extends GetxController{
FirebaseFirestore firestore = FirebaseFirestore.instance;
late CollectionReference productCollection;
TextEditingController ProductNameCtrl = TextEditingController();
TextEditingController ProductDescriptionCtrl = TextEditingController();
TextEditingController ProductImgCtrl = TextEditingController();
TextEditingController ProductPriceCtrl = TextEditingController();
String category='general';
String brand='un brand';
bool offer=false;

List<Product> products = [];


@override
  Future<void> onInit() async {
  productCollection = firestore.collection('Mobile');
  await fetchProduct();
  super.onInit();
}
addProduct(){
  try {
    DocumentReference doc = productCollection.doc();
    Product product = Product(
        id:doc.id,
        name: ProductNameCtrl.text,
        category: category,
        description: ProductDescriptionCtrl.text ,
        price: double.tryParse(ProductPriceCtrl.text) ,
        brand: brand ,
        image: ProductImgCtrl.text,
        offer: offer,
      );
    final productJson = product.toJson();
    doc.set(productJson);
    Get.snackbar('success','Product added Suucessfully',colorText:Colors.green);
    setValueDefualt();
  } catch (e) {
    Get.snackbar('Error',e.toString(),colorText:Colors .green);
    print(e);

  }
}
fetchProduct() async {
  try {
    QuerySnapshot productSnapshot = await productCollection.get();
    final List<Product> retrievedProduct = productSnapshot.docs.map((doc) =>
        Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
    products.clear();
    products.assignAll(retrievedProduct);
    Get.snackbar('success', 'product fetch successfully',colorText: Colors.green);
  } catch (e) {
    Get.snackbar('Error', e.toString(),colorText: Colors.red);

    print(e);
  }
  finally{
    update();
  }

}
deleteProduct(String id) async{
  try {
    await productCollection.doc(id).delete();
    fetchProduct();
  } catch (e) {
    Get.snackbar('Error',e.toString(),colorText:Colors.red);

    print(e);
  }
}

setValueDefualt(){
  ProductNameCtrl.clear();
  ProductDescriptionCtrl.clear();
  ProductImgCtrl.clear();
  ProductPriceCtrl.clear();
  category='general';
   brand='un brand';
   offer=false;
   update();
}
}