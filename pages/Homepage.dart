import 'package:shopee1/controller/home_controller.dart';
import 'package:shopee1/pages/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(

        appBar: AppBar(
          title: Text('Taggee'),
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(ctrl.products[index].name ?? ''),
                subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                  ctrl.deleteProduct(ctrl.products[index].id ?? '');
                  },),
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            Get.to(AddProduct());
          },
          child: Icon(Icons.add,color: Colors.white70,),),
      );
    });
  }
}
