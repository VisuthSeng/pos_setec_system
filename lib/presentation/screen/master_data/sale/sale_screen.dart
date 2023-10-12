import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_setec_system/core/util/Uid.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import 'package:pos_setec_system/data/model/customer_model.dart';
import 'package:pos_setec_system/data/model/product_model.dart';
import 'package:pos_setec_system/data/model/sale_detail_model.dart';
import 'package:pos_setec_system/data/model/sale_model.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';
import 'package:pos_setec_system/presentation/controller/sale_controller.dart';
import 'package:pos_setec_system/presentation/screen/master_data/customer/customer_form.dart';
import 'package:pos_setec_system/presentation/screen/master_data/sale/component/sale_header_item_tab.dart';
import 'package:pos_setec_system/presentation/util/browse_customer.dart';
import 'package:pos_setec_system/presentation/widget/button_icon.dart';
import 'package:pos_setec_system/presentation/widget/button_text.dart';
import 'package:pos_setec_system/presentation/widget/label_textbox_browse.dart';
import '../../../widget/pop_up_form.dart';
import 'component/sale_header.dart';
import 'package:pos_setec_system/presentation/screen/master_data/sale/component/sale_order_item.dart';
import '../../../controller/product_controller.dart';
import 'component/sale_item.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final ProductController productController = Get.find();
  final CategoryController categoryController = Get.find();
  final CustomerController customerController = Get.find();
  final SaleController saleController = Get.find();

  late TextEditingController tecSearch;
  late TextEditingController tecCustomer;
  late FocusNode fnSearch;
  late FocusNode fnCustomer;

  late CategoryModel? selectedCategory;
  late ProductModel? selectedProduct;

  late CustomerModel customerModel;
  List<ProductModel> listProduct = [];
  List<SaleDetailModel> listSaleDetail = [];
  double totalPrice = 0.0;
  double tax = 0.0;
  double grandTotal = 0.0;
  bool printInvoice = false;

  @override
  void initState() {
    selectedCategory = null;
    categoryController.listOfCategory();
    listProduct.assignAll(productController.listOfProduct);
    tecSearch = TextEditingController();
    tecCustomer = TextEditingController();
    fnSearch = FocusNode();
    fnCustomer = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    tecSearch.dispose();
    tecCustomer.dispose();
    fnCustomer.dispose();
    fnSearch.dispose();

    super.dispose();
  }

  void calculateToGrandTotal() {
    tax = totalPrice * 10 / 100;
    grandTotal = totalPrice + tax;
  }

  void addOrder(ProductModel model) {
    if (model.qty == 0) {
      // Don't add items with qty == 0
      return;
    }

    // Find an item with the same productName in the listOrder
    SaleDetailModel existingItem;
    try {
      existingItem = listSaleDetail.firstWhere(
        (item) => item.productName == model.name,
      );
      // If the item exists, increment its quantity
      totalPrice += existingItem.price;
      calculateToGrandTotal();
      existingItem.qty += 1;
    } catch (e) {
      // If the item doesn't exist, add a new item to the listOrder
      var order = SaleDetailModel(
        id: UId.getId(),
        productName: model.name,
        qty: 1, // Initialize qty to 1 for a new item
        img: model.img,
        price: model.price,
        discount: 0,
        amount: 0,
      );
      totalPrice += order.price;
      calculateToGrandTotal();
      listSaleDetail.add(order);
    }
  }

  void increaseOrder(SaleDetailModel model) {
    SaleDetailModel existingItem;
    try {
      existingItem = listSaleDetail.firstWhere(
        (item) => item.productName == model.productName,
      );
      // If the item exists, increment its quantity
      if (existingItem.qty > 0) {
        model.qty - existingItem.qty;
        existingItem.qty += 1;
        totalPrice += model.price;
        calculateToGrandTotal();
      }
    } catch (e) {
      // If the item doesn't exist, add a new item to the listOrder
    }
  }

  void removeOrder(SaleDetailModel model) {
    SaleDetailModel existingItem;
    try {
      existingItem = listSaleDetail.firstWhere(
        (item) => item.productName == model.productName,
      );
      // If the item exists, increment its quantity
      if (existingItem.qty > 1) {
        totalPrice -= model.price;
        calculateToGrandTotal();

        existingItem.qty -= 1;
        model.qty += 1;
      } else {
        model.qty += 1;
        totalPrice -= model.price;
        calculateToGrandTotal();
        listSaleDetail.remove(model);
      }
    } catch (e) {
      // If the item doesn't exist, add a new item to the listOrder
    }
  }

  void selectProduct(ProductModel? model) {
    selectedProduct = model;
  }

  void selectCategory(CategoryModel? model) {
    selectedCategory = model;
  }

  void loadProductsByCategory(CategoryModel model) {
    // Filter products based on the selected category
    selectedProduct = null;
    listProduct.clear();
    listProduct.assignAll(productController.listAllProduct.where(
      (product) => product.categoryModel == model,
    ));
  }

  Future<void> previewInvoice() async {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        margin:
            const pw.EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          //child: pw.Image(pw.MemoryImage(img)),
          return pw.Padding(
            padding: const pw.EdgeInsets.only(
                top: -10, left: 20, right: 20, bottom: 20),
            child: pw.Column(
              children: [
                pw.SizedBox(
                  height: 30,
                  child: pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        'Receipt',
                        style: const pw.TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(height: 15),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Receipt No : No Invoice'),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('Customer : '),
                            pw.Text(tecCustomer.text),
                          ],
                        ),
                        pw.Text(
                          DateFormat('dd-MM-yy').format(DateTime.now()),
                        ),
                        pw.Text(
                          DateFormat('hh-mm-ss a').format(DateTime.now()),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.SizedBox(
                  height: 30,
                  child: pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 260,
                        child: pw.Text(
                          'Product',
                          style: const pw.TextStyle(fontSize: 13),
                        ),
                      ),
                      pw.SizedBox(
                        width: 130,
                        child: pw.Text(
                          'Qty',
                          style: const pw.TextStyle(fontSize: 13),
                        ),
                      ),
                      pw.SizedBox(
                        width: 100,
                        child: pw.Text(
                          'Unit Price',
                          style: const pw.TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Column(
                    children: listSaleDetail
                        .map((model) => pw.Row(children: [
                              pw.SizedBox(
                                width: 260,
                                child: pw.Text(
                                  model.productName,
                                  style: const pw.TextStyle(fontSize: 13),
                                ),
                              ),
                              pw.SizedBox(
                                width: 130,
                                child: pw.Text(
                                  ' ${model.qty.toString()} ',
                                  style: const pw.TextStyle(fontSize: 13),
                                ),
                              ),
                              pw.SizedBox(
                                width: 100,
                                child: pw.Text(
                                  '\$ ${model.price.toString()}',
                                  style: const pw.TextStyle(fontSize: 13),
                                ),
                              ),
                              pw.SizedBox(height: 20),
                            ]))
                        .toList()),
                pw.SizedBox(height: 20),
                pw.Row(
                  children: [
                    pw.SizedBox(
                      width: 300,
                    ),
                    pw.SizedBox(
                      width: 150,
                      child: pw.Text(
                        'Total Amount :',
                        style: const pw.TextStyle(fontSize: 14),
                      ),
                    ),
                    pw.SizedBox(
                      width: 100,
                      child: pw.Text(
                        '\$ ${totalPrice.toString()}',
                        style: const pw.TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  children: [
                    pw.SizedBox(
                      width: 300,
                    ),
                    pw.SizedBox(
                      width: 150,
                      child: pw.Text(
                        'Tax  :',
                        style: const pw.TextStyle(fontSize: 14),
                      ),
                    ),
                    pw.SizedBox(
                      width: 100,
                      child: pw.Text(
                        '\$ ${tax.toString()}',
                        style: const pw.TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  children: [
                    pw.SizedBox(
                      width: 300,
                    ),
                    pw.SizedBox(
                      width: 150,
                      child: pw.Text(
                        'Grand Total :',
                        style: const pw.TextStyle(fontSize: 14),
                      ),
                    ),
                    pw.SizedBox(
                      width: 100,
                      child: pw.Text(
                        '\$ ${grandTotal.toString()}',
                        style: const pw.TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
    setState(() {
      listSaleDetail.clear();
      tecCustomer.clear();
      customerModel = customerController.blankCustomer;
    });
    if (mounted) Navigator.pop(context);
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        // This is the content of the dialog
        return AlertDialog(
          title: const Text('Choose Customer'),
          content: SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 180,
                  child: LabelTextboxBrowse(
                    height: 40,
                    label: 'Customer',
                    controller: tecCustomer,
                    onBrowse: () {
                      browseCustomer(context);
                    },
                    isReadOnly: true,
                  ),
                ),
                ButtonIcon(
                    width: 20,
                    height: 50,
                    icon: Icons.add,
                    onPress: () {
                      Get.to(() => const CustomerForm());
                    })
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Text('Confirm'),
                  onPressed: () async {
                    await saveData();

                    previewInvoice();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
    setState(() {
      listProduct.assignAll(productController.listOfProduct);
    });
  }

  void browseCustomer(BuildContext context) {
    PopUpForm.fromRight(
      context: context,
      child: BrowseCustomer(
        onSelected: (model) {
          setState(() {
            customerModel = model;
            tecCustomer.text = model.name;
          });
        },
      ),
    );
  }

  Future<void> saveData() async {
    var model = SaleModel(
        id: UId.getId(),
        invoice: 'SETEC/P0101001',
        customerName: tecCustomer.text,
        createAt: DateTime.now(),
        total: totalPrice,
        listSaleDetail: listSaleDetail);

    await saleController.saveData(model);

    for (var saleDetail in listSaleDetail) {
      for (var product in listProduct) {
        if (saleDetail.productName == product.name) {
          // Subtract the quantity from the saleDetail
          var qty = product.qty - saleDetail.qty;
          // You can also update any other properties as needed
          productController.updateData(product.copyWith(qty: qty));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return categoryController.listOfCategory.isEmpty
            ? const SizedBox.shrink()
            : Container(
                width: constraints.maxWidth,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 14,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SaleHeader(
                              title: 'SETEC MART',
                              subTitle: '10/09/2023',
                              widget: ButtonText(
                                  height: 40,
                                  title: 'All Product',
                                  tooltip: 'All Product',
                                  onPress: () {
                                    setState(() {
                                      listProduct.assignAll(
                                          productController.listOfProduct);
                                      selectedCategory = null;
                                    });
                                  }),
                            ),
                            Container(
                              height: 100,
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: categoryController.listOfCategory
                                    .asMap()
                                    .entries
                                    .map(
                                  (entry) {
                                    final model = entry.value;
                                    return SaleHeaderItemTab(
                                      ontap: () {
                                        setState(() {
                                          loadProductsByCategory(model);
                                          selectedCategory =
                                              model; // Update the selectedCategory based on the index
                                        });
                                      },
                                      icon: model.img,
                                      title: model.name,
                                      color: selectedCategory == model
                                          ? Colors.orangeAccent
                                          : const Color(0xff1f2029),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(
                              height: constraints.maxHeight - 161,
                              child: GridView.count(
                                  crossAxisCount: 4,
                                  childAspectRatio:
                                      0.7, // Adjust this value as needed
                                  children: listProduct
                                      .map(
                                        (model) => SaleItem(
                                          image: model.img,
                                          title: 'Original Burger',
                                          price: model.price.toString(),
                                          item: '11 item',
                                          productModel: model,
                                          onPress: () async {
                                            setState(() {
                                              addOrder(model);
                                            });
                                          },
                                        ),
                                      )
                                      .toList()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SaleHeader(
                                title: 'Order',
                                subTitle: 'Table 8',
                                widget: Container()),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView(
                                  children: listSaleDetail
                                      .map(
                                        (model) => SaleOrderItem(
                                          image: model.img,
                                          title: model.productName,
                                          qty: model.qty.toString(),
                                          price: '\$ ${model.price}',
                                          remove: () {
                                            setState(() {
                                              removeOrder(model);
                                            });
                                          },
                                          add: () {
                                            setState(() {
                                              increaseOrder(model);
                                            });
                                          },
                                        ),
                                      )
                                      .toList()),
                            ),
                            if (listSaleDetail.isNotEmpty)
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xff1f2029),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Subtotal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\$ $totalPrice',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Tax',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\$ $tax',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        height: 2,
                                        width: double.infinity,
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Grand Total',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\$ $grandTotal',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.deepOrange,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          _showDialog(context);
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.print, size: 16),
                                            SizedBox(width: 6),
                                            Text('Print Bills')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
