import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee1/controller/home_controller.dart';
import 'drop_down.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add product', style: TextStyle(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('New Product', style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),),
                TextField(
                    controller: ctrl.ProductNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)
                      ),
                      label: const Text('Product Name'),
                      hintText: 'Enter product name'
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.ProductDescriptionCtrl,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)
                      ),
                      label: const Text('Product Description'),
                      hintText: 'Enter product Description'
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                    controller: ctrl.ProductImgCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)
                      ),
                      label: const Text('Image URL'),
                      hintText: 'Enter Image URL'
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                    controller: ctrl.ProductPriceCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)
                      ),
                      label: const Text('Product Price'),
                      hintText: 'Enter product Price'
                  ),
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    DropDown(
                      items: ['Basic Mobile', 'Feature Mobile', 'Smart Phone'],
                      selectedItemText: ctrl.category,
                      onselected: (selectedValue) {
                        ctrl.category = selectedValue?? 'general';
                        ctrl.update();
                      },),
                    SizedBox(height: 8,),
                    DropDown(items: ['Samsung', 'Apple', 'Realme', 'Moto'],
                      selectedItemText: ctrl.brand,
                      onselected: (selectedValue) {
                      ctrl.brand = selectedValue??'un brand';
                      ctrl.update();
                      },),
                    SizedBox(height: 7,),
                    Text('offer', style: TextStyle(fontSize: 20),),
                    DropDown(
                      items: ['true', 'false'],
                      selectedItemText:ctrl.offer.toString() ,
                      onselected: (selectedValue) {
                        ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                            ctrl.update();
                      },),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          ctrl.addProduct();
                        },
                        child: Text('Add Product',))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
