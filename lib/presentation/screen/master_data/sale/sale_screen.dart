import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/presentation/controller/product_controller.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final ProductController productController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 500,
                        height: 500,
                        child: GridView.count(
                            crossAxisCount: 5,
                            children: productController.listOfProduct
                                .map(
                                  (item) => GridTile(
                                    child: SizedBox(
                                      width: 125,
                                      height: 125,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            width: 150,
                                            height: 50,
                                            child: Image(
                                              image:
                                                  AssetImage('asset/setec.png'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 125,
                                            height: 50,
                                            child: Column(
                                              children: [
                                                Text(
                                                  item.name,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  "\$ ${item.price}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList()),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: const Column(
                  children: [
                    Text('Sale Screen'),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
