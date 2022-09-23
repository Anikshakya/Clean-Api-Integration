
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/getxcontroller.dart';
class Ramen extends StatefulWidget {
  const Ramen({Key? key}) : super(key: key);

  @override
  State<Ramen> createState() => _HomeAndLivingState();
}

class _HomeAndLivingState extends State<Ramen> {
  final controller = Get.put(CartController());
  bool? loading;

  @override
  void initState() {
    initialize();
    super.initState();
  }
  initialize()async{
    await controller.getCartItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: GetBuilder(
            init: CartController(),
            builder: (_) {
              return Obx(
                () => controller.isLoading.value
                    ? SizedBox(
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 0.0, bottom: 20),
                            child: Container(
                              color: Colors.white,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.cartItems.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      color: Colors.blue,
                                      child: Text(controller.cartItems[index].id.toString()),
                                        );
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          )
                        ],
                      ),
              );
            }),
      ),
    ));
  }
}
